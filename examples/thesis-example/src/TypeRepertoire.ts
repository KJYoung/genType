/* @flow strict */
/************************************************************ 'Type Repertoire' ************************************************************/ 
// Type Adaptors
export type numberOrString = number | string;
export type numberOrStringOrNull = number | string | null;
export type complexUnion = number[] | string | ((x : number) => number) | null | undefined;

// Basic Structure Literals ************************************************************
// list
export const integerList = [1, 2, 3];                       // number[]
export const complexList = [1, "s", false];                        // (string | number | boolean)[]
export const integerList2 : number[] = [1, 2, 3];           // number[]
export const integerList3 : Array<number> = [1, 2, 3];      // number[], Array<number> : same thing.

// tuple
export const intstrTuple = [3, "hello"];                    // (string | number)[]
export const intstrTuple2: [number, string] = [3, "hello"]; // [number, string]

// enum
export enum colorEnum { Red, Green, Blue };                     // enum Color
export const enumValue = colorEnum.Green;                       // Color.Green

// objects
type pointOptional = { x: number; y?: number };
type pointRequired = { x: number; y: number };
export const objectSimple = { x : 3, y : 7};                // equivalent to pointRequired
export const objectComplex = { object : objectSimple, deep : { deepdeep : { object1 : objectSimple }}, id : 2}; // complex object

// functions
export const funcInt2Int = function(num: number): number {  // number => number
  return 1;
}
export const funcInt2IntImplicit = function(num : number) {
  return num + 1;
}
export const funcStr2Array = function(str: string): number[] {  // string => number[]
  return [1, 2, 3];
}
export const funcPoint2Point = function(point: pointOptional): pointRequired {  // pointOptional => pointRequired
  return { x: 1, y: 3};
}
export const anotherFunction = (num : number) : number => {
  return Math.round(num);
}

// union types
export const intORstrORnull: number | string | null = 3; 
export const unions : number[] | string | ((x : number) => number) | null | undefined = '';

// two same types
type type1 = { x : number };
type type2 = { x : number };
export const same1 = { x : 3};
export const same2: type1 = { x : 3};
export const same3: type2 = { x : 3};
export const same2string = function(same : type1 | type2): string {
  return 'string';
}

// imported
import { importedFromTS } from "./TypeScript";
export const exportImport = importedFromTS;


// interface
interface interface1 {
  title: string;
}
export const interfaceInstance : interface1 = {
  title : 'hi'
};


export const returnMixedArray = function() : Array<number | string> {
  return [1,2];
};

export class AbsoluteValue {
  public prop!: number;
  public getProp(): number {
    return this.prop;
  }
  public getAbs(): number {
    return this.prop < 0 ? -this.prop : this.prop;
  }
}

// tslint:disable-next-line:only-arrow-functions
export const useColor = function(x: "tomato" | "gray"): number {
  return 0;
};

export const higherOrder = (foo: (_1: number, _2: number) => number) =>
  foo(3, 4);

export const convertVariant = (x: any) => x;

export const polymorphic = <T>(x: T): T => x;

export type num = number;

export type polyType<T> = { x: T };

export default 34;
