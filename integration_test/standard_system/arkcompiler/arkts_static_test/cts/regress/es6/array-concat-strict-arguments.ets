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
expected_out_1: "Semantic error ESE0143: Unresolved reference arguments"
---*/

function f(): Object { return arguments; }

const args = (function(a, b, c) { 'use strict'; return arguments; })(1,2,3);
args[Symbol.isConcatSpreadable] = true;
arktest.assertEQ([1, 2, 3, 1, 2, 3], [].concat(args, args));

Object.defineProperty(args, 'length', { value: 6 });
arktest.assertEQ([1, 2, 3, , , ,], [].concat(args));

(() => {
function f() {
  return arguments.length;
}

arktest.assertEQ(0, f.apply(), 'no receiver or args');
arktest.assertEQ(0, f.apply(this), 'no args');
arktest.assertEQ(0, f.apply(this, []), 'empty args');
arktest.assertEQ(0, f.apply(this, [], 0), 'empty args, extra argument');
})();
