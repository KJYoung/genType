/* TypeScript file generated from TargetProblem.res by genType. */
/* eslint-disable import/first */


import {funcInt2Int2 as funcInt2Int2NotChecked} from './TargetProblemImport';

// In case of type error, check the type of 'funcInt2Int2' in 'TargetProblem.re' and './TargetProblemImport'.
/* funcInt2Int2 | TS: [(num:number) => number] | RES: [(_1:number) => string] */
export const funcInt2Int2TypeChecked: (_1:number) => string = funcInt2Int2NotChecked;

// Export 'funcInt2Int2' early to allow circular import from the '.bs.js' file.
export const funcInt2Int2: unknown = funcInt2Int2TypeChecked as (_1:number) => string;

// tslint:disable-next-line:no-var-requires
const TargetProblemBS = require('./TargetProblem.bs');

export const funcInt2Int2Ret: string = TargetProblemBS.funcInt2Int2Ret;

// Hi this is the point where string is finally emitted!! VKJY
