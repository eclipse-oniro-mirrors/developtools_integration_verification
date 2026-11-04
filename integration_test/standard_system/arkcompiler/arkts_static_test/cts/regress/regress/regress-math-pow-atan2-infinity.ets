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

function checkClose(expected: double, actual: double): void {
  arktest.assertTrue(Math.abs(expected - actual) <= 0.00001);
}

function main(): void {
  arktest.assertEQ(1.0, Math.pow(Number.NaN, 0.0));
  const pinf: double = Number.POSITIVE_INFINITY;
  const ninf: double = Number.NEGATIVE_INFINITY;
  checkClose(Math.PI / 4.0, Math.atan2(pinf, pinf));
  checkClose(-Math.PI / 4.0, Math.atan2(ninf, pinf));
  checkClose(3.0 * Math.PI / 4.0, Math.atan2(pinf, ninf));
  checkClose(-3.0 * Math.PI / 4.0, Math.atan2(ninf, ninf));
}
