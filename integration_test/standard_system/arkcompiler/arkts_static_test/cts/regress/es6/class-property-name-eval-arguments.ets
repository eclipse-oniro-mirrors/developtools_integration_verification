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

class MethodNames {
  eval(): int {
    return 1;
  }

  arguments(): int {
    return 2;
  }

  static eval(): int {
    return 3;
  }

  static arguments(): int {
    return 4;
  }
}

class GetterNames {
  get eval(): int {
    return 1;
  }

  get arguments(): int {
    return 2;
  }

  static get eval(): int {
    return 3;
  }

  static get arguments(): int {
    return 4;
  }
}

let setterValue: int = 0;

class SetterNames {
  set eval(v: int) {
    setterValue = v;
  }

  set arguments(v: int) {
    setterValue = v;
  }

  static set eval(v: int) {
    setterValue = v;
  }

  static set arguments(v: int) {
    setterValue = v;
  }
}

function testMethods(): void {
  arktest.assertEQ(1, new MethodNames().eval());
  arktest.assertEQ(2, new MethodNames().arguments());
  arktest.assertEQ(3, MethodNames.eval());
  arktest.assertEQ(4, MethodNames.arguments());
}

function testGetters(): void {
  arktest.assertEQ(1, new GetterNames().eval);
  arktest.assertEQ(2, new GetterNames().arguments);
  arktest.assertEQ(3, GetterNames.eval);
  arktest.assertEQ(4, GetterNames.arguments);
}

function testSetters(): void {
  new SetterNames().eval = 1;
  arktest.assertEQ(1, setterValue);
  new SetterNames().arguments = 2;
  arktest.assertEQ(2, setterValue);
  SetterNames.eval = 3;
  arktest.assertEQ(3, setterValue);
  SetterNames.arguments = 4;
  arktest.assertEQ(4, setterValue);
}

function main(): void {
  testMethods();
  testGetters();
  testSetters();
}
