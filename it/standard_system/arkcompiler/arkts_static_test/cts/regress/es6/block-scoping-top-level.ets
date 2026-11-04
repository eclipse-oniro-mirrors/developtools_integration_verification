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

let xxx = 1;
let f = undefined;
{
  let innerX = xxx;
  f = function() { return innerX; };
}

arktest.assertEQ(1, f());

xxx = 42;
{
  f = function() { return innerX1; };
  let innerX1 = xxx;
}

arktest.assertEQ(42, f());

xxx = 31;
{
  let innerX1 = xxx;
  try {
    throw new Error();
  } catch (e) {
    f = function() { return innerX1; };
  }
}
arktest.assertEQ(31, f());
