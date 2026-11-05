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
expected_out_1: "Syntax error ESY0038: Label must be followed by a loop statement."
---*/

function testBreak() {
  let sequence = '';
  for (let a of [0,1]) {
    L: {
      for (let b of [2,3,4]) {
        break L;
      }
    }
    sequence += a;
  }
  return sequence;
}


function testContinue() {
  let sequence = '';
  for (let a of [0,1]) {
    L: do {
      for (let b of [2,3,4]) {
        continue L;
      }
    } while (false);
    sequence += a;
  }
  return sequence;
}


arktest.assertEQ('01', testBreak());
arktest.assertEQ('01', testContinue());
