/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*---
desc: |
    Array.prototype.map - callbackfn reading the global this when no thisArg is passed is not expressible; 'this' is
    rejected at compile time outside a class member
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE0203: Cannot reference 'this' in this context."]
---*/

function callbackfn(val: int, idx: int, obj: int[]): boolean {
    let isGlobal: boolean = (this._15_4_4_19_5_1 === true);
    return isGlobal;
}

function main(): void {
    let srcArr: int[] = [1];
    let resArr: boolean[] = srcArr.map(callbackfn);
}
