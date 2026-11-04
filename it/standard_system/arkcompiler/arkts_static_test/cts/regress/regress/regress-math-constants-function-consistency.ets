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
  arktest.assertEQ(Math.E, Math.exp(1.0 as double));
  arktest.assertEQ(Math.LN10, Math.log(10.0 as double));
  arktest.assertEQ(Math.LN2, Math.log(2.0 as double));
  arktest.assertEQ(Math.LOG10E, Math.log10(Math.E));
  arktest.assertEQ(Math.LOG2E, Math.log2(Math.E));
  arktest.assertEQ(Math.SQRT1_2, Math.sqrt(0.5 as double));
  arktest.assertEQ(Math.SQRT2, Math.sqrt(2.0 as double));
}
