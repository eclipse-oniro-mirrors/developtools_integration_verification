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

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0227: Unexpected token '/'."
---*/

function testIdentityEscapes(): void {
  // \u not followed by 4 hex digits is treated as an identity escape.
  let r0 = /\u/;
  arktest.assertTrue(r0.test('u'));

  r0 = RegExp('\\u');
  arktest.assertTrue(r0.test('u'));

  let r1 = /\usecond/;
  arktest.assertTrue(r1.test('usecond'));

  r1 = RegExp('\\usecond');
  arktest.assertTrue(r1.test('usecond'));

  let r2 = /first\u/;
  arktest.assertTrue(r2.test('firstu'));
  // This used to return true (which was a bug).
  arktest.assertFalse(r2.test('first\\u'));

  r2 = RegExp('first\\u');
  arktest.assertTrue(r2.test('firstu'));
  // This used to return true (which was a bug).
  arktest.assertFalse(r2.test('first\\u'));

  let r3 = /first\usecond/;
  arktest.assertTrue(r3.test('firstusecond'));
  arktest.assertFalse(r3.test('first\\usecond'));

  r3 = RegExp('first\\usecond');
  arktest.assertTrue(r3.test('firstusecond'));
  arktest.assertFalse(r3.test('first\\usecond'));

  let r4 = /first\u123second/;
  arktest.assertTrue(r4.test('firstu123second'));
  arktest.assertFalse(r4.test('first\\u123second'));

  r4 = RegExp('first\\u123second');
  arktest.assertTrue(r4.test('firstu123second'));
  arktest.assertFalse(r4.test('first\\u123second'));

  // \X where X is not a legal escape character is treated as identity escape
  // too.
  let r5 = /\a/;
  arktest.assertTrue(r5.test('a'));

  r5 = RegExp('\\a');
  arktest.assertTrue(r5.test('a'));

  let r6 = /\asecond/;
  arktest.assertTrue(r6.test('asecond'));

  r6 = RegExp('\\asecond');
  arktest.assertTrue(r6.test('asecond'));

  let r7 = /first\a/;
  arktest.assertTrue(r7.test('firsta'));
  arktest.assertFalse(r7.test('first\\a'));

  r7 = RegExp('first\\a');
  arktest.assertTrue(r7.test('firsta'));
  arktest.assertFalse(r7.test('first\\a'));

  let r8 = /first\asecond/;
  arktest.assertTrue(r8.test('firstasecond'));
  arktest.assertFalse(r8.test('first\\asecond'));

  r8 = RegExp('first\\asecond');
  arktest.assertTrue(r8.test('firstasecond'));
  arktest.assertFalse(r8.test('first\\asecond'));
}

testIdentityEscapes();
