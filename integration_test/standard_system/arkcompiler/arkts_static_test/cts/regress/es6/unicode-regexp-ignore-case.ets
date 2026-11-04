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

// Non-unicode use toUpperCase mappings.

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0227: Unexpected token '/'."
---*/

const latinCaseMatch: boolean = /[\u00e5]/i.test('\u212b');
arktest.assertFalse(latinCaseMatch);
arktest.assertFalse(/[\u212b]/i.test('\u00e5\u1234'));
arktest.assertFalse(/[\u212b]/i.test('\u00e5'));

arktest.assertTrue('\u212b'.toLowerCase() == '\u00e5');
arktest.assertTrue('\u00c5'.toLowerCase() == '\u00e5');
arktest.assertTrue('\u00e5'.toUpperCase() == '\u00c5');

// Unicode uses case folding mappings.
arktest.assertTrue(/\u00e5/ui.test('\u212b'));
arktest.assertTrue(/\u00e5/ui.test('\u00c5'));
arktest.assertTrue(/\u00e5/ui.test('\u00e5'));
arktest.assertTrue(/\u00e5/ui.test('\u212b'));
arktest.assertTrue(/\u00c5/ui.test('\u00e5'));
arktest.assertTrue(/\u00c5/ui.test('\u212b'));
arktest.assertTrue(/\u00c5/ui.test('\u00c5'));
arktest.assertTrue(/\u212b/ui.test('\u00c5'));
arktest.assertTrue(/\u212b/ui.test('\u00e5'));
arktest.assertTrue(/\u212b/ui.test('\u212b'));

// Non-BMP.
arktest.assertFalse(/\u{10400}/i.test('\u{10428}'));
arktest.assertTrue(/\u{10400}/ui.test('\u{10428}'));
arktest.assertTrue(/\ud801\udc00/ui.test('\u{10428}'));
arktest.assertTrue(/[\u{10428}]/ui.test('\u{10400}'));
arktest.assertTrue(/[\ud801\udc28]/ui.test('\u{10400}'));
arktest.assertEQ(['\uff21\u{10400}'],
             /[\uff40-\u{10428}]+/ui.exec('\uff21\u{10400}abc'));
arktest.assertEQ(['abc'], /[^\uff40-\u{10428}]+/ui.exec('\uff21\u{10400}abc\uff23'));
arktest.assertEQ(['\uff53\u24bb'],
             /[\u24d5-\uff33]+/ui.exec('\uff54\uff53\u24bb\u24ba'));

// Full mappings are ignored.
arktest.assertFalse(/\u00df/ui.test('SS'));
arktest.assertFalse(/\u1f8d/ui.test('\u1f05\u03b9'));

// Simple mappings work.
arktest.assertTrue(/\u1f8d/ui.test('\u1f85'));

// Common mappings work.
arktest.assertTrue(/\u1f6b/ui.test('\u1f63'));

// Back references.
arktest.assertEQ(['\u00e5\u212b\u00c5', '\u00e5'],
             /(.)\1\1/ui.exec('\u00e5\u212b\u00c5'));
arktest.assertEQ(['\u{118aa}\u{118ca}', '\u{118aa}'],
             /(.)\1/ui.exec('\u{118aa}\u{118ca}'));

// Misc.
arktest.assertTrue(/\u00e5\u00e5\u00e5/ui.test('\u212b\u00e5\u00c5'));
arktest.assertTrue(/AB\u{10400}/ui.test('ab\u{10428}'));

// Non-Latin1 maps to Latin1.
arktest.assertEQ(['s'], /^\u017F/ui.exec('s'));
arktest.assertEQ(['s'], /^\u017F/ui.exec('s\u1234'));
arktest.assertEQ(['as'], /^a[\u017F]/ui.exec('as'));
arktest.assertEQ(['as'], /^a[\u017F]/ui.exec('as\u1234'));
