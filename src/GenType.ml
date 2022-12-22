open GenTypeCommon
let tsparser = 
  "echo '// import {TypescriptParser} from \"typescript-parser\";
const TypescriptParser = require(\"typescript-parser\");
const fs = require(\"fs\");

const main = async () => {
  const parser = new TypescriptParser.TypescriptParser();
  let targetFile;

  let fileID = process.argv[2];
  let tsFile = `${fileID}.ts`;
  let tsxFile = `${fileID}.tsx`;
  let fileName =  fileID.slice(fileID.lastIndexOf(\"/\") + 1);

  if(fs.existsSync(tsFile)){
    targetFile = tsFile;
  }else if(fs.existsSync(tsxFile)){
    targetFile = tsxFile;
  }else{
    console.log(fileID);
    targetFile = -1;
  }

  if(targetFile !== -1){
    const parsed = await parser.parseFile(targetFile, \"workspace root\");
    parsed.declarations.forEach(declaration => {
        const outFile = `${fileName}_${declaration.name}.temp.txt`;
        fs.writeFile(outFile, declaration.type ? declaration.type : \"Complicated or Undefined\", (err) => {
            if (err) throw err;
        })
    });
  }
}
main();
' > tsparser.js"
;;

let version = Version.version

let signFile s = s

type cliCommand = Add of string | Clean | NoOp | Rm of string list

(* let print_cliCommand cli =
  match cli with  
    | Add str -> print_endline ("ADD  " ^ str);
    | Clean -> print_endline "CLEAN";
    | NoOp -> print_endline "NoOp";
    | Rm (s::_) -> print_endline ("Rm" ^ s);
    | Rm [] -> print_endline ("Rm Empty");

;; *)

let cli () =
  let bsVersion = ref None in
  let cliCommand = ref NoOp in
  let setBsVersion s = bsVersion := Some s in
  let usage = "genType version " ^ version in
  let versionAndExit () =
    print_endline usage;
    exit 0
  in
  let rec printUsageAndExit () =
    Arg.usage speclist usage;
    exit 0
  and setCliCommand command =
    if !cliCommand <> NoOp then printUsageAndExit ();
    cliCommand := command
  and setAdd s = Add s |> setCliCommand
  and setRm s = Rm s |> setCliCommand
  and setClean () = Clean |> setCliCommand
  and speclist =
    [
      ("-bs-version", Arg.String setBsVersion, "set the bucklescript version");
      ("-clean", Arg.Unit setClean, "clean all the generated files");
      ("-cmt-add", Arg.String setAdd, "compile a .cmt[i] file");
      ( "-cmt-rm",
        Arg.String (fun s -> setRm [s]),
        "remove one or more .cmt[i] files" );
      ("-version", Arg.Unit versionAndExit, "show version information and exit");
      ("--version", Arg.Unit versionAndExit, "show version information and exit");
    ]
  in
  let executeCliCommand ~bsVersion cliCommand =
    match cliCommand with
    | Add s ->
      Log_.Color.forceColor := true;
      let splitColon = Str.split (Str.regexp ":") s in
      let cmt, mlast =
      match splitColon with
      | cmt :: rest ->
        let mlast = rest |> String.concat "" in
        (cmt, mlast)
        | _ -> assert false
      in
      (* let _ = print_endline ("[INFO] executeCliCommand : ADD [" ^ cmt ^ " ]\n Target : [" ^ mlast ^ "]") in  *)
      let config =
        Paths.readConfig ~bsVersion ~namespace:(cmt |> Paths.findNameSpace)
      in
      let _ = 
        if config.typeCheck then 
          let _ = print_endline "-- GenType KJY Executed --" in
          let _ = Sys.command "rm *.temp.txt 2> /dev/null" in
          let _ = Sys.command tsparser in
           ()
      in
      if !Debug.basic then Log_.item "Add %s  %s\n" cmt mlast;
      cmt |> GenTypeMain.processCmtFile ~signFile ~config;
      exit 0
    | Clean ->
      let config = Paths.readConfig ~bsVersion ~namespace:None in
      let sourceDirs =
        ModuleResolver.readSourceDirs ~configSources:config.sources
      in
      if !Debug.basic then
        Log_.item "Clean %d dirs\n" (sourceDirs.dirs |> List.length);
      let count = ref 0 in
      sourceDirs.dirs
      |> List.iter (fun dir ->
             let files = Sys.readdir dir in
             files
             |> Array.iter (fun file ->
                    if
                      Filename.check_suffix file ".re"
                      || Filename.check_suffix file ".res"
                    then
                      let extension = EmitType.outputFileSuffix ~config in
                      let generated =
                        Filename.concat dir
                          ((file |> Filename.chop_extension) ^ extension)
                      in
                      if Sys.file_exists generated then (
                        Unix.unlink generated;
                        incr count)));
      if !Debug.basic then Log_.item "Cleaned %d files\n" !count;
      exit 0
    | NoOp -> printUsageAndExit ()
    | Rm l ->
      let removeOne s =
        let cmtAbsolutePath = s in
        (* somehow the CMT hook is passing an absolute path here *)
        let cmt = cmtAbsolutePath |> Paths.relativePathFromBsLib in
        let config =
          Paths.readConfig ~bsVersion ~namespace:(cmt |> Paths.findNameSpace)
        in
        (* let _ = 
          if config.typeCheck then 
            let _ = print_endline "-- GenType KJY Executed --" in
            let _ = Sys.command tsparser in
             ()
        in *)
        let outputFile = cmt |> Paths.getOutputFile ~config in
        if !Debug.basic then Log_.item "Remove %s\n" cmt;
        if Sys.file_exists outputFile then Unix.unlink outputFile
      in
      l |> List.rev |> List.iter removeOne;
      exit 0
  in
  let anonArg s =
    match !cliCommand with
    | Rm l -> cliCommand := Rm (s :: l)
    | _ -> print_endline s
  in
  Arg.parse speclist anonArg usage;
  executeCliCommand ~bsVersion:!bsVersion !cliCommand

;;

cli ()
