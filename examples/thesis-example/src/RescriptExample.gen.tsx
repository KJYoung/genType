/* TypeScript file generated from RescriptExample.res by genType. */
/* eslint-disable import/first */


import {myRound as myRoundNotChecked} from './TypeScript';

// In case of type error, check the type of 'myRound' in 'RescriptExample.re' and './TypeScript'.
/* myRound | TS: [number => unknown] | RES: [(_1:string) => string] */
export const myRoundTypeChecked: (_1:string) => string = myRoundNotChecked;

// Export 'myRound' early to allow circular import from the '.bs.js' file.
export const myRound: unknown = myRoundTypeChecked as (_1:string) => string;

// Hi this is the point where string is finally emitted!! VKJY
