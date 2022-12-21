/* TypeScript file generated from RescriptExample.res by genType. */
/* eslint-disable import/first */


import {myRound as myRoundNotChecked} from './TypeScript';

// In case of type error, check the type of 'myRound' in 'RescriptExample.re' and './TypeScript'.
/* myRound | TS: [] | RES: [(_1:number) => number] */
export const myRoundTypeChecked: (_1:number) => number = myRoundNotChecked;

// Export 'myRound' early to allow circular import from the '.bs.js' file.
export const myRound: unknown = myRoundTypeChecked as (_1:number) => number;

// Hi this is the point where string is finally emitted!! VKJY
