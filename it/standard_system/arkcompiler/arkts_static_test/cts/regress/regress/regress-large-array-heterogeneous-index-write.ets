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
expected_out_1: "Semantic error ESE0250: Object type doesn't have proper index access method."
---*/

function f(a: Object, i: int): void {
  a[i] = 'object';
}

f('make it generic', 0);

// Nearly kMaxRegularHeapObjectSize's worth of doubles.
let kLength: int = 500000 / 8;
let kValue: double = 0.1;
let a: double[] = new Array<double>(kLength);
for (let i: int = 0; i < kLength; i++) {
  a[i] = kValue;
}
f(a, 0);
for (let i: int = 1; i < kLength; i++) {
  arktest.assertEQ(kValue, a[i]);
}

(() => {
function f(a: Object, base: int): Object {
  a[base + 4] = 23;
  return a;
}
arktest.assertEQ(23, f({}, 1)[1 + 4]);
arktest.assertEQ(23, f([], 2)[2 + 4]);
let i: int = 1073741824;
arktest.assertEQ(23, f({}, i)[i + 4]);
})();

(() => {
function f(o: Object): void {
  o[5000000] = 0;
}

let o: Object = Object.create(null);
f(o);
f(o);
f(o);
})();
