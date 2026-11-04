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
expected_out_1: "Syntax error ESY0320: Function expressions are not supported, use arrow functions instead"
---*/

let args = (function(a, b, c) { return arguments; })(1,2,3);
args[Symbol.isConcatSpreadable] = true;
arktest.assertEQ([1, 2, 3, 1, 2, 3], [].concat(args, args));

Object.defineProperty(args, 'length', { value: 6 });
arktest.assertEQ([1, 2, 3, , ,, ], [].concat(args));

(() => {
let args = (function(a, a, a) { return arguments; })(1,2,3);
args[Symbol.isConcatSpreadable] = true;
arktest.assertEQ([1, 2, 3, 1, 2, 3], [].concat(args, args));

Object.defineProperty(args, 'length', { value: 6 });
arktest.assertEQ([1, 2, 3, , , ,], [].concat(args));
})();

(() => {
let args = (function(a) { return arguments; })(1,2,3);
delete args[1];
args[Symbol.isConcatSpreadable] = true;
arktest.assertEQ([1, , 3, 1, , 3], [].concat(args, args));
})();

(() => {
function MyError() {}
let args = (function(a) { return arguments; })(1,2,3);
Object.defineProperty(args, 0, {
  get: function() { throw new MyError(); }
});
args[Symbol.isConcatSpreadable] = true;
arktest.expectThrow(function() {
  return [].concat(args, args);
}, MyError);
})();
