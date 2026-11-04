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

// Test for a broken fast-smi-loop that does not save the incremented value
// of the loop index.  If this test fails, it loops forever, and times out.

// Calling foo() spills the virtual frame.

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0105: Variable must be initialized or it's type must be declared."
---*/

function foo() {
  return;
}

function bar() {
  let x1 = 3;
  let x2 = 3;
  let x3 = 3;
  let x4 = 3;
  let x5 = 3;
  let x6 = 3;
  let x7 = 3;
  let x8 = 3;
  let x9 = 3;
  let x10 = 3;
  let x11 = 3;
  let x12 = 3;
  let x13 = 3;

  foo();

  x1 = 257;
  x2 = 258;
  x3 = 259;
  x4 = 260;
  x5 = 261;
  x6 = 262;
  x7 = 263;
  x8 = 264;
  x9 = 265;
  x10 = 266;
  x11 = 267;
  x12 = 268;
  x13 = 269;

  // The loop variable x7 is initialized to 3,
  // and then MakeMergeable is called on the virtual frame.
  // MakeMergeable has forced the loop variable x7 to be spilled,
  // so it is marked as synced
  // The back edge then merges its virtual frame, which incorrectly
  // claims that x7 is synced, and does not save the modified
  // value.
  for (x7 = 3; x7 < 10; ++x7) {
    foo();
  }
}

bar();

function aliasing() {
  let x = 3;
  let j;
  for (j = 7; j < 11; ++j) {
    x = j;
  }

  arktest.assertEQ(10, x);
  arktest.assertEQ(11, j);
}

aliasing();
