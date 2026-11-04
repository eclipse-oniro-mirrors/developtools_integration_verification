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

// Test that global regexps capture and fail in the correct cyclic way.

function main(): void {
  let regexp: RegExp = new RegExp('x', 'g');

  for (let i: int = 0; i < 15; i++) {
    arktest.assertEQ(i % 3, regexp.lastIndex, 'preindex' + i);
    const result: RegExpExecArray | null = regexp.exec('xx');
    if (i % 3 == 2) {
      arktest.assertEQ(null, result, 'res' + i);
    } else {
      arktest.assertNE(null, result, 'res non-null' + i);
      const match: RegExpExecArray = result!;
      arktest.assertEQ(1, match.length, 'res length' + i);
      arktest.assertEQ('x', match[0], 'res element' + i);
    }
  }

  regexp = new RegExp('x', 'g');

  for (let i: int = 0; i < 15; i++) {
    arktest.assertEQ(i % 3, regexp.lastIndex, 'testpreindex' + i);
    const result: boolean = regexp.test('xx');
    arktest.assertEQ(i % 3 != 2, result, 'testres' + i);
  }
}
