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
expected_out_1: "Semantic error ESE0143: Unresolved reference Symbol"
---*/

let key = Symbol.iterator;


function baseline() {
  let array = new Uint8Array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);

  let it = array[Symbol.iterator]();
  arktest.assertEQ(0, it.next().value);
  arktest.assertEQ(1, it.next().value);
  arktest.assertEQ(2, it.next().value);
  ArkTools.arrayBufferDetach(array.buffer);
  it.next();
};
ArkTools.neverOptimizeFunction(baseline);

arktest.expectThrow(baseline, (e: Error): boolean =>
    e instanceof TypeError &&
    e.message == 'Cannot perform Array Iterator.prototype.next on a detached ArrayBuffer');

function turbo(count = 10000) {
  let array = Array(10000);
  for (let i = 0; i < 10000; ++i) {
    array[i] = 254;
  }
  array[5000] = 255;
  array = new Uint8Array(array);

  let sum = 0;
  let it = array[Symbol.iterator]();
  for (let i = 0; i < count; ++i) {
    let result = it.next();
    if (result.value === 255) {
      ArkTools.arrayBufferDetach(array.buffer);
    }
    sum += result.value;
  }
  return sum;
}

ArkTools.prepareFunctionForOptimization(turbo);
turbo(10);
turbo(10);
ArkTools.optimizeFunctionOnNextCall(turbo);

arktest.expectThrow(() => { turbo(); }, (e: Error): boolean =>
    e instanceof TypeError &&
    e.message == 'Cannot perform Array Iterator.prototype.next on a detached ArrayBuffer');
