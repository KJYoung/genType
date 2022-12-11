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

