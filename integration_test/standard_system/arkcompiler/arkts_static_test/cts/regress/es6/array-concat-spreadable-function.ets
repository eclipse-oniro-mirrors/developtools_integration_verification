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

'use strict';
let fn = function(a, b, c) {}
// Functions are not concat-spreadable by default
arktest.assertEQ([fn], [].concat(fn));

// Functions may be individually concat-spreadable
fn[Symbol.isConcatSpreadable] = true;
fn[0] = 1, fn[1] = 2, fn[2] = 3;
arktest.assertEQ([1, 2, 3], [].concat(fn));

Function.prototype[Symbol.isConcatSpreadable] = true;
// Functions may be concat-spreadable
arktest.assertEQ(new Array(3), [].concat(function(a,b,c) {}));
Function.prototype[0] = 1;
Function.prototype[1] = 2;
Function.prototype[2] = 3;
arktest.assertEQ([1,2,3], [].concat(function(a, b, c) {}));
