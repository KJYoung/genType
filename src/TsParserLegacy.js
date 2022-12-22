// 2022 12 22 변경 전.
// import {TypescriptParser} from "typescript-parser";
const TypescriptParser = require("typescript-parser");
const fs = require("fs");

const parser = new TypescriptParser.TypescriptParser();
let targetFile;
process.argv.forEach(async (val, index) => {
    if ( index === 2 ){
      let tsFile = `${val}.ts`;
      let tsxFile = `${val}.tsx`;
      if(fs.existsSync(tsFile)){
        targetFile = tsFile;
      }else if(fs.existsSync(tsxFile)){
        targetFile = tsxFile;
      }else{
        console.log(val);
        targetFile = -1;
      }
    }else if ( index >= 3 && targetFile !== -1 ){  // [0] : node, [1] tsparser.js, [2] target ts file
        const parsed = await parser.parseFile(targetFile, "workspace root");
        let found = false;
        parsed.declarations.forEach(declaration => {
            if(declaration.name === val){
                // console.log(`${val} declaration type is : ${declaration.type}`);
                fs.writeFile(`${targetFile}_${val}.temp.txt`, declaration.type ? declaration.type : "Complicated or Undefined", (err) => {
                    // In case of a error throw err.
                    if (err) throw err;
                })
                // process.stdout.write(declaration.type ? declaration.type : "Complicated or Undefined");
                found = true;
            }
        });
        if(found === false){
          fs.writeFile(`${targetFile}_${val}.temp.txt`, "Default or NotFound", (err) => {
                    // In case of a error throw err.
                    if (err) throw err;
            })
        }
    }
});


