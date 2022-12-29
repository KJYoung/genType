# ReScript genType

`genType` lets you export [ReScript](https://rescript-lang.org/) values and types to use in JavaScript, and import JavaScript values and types into ReScript, idiomatically. Converter functions between the two representations are generated based on the type of the value. The converters can be generated in vanilla JavaScript, or in [TypeScript](https://www.typescriptlang.org/) / [Flow](https://flow.org/en/) for a type-safe idiomatic interface.

Go to [ReScript GenType](https://github.com/rescript-association/genType) for original module & documentation.   

# Installation

Install the binaries via `npm`:

```
npm install --save-dev gentype
```

Add a `gentypeconfig` section to your `bsconfig.json` (See [Configuration](#configuration) for details):

```json
"gentypeconfig": {
    "language": "untyped",
    "shims": {},
    "debug": {
      "all": false,
      "basic": false
    },
    "typeCheck": true
}
```
typeCheck option for static type check in TypeScript code.   

# Additional Documentation

This repository is for the basic(or slack) support for GenType's static type check.   
The motivation was the absence of type checking for JavaScript or TypeScript import.   
For example, assume a function `myRound : float => string` in TypeScript code(as TS has only number type, the exact type would be `number => number`) and assume one wants to import that function from ReScript code. Then, one can write codes as below.   

```ReScript
@genType.import("./myMath")
external roundFromTS: float => int = "myRound"
let roundedEx = roundFromTS(3.74)
```

However, as far as I know, the type annotation in ReScript(`float => int`) is not checked during compilation. Therefore, if one wrote a wrong type annotation, then the type error should be manually by the developer. As a result, if GenType has some option to enable static type checking in cooperate with Flow or TypeScript type system, then the type system would be more robust, I guess.
