import {TypescriptParser} from "typescript-parser";

const parser = new TypescriptParser();

// or a filepath
process.argv.forEach(async (val, index) => {
    if ( index >= 2){  // [0] : node, [1] tsparser.js
        const parsed = await parser.parseFile('./src/MyMath.ts', 'workspace root');
        let found = false;
        parsed.declarations.forEach(declaration => {
            if(declaration.name === val){
                console.log(declaration.type);
                found = true;
            }
        });
        if(found === false){
            console.log(`Not Found ${val}`);
        }
    }
});