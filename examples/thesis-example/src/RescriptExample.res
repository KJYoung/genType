let author = "@KJYoung"
let greetingStr = "Hi! This is " ++ author

type fruits = Apple | Other
let fruitInstance = Apple

let displayStr = (fruit, ~msg, ~loop) => {
    for i in 1 to loop{
        switch fruit {
            | Apple => Js.log(Belt.Int.toString(i) ++ ": " ++ msg ++ " with Apple")
            | _ => Js.log("Other Fruit")
        }
    }
}

displayStr(fruitInstance, ~msg=greetingStr, ~loop=3);


// // JavaScript Math.round Import ( Wrong Type Annotation )
// @val external math: { "round" : string => int } = "Math"
// let roundedValueJS = math["round"](3.74)

// // JavaScript Math.round Import ( Wrong Type Annotation )
// @val external math: { "round" : float => string } = "Math"


// let roundedValueJS = math["round"](3.74)

// JavaScript Math.round Import
@val external math: { "round" : float => int } = "Math"
let roundedValueJS = math["round"](3.74)

// // TypeScript Custom round function Import
// @genType.import("./TypeScript")
// external roundFromTS: float => int = "myRound"
// let roundedValueTS = roundFromTS(3.74)

// // TypeScript Custom round function Import (Wrong Type Annotation)
// @genType.import("./TypeScript")
// external roundFromTS: string => int = "myRound"
// let roundedValueTS = roundFromTS(3.74)

// TypeScript Custom round function Import (Wrong Type Annnotation)
@genType.import("./TypeScript")
external roundFromTS: string => string = "myRound"
let roundedValueTS = roundFromTS("Not a Float")
  
Js.log2("JavaScript", roundedValueJS)
Js.log2("TypeScript", roundedValueTS)


// JavaScript Math.round Import
@val external mathCorrect: { "round" : float => int } = "Math"
@val external mathWrong1: { "round" : float => string } = "Math"
@val external mathWrong2: { "round" : float => unit } = "Math"

let rounded1 = mathCorrect["round"](3.5)
let rounded2 = mathWrong1["round"](3.5)
let rounded3 = mathWrong2["round"](3.5)

Js.log(rounded1)
Js.log(rounded2)
Js.log(rounded3)