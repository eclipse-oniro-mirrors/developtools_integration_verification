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

function spillFrame(): void {
}

function exerciseLoopIndexSpill(): void {
  let x1: int = 3;
  let x2: int = 3;
  let x3: int = 3;
  let x4: int = 3;
  let x5: int = 3;
  let x6: int = 3;
  let x7: int = 3;
  let x8: int = 3;
  let x9: int = 3;
  let x10: int = 3;
  let x11: int = 3;
  let x12: int = 3;
  let x13: int = 3;

  spillFrame();
  x1 = 257; x2 = 258; x3 = 259; x4 = 260; x5 = 261;
  x6 = 262; x7 = 263; x8 = 264; x9 = 265; x10 = 266;
  x11 = 267; x12 = 268; x13 = 269;

  for (x7 = 3; x7 < 10; ++x7) {
    spillFrame();
  }
}

function checkAliasingLoop(): void {
  let value: int = 3;
  let index: int = 7;
  for (; index < 11; ++index) {
    value = index;
  }
  arktest.assertEQ(10, value);
  arktest.assertEQ(11, index);
}

function main(): void {
  exerciseLoopIndexSpill();
  checkAliasingLoop();
}
