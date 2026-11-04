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
expected_out_1: "Semantic error ESE0087: Property 'getOwnPropertyDescriptor' does not exist on type 'Object'"
---*/

Object.getOwnPropertyDescriptor(() => {}, 'x');

'use strict';
class A extends Array {
  get [Symbol.isConcatSpreadable]() { return false; }
}
const obj = [].concat(new A(1, 2, 3), new A(4, 5, 6), new A(7, 8, 9));
arktest.assertEQ(3, obj.length);
arktest.assertEQ(3, obj[0].length);
arktest.assertEQ(3, obj[1].length);
arktest.assertEQ(3, obj[2].length);

(() => {
'use strict';
let desc = Object.getOwnPropertyDescriptor(Array.prototype, 'concat');
arktest.assertEQ(false, desc.enumerable);
})();
