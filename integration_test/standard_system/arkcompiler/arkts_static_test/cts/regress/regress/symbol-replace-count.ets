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
expected_out_1: "Semantic error ESE0252: Indexed access is not supported for such expression type."
---*/

(() => {
for (let i: int = 0; i < 2000; i++) {
  Object.prototype['X' + i] = true;
}

let m = new Map<Any, Any>();
m.set(Object.prototype, 23);

let o: Object = {};
m.set(o, 42);
})();

let count = 0
Object.prototype[Symbol.replace] = function () {
  count++
}

''.replace(0);
arktest.assertEQ(count, 1);

''.replace(0.1);
arktest.assertEQ(count, 2);

(() => {
Array.prototype[10000000] = 1;
Array(1000).join();
})();

(() => {
RegExp.prototype[Symbol.match] = null;
'ab'.matchAll(/./);  // Must not throw.
})();
