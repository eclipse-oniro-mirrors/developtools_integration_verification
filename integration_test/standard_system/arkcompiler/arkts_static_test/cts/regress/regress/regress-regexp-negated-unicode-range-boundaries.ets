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
  const regexp: RegExp = new RegExp('[^\\u{1}-\\u{1000}\\u{1002}-\\u{2000}]', 'u');

  arktest.assertTrue(regexp.test('\u0000'));
  arktest.assertFalse(regexp.test('\u0001'));
  arktest.assertFalse(regexp.test('\u1000'));
  arktest.assertTrue(regexp.test('\u1001'));
  arktest.assertFalse(regexp.test('\u1002'));
  arktest.assertFalse(regexp.test('\u2000'));
  arktest.assertTrue(regexp.test('\u2001'));
}
