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
  arktest.assertTrue(new RegExp('[@-A]', 'i').test('a'));
  arktest.assertTrue(new RegExp('[@-A]', 'i').test('A'));
  arktest.assertTrue(new RegExp('[@-A]', 'i').test('@'));

  arktest.assertFalse(new RegExp('[@-A]').test('a'));
  arktest.assertTrue(new RegExp('[@-A]').test('A'));
  arktest.assertTrue(new RegExp('[@-A]').test('@'));

  arktest.assertFalse(new RegExp('[\u00BF-\u00C0]', 'i').test('\u00BE'));
  arktest.assertTrue(new RegExp('[\u00BF-\u00C0]', 'i').test('\u00BF'));
  arktest.assertTrue(new RegExp('[\u00BF-\u00C0]', 'i').test('\u00C0'));
  arktest.assertTrue(new RegExp('[\u00BF-\u00C0]', 'i').test('\u00E0'));
  arktest.assertFalse(new RegExp('[\u00BF-\u00C0]', 'i').test('\u00E1'));
  arktest.assertFalse(new RegExp('[\u00BF-\u00C0]', 'i').test('\u00C1'));

  arktest.assertFalse(new RegExp('[\u00BF-\u00C0]').test('\u00BE'));
  arktest.assertTrue(new RegExp('[\u00BF-\u00C0]').test('\u00BF'));
  arktest.assertTrue(new RegExp('[\u00BF-\u00C0]').test('\u00C0'));
  arktest.assertFalse(new RegExp('[\u00BF-\u00C0]').test('\u00E0'));
  arktest.assertFalse(new RegExp('[\u00BF-\u00C0]').test('\u00E1'));
  arktest.assertFalse(new RegExp('[\u00BF-\u00C0]').test('\u00E1'));
  arktest.assertFalse(new RegExp('[\u00BF-\u00C0]', 'i').test('\u00C1'));

  arktest.assertFalse(new RegExp('[\u00D6-\u00D7]', 'i').test('\u00D5'));
  arktest.assertTrue(new RegExp('[\u00D6-\u00D7]', 'i').test('\u00D6'));
  arktest.assertTrue(new RegExp('[\u00D6-\u00D7]', 'i').test('\u00F6'));
  arktest.assertTrue(new RegExp('[\u00D6-\u00D7]', 'i').test('\u00D7'));
  arktest.assertFalse(new RegExp('[\u00D6-\u00D7]', 'i').test(String.fromCharCode(216)));

  arktest.assertFalse(new RegExp('[\u00D6-\u00D7]').test('\u00D5'));
  arktest.assertTrue(new RegExp('[\u00D6-\u00D7]').test('\u00D6'));
  arktest.assertFalse(new RegExp('[\u00D6-\u00D7]').test('\u00F6'));
  arktest.assertTrue(new RegExp('[\u00D6-\u00D7]').test('\u00D7'));
  arktest.assertFalse(new RegExp('[\u00D6-\u00D7]').test(String.fromCharCode(216)));
}
