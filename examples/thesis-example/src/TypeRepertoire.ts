/* @flow strict */
/************************************************************ 'Type Repertoire' ************************************************************/ 
export const round: (_: number) => number = Math.round;
// export const round: (number) = 3;


// Basic Type Literals ************************************************************
export const integerValue = 3;                // number
export const floatValue = 3.4;                // number
export const binaryValue = 0b1010;            // number
export const booleanValue = false;            // boolean
export const stringValue = "string";          // string

// Basic Structure Literals ************************************************************
// list
export const integerList = [1, 2, 3];                       // number[]
export const integerList2 : number[] = [1, 2, 3];           // number[]
export const integerList3 : Array<number> = [1, 2, 3];      // number[], Array<number> : same thing.

// tuple
export const intstrTuple = [3, "hello"];                    // (string | number)[]
export const intstrTuple2: [number, string] = [3, "hello"]; // [number, string]

// enum
export enum Color { Red, Green, Blue };                     // enum Color
export const enumValue = Color.Green;                       // Color.Green

// objects
type pointOptional = { x: number; y?: number };
type pointRequired = { x: number; y: number };
export const objectSimple = { x : 3, y : 7};                // equivalent to pointRequired
export const objectComplex = { object : objectSimple, deep : { deepdeep : { object1 : objectSimple }}, id : 2}; // complex object

// function
export const funcInt2Int = function(num: number): number {  // number => number
  return 1;
}
export const funcStr2Array = function(str: string): number[] {  // string => number[]
  return [1, 2, 3];
}
export const funcPoint2Point = function(point: pointOptional): pointRequired {  // pointOptional => pointRequired
  return { x: 1, y: 3};
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


// interface
interface interface1 {
  title: string;
}
export const interfaceInstance : interface1 = {
  title : 'hi'
};

// tslint:disable-next-line:only-arrow-functions
export const area = function(point: { x: number; y?: number }): number {
  return point.x * (point.y === undefined ? 1 : point.y);
};

export type numberOrString = number | string;

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

export type stringFunction = (_: string) => string;

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
