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

// RegExp caching doesn't set lastIndex correctly.
// See http://chromium issue tracker/issues/detail?id=52801

function main(): void {
  let regexp: RegExp = new RegExp('a', 'g');
  const value: string = 'bbbbabbbbabbbb';

  regexp.test(value);
  arktest.assertEQ(5, regexp.lastIndex);

  regexp.lastIndex = 0;
  regexp.test(value);
  arktest.assertEQ(5, regexp.lastIndex);

  regexp.lastIndex = 0;
  regexp.test(value);
  arktest.assertEQ(5, regexp.lastIndex);

  regexp = new RegExp('a', 'g');

  regexp.exec(value);
  arktest.assertEQ(5, regexp.lastIndex);

  regexp.lastIndex = 0;
  regexp.exec(value);
  arktest.assertEQ(5, regexp.lastIndex);

  regexp.lastIndex = 0;
  regexp.exec(value);
  arktest.assertEQ(5, regexp.lastIndex);
}
