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

function add(x: double, y: double): double {
  return x + y;
}

function sub(x: double, y: double): double {
  return x - y;
}

function mul(x: double, y: double): double {
  return x * y;
}

function div(x: double, y: double): double {
  return x / y;
}

function main(): void {
  for (let i: int = 0; i < 10; i++) {
    arktest.assertPositiveZero(add(0.0, 0.0));
    arktest.assertPositiveZero(add(0.0, -0.0));
    arktest.assertPositiveZero(add(-0.0, 0.0));
    arktest.assertNegativeZero(add(-0.0, -0.0));

    arktest.assertPositiveZero(sub(0.0, 0.0));
    arktest.assertPositiveZero(sub(0.0, -0.0));
    arktest.assertNegativeZero(sub(-0.0, 0.0));
    arktest.assertPositiveZero(sub(-0.0, -0.0));

    arktest.assertPositiveZero(mul(0.0, 0.0));
    arktest.assertNegativeZero(mul(0.0, -0.0));
    arktest.assertNegativeZero(mul(-0.0, 0.0));
    arktest.assertPositiveZero(mul(-0.0, -0.0));

    arktest.assertPositiveZero(div(0.0, 1.0));
    arktest.assertNegativeZero(div(0.0, -1.0));
    arktest.assertNegativeZero(div(-0.0, 1.0));
    arktest.assertPositiveZero(div(-0.0, -1.0));
  }
}
