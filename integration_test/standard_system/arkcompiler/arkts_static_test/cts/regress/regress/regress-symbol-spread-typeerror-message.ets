/*
 * Copyright (c) 2025 Hunan OpenValley Digital Industry Development Co., Ltd.
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
tags: [compile-only, negative]
expected_out_1: >-
  "Semantic error ESE0174: Cannot infer type for o10 because class composite needs an explicit target type"
---*/

const o10 = {
    [Symbol.iterator]() {
        let done = 0;
        return {
            next() {
                done++;
                return {
                    'done': done,
                };
            },
        };
    },
};
let longString;
try {
  longString = String.prototype.padStart(536870888);
} catch (e) {
  if (!(e instanceof RangeError)) { throw e; }
  // 32-bit systems have a lower string limit.
  longString = String.prototype.padStart(268435440);
}

Symbol.constructor = Symbol;
const t21 = Symbol(longString);
const expectedError = 'Function\\.prototype\\.apply was called on ' +
    'Symbol\\( +\\.\\.\\.<omitted>\\.\\.\\. +\\), ' +
    'which is a symbol and not a function';
arktest.expectThrow(
    (): void => { t21(...o10, Symbol.constructor); },
    (e: Error): boolean => e instanceof TypeError && new RegExp(expectedError).test(e.message));
