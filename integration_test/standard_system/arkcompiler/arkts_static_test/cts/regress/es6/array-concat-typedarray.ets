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

let key = Symbol.isConcatSpreadable;

(() => {
let key = Symbol.isConcatSpreadable;

'use strict';
const obj = { length: 5 };
obj[Symbol.isConcatSpreadable] = true;
arktest.assertEQ(new Array(5), [].concat(obj));

obj.length = 4000;
arktest.assertEQ(new Array(4000), [].concat(obj));
})();

(() => {
let key = Symbol.isConcatSpreadable;

'use strict';
const array = [1, 2, 3];
arktest.assertEQ(array, [].concat(array));
arktest.assertEQ(array, array.concat([]));
array[Symbol.isConcatSpreadable] = false;
arktest.assertEQ([[1,2,3]], [].concat(array));
arktest.assertEQ([[1,2,3]], array.concat([]));
})();

(() => {
let key = Symbol.isConcatSpreadable;

'use strict';
const str1 = Object('yuck\uD83D\uDCA9')
arktest.assertEQ([str1], [].concat(str1));

str1[Symbol.isConcatSpreadable] = true;
arktest.assertEQ(['y', 'u', 'c', 'k', '\uD83D', '\uDCA9'],
             [].concat(str1));

String.prototype[Symbol.isConcatSpreadable] = true;
arktest.assertEQ(['y', 'u', 'c', 'k', '\uD83D', '\uDCA9'],
             [].concat(Object('yuck\uD83D\uDCA9')));

arktest.assertEQ(['yuck\uD83D\uDCA9'], [].concat('yuck\uD83D\uDCA9'));
})();

(() => {
let key = Symbol.isConcatSpreadable;

'use strict';
const re = /abc/;
arktest.assertEQ([re], [].concat(re));

re[Symbol.isConcatSpreadable] = true;
re[0] = 1, re[1] = 2, re[2] = 3, re.length = 3;
arktest.assertEQ([1, 2, 3], [].concat(re));

RegExp.prototype[Symbol.isConcatSpreadable] = true;
RegExp.prototype.length = 3;

arktest.assertEQ(new Array(3), [].concat(/abc/));
RegExp.prototype[0] = 1;
RegExp.prototype[1] = 2;
RegExp.prototype[2] = 3;
arktest.assertEQ([1,2,3], [].concat(/abc/));
})();
