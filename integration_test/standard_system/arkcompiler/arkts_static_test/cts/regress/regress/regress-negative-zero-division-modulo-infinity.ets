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

function main(): void {
  const zero: double = 0.0;
  const one: double = 1.0;
  const minusOne: double = -1.0;
  arktest.assertNegativeZero(0.0 / minusOne);
  arktest.assertNegativeZero(zero / minusOne);
  arktest.assertPositiveZero(zero / one);
  arktest.assertPositiveZero(zero / one);
  arktest.assertNegativeZero(-1.0 % 1.0);
  arktest.assertNegativeZero(minusOne % one);
  arktest.assertPositiveZero(1.0 % 1.0);
  arktest.assertPositiveZero(one % one);
}
