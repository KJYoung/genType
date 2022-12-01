 // import {TypescriptParser} from "typescript-parser";
 const TypescriptParser = require("typescript-parser");
 const fs = require("fs");

 const parser = new TypescriptParser.TypescriptParser();
 let targetFile;
 process.argv.forEach(async (val, index) => {
     if ( index === 2 ){
       targetFile = val;
     }else if ( index >= 3 ){  // [0] : node, [1] tsparser.js, [2] target ts file
         const parsed = await parser.parseFile(targetFile, "workspace root");
         let found = false;
         parsed.declarations.forEach(declaration => {
             if(declaration.name === val){
                if ( declaration.type ){
                    console.log(`declaration type : ${declaration.type}`);
                }
                // console.log(val);
                // console.log(declaration);
                // console.log(declaration.type);
                //  fs.writeFile(`${val}.temp.txt`, declaration.type ? declaration.type : "Complicated or Undefined", (err) => {
                //      // In case of a error throw err.
                //      if (err) throw err;
                //  })
                 // process.stdout.write(declaration.type ? declaration.type : "Complicated or Undefined");
                 found = true;
             }
         });
         if(found === false){
        //    fs.writeFile(`${val}.temp.txt`, "Default or NotFound", (err) => {
        //              // In case of a error throw err.
        //              if (err) throw err;
        //      })
           console.log(`Not Found ${val}`);
         }
     }
 });

