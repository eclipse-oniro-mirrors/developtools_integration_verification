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
  Semantic error ESE0172: No static $_invoke method and static $_instantiate
  method in Object. Object() is not allowed.
---*/

'use strict';
let bool = Object(true)
// Boolean wrapper objects are not concat-spreadable by default
arktest.assertEQ([bool], [].concat(bool));

// Boolean wrapper objects may be individually concat-spreadable
bool[Symbol.isConcatSpreadable] = true;
bool.length = 3;
bool[0] = 1, bool[1] = 2, bool[2] = 3;
arktest.assertEQ([1, 2, 3], [].concat(bool));

Boolean.prototype[Symbol.isConcatSpreadable] = true;
// Boolean wrapper objects may be concat-spreadable
arktest.assertEQ([], [].concat(Object(true)));
Boolean.prototype[0] = 1;
Boolean.prototype[1] = 2;
Boolean.prototype[2] = 3;
Boolean.prototype.length = 3;
arktest.assertEQ([1, 2, 3], [].concat(Object(true)));

// Boolean values are never concat-spreadable
arktest.assertEQ([true], [].concat(true));
