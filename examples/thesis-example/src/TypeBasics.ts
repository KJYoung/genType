/* @flow strict */
// Basic Type Literals ************************************************************
export const integerValue = 3;                // number
export const floatValue = 3.4;                // number
export const binaryValue = 0b1010;            // number
export const booleanValue = false;            // boolean
export const booleanValue2 = true;            // boolean
export const booleanValue3 = !false;          // boolean
export const stringValue = "string";          // string

// number => number
export const opValue1 = 3 + 4;                // number
export let   opValue2 = 3 + (4 * 3) / 3 % 2;    // number
export const opValue3 = opValue2++;           // number
export const opValue4 = opValue2 + 2;         // number
export const opValue5 = 3 | 3;                // number
export const opValue6 = 3 << 3;               // number
export const opValue7 = -3;                   // number
export const opValue8 = (opValue2 += opValue7);         // number

// number => boolean
export const opValue11 = opValue1 > opValue2;  // boolean
export const opValue12 = 3 <= 2;               // boolean

// boolean => boolean(or number)
export const opValue21 = true && false;        // boolean
export const opValue22 = true || false;        // boolean
export const opValue23 = true ? 3 : opValue2;  // number

// any => string
export const opValue31 = "33" + 2;             // string
export const opValue32 = 2 + ( 3 + ( true + ( "string" + 3)))  // string!
export const opValue33 = ("33") + (3);         // string

export const integerValueFromVar = integerValue;  // number
export const integerValueFromVarParen = (integerValue); // number
export const typeofInteger = typeof(3); // string

class Bar {

}
export const instanceofTest = ({name2 : "James"} instanceof Bar);