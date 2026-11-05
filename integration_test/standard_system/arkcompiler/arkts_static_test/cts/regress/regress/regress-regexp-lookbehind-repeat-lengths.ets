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

function checkSingleMatch(actual: RegExpMatchArray | null): void {
  arktest.assertNE(null, actual);
  const values: RegExpMatchArray = actual!;
  arktest.assertEQ(1, values.length);
  arktest.assertEQ('x', values[0]);
}

function main(): void {
  checkSingleMatch('x'.repeat(3).match(new RegExp('x(?<=^x{3})')));
  checkSingleMatch('x'.repeat(4).match(new RegExp('x(?<=^x{4})')));
  checkSingleMatch('x'.repeat(7).match(new RegExp('x(?<=^x{7})')));
  checkSingleMatch('x'.repeat(17).match(new RegExp('x(?<=^x{17})')));
}
