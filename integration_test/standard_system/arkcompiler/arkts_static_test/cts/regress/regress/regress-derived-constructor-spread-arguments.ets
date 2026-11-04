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

let firstSpread: int[] = [2];
let secondSpread: int[] = [4];
let capturedArguments: int[] = [];

function assertIntArray(expected: int[], actual: int[]): void {
  arktest.assertEQ(expected.length, actual.length);
  for (let i: int = 0; i < expected.length; i++) {
    arktest.assertEQ(expected[i], actual[i]);
  }
}

class SpreadBase {
  constructor(...args: int[]) {
    capturedArguments = args;
  }
}

class SpreadOne extends SpreadBase {
  public field: int = 42;
  constructor() { super(1); }
}

class SpreadTwo extends SpreadBase {
  public field: int = 42;
  constructor() { super(...firstSpread); }
}

class SpreadThree extends SpreadBase {
  public field: int = 42;
  constructor() { super(1, ...firstSpread); }
}

class SpreadFour extends SpreadBase {
  public field: int = 42;
  constructor() { super(1, ...firstSpread, 3); }
}

class SpreadFive extends SpreadBase {
  public field: int = 42;
  constructor() { super(1, ...firstSpread, 3, ...secondSpread); }
}

class SpreadSix extends SpreadBase {
  public field: int = 42;
  constructor() { super(1, ...firstSpread, 3, ...secondSpread, 5); }
}

function main(): void {
  arktest.assertEQ(42, new SpreadOne().field);
  assertIntArray([1], capturedArguments);
  arktest.assertEQ(42, new SpreadTwo().field);
  assertIntArray([2], capturedArguments);
  arktest.assertEQ(42, new SpreadThree().field);
  assertIntArray([1, 2], capturedArguments);
  arktest.assertEQ(42, new SpreadFour().field);
  assertIntArray([1, 2, 3], capturedArguments);
  arktest.assertEQ(42, new SpreadFive().field);
  assertIntArray([1, 2, 3, 4], capturedArguments);
  arktest.assertEQ(42, new SpreadSix().field);
  assertIntArray([1, 2, 3, 4, 5], capturedArguments);
}
