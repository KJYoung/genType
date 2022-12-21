/* TypeScript file generated from RescriptExample.res by genType. */
/* eslint-disable import/first */


import {myRound as myRoundNotChecked} from './TypeScript.js';

// In case of type error, check the type of 'myRound' in 'RescriptExample.re' and './TypeScript'.
/* myRound | TS: [] | RES: [(_1:number) => number] */
export const myRoundTypeChecked = myRoundNotChecked;

// Export 'myRound' early to allow circular import from the '.bs.js' file.
export const myRound = myRoundTypeChecked;

// Hi this is the point where string is finally emitted!! VKJY
