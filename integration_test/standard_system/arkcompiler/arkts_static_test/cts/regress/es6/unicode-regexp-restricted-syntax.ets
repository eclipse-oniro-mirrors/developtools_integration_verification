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

// test262/data/test/language/literals/regexp/u-dec-esc

/*---
tags: [compile-only, negative]
expected_out_1: >-
  "Semantic error ESE0127: No matching call signature for expectThrow(\"/\\1/u\", ((p1: Error) => Boolean))"
---*/

arktest.expectThrow('/\\1/u', ((e: Error): boolean => e instanceof SyntaxError));
// test262/language/literals/regexp/u-invalid-char-range-a
arktest.expectThrow('/[\\w-a]/u', ((e: Error): boolean => e instanceof SyntaxError));
// test262/language/literals/regexp/u-invalid-char-range-b
arktest.expectThrow('/[a-\\w]/u', ((e: Error): boolean => e instanceof SyntaxError));
// test262/language/literals/regexp/u-invalid-char-esc
arktest.expectThrow('/\\c/u', ((e: Error): boolean => e instanceof SyntaxError));
arktest.expectThrow('/\\c0/u', ((e: Error): boolean => e instanceof SyntaxError));
// test262/built-ins/RegExp/unicode_restricted_quantifiable_assertion
arktest.expectThrow('/(?=.)*/u', ((e: Error): boolean => e instanceof SyntaxError));
arktest.expectThrow('/(?=.){1,2}/u', ((e: Error): boolean => e instanceof SyntaxError));
// test262/built-ins/RegExp/unicode_restricted_octal_escape
arktest.expectThrow('/[\\1]/u', ((e: Error): boolean => e instanceof SyntaxError));
arktest.expectThrow('/\\00/u', ((e: Error): boolean => e instanceof SyntaxError));
arktest.expectThrow('/\\09/u', ((e: Error): boolean => e instanceof SyntaxError));
// test262/built-ins/RegExp/unicode_restricted_identity_escape_alpha
arktest.expectThrow('/[\\c]/u', ((e: Error): boolean => e instanceof SyntaxError));
// test262/built-ins/RegExp/unicode_restricted_identity_escape_c
arktest.expectThrow('/[\\c0]/u', ((e: Error): boolean => e instanceof SyntaxError));
// test262/built-ins/RegExp/unicode_restricted_incomple_quantifier
arktest.expectThrow('/a{/u', ((e: Error): boolean => e instanceof SyntaxError));
arktest.expectThrow('/a{1,/u', ((e: Error): boolean => e instanceof SyntaxError));
arktest.expectThrow('/{/u', ((e: Error): boolean => e instanceof SyntaxError));
arktest.expectThrow('/}/u', ((e: Error): boolean => e instanceof SyntaxError));
// test262/data/test/built-ins/RegExp/unicode_restricted_brackets
arktest.expectThrow('/]/u', ((e: Error): boolean => e instanceof SyntaxError));
// test262/built-ins/RegExp/unicode_identity_escape
/\//u;

// escaped \0 is allowed inside a character class.
arktest.assertEQ(['\0'], /[\0]/u.exec('\0'));
// unless it is followed by another digit.
arktest.expectThrow('/[\\00]/u', ((e: Error): boolean => e instanceof SyntaxError));
arktest.expectThrow('/[\\01]/u', ((e: Error): boolean => e instanceof SyntaxError));
arktest.expectThrow('/[\\09]/u', ((e: Error): boolean => e instanceof SyntaxError));
arktest.assertEQ(['\u{0}1\u{0}a\u{0}'], /[1\0a]+/u.exec('b\u{0}1\u{0}a\u{0}2'));
// escaped \- is allowed inside a character class.
arktest.assertEQ(['-'], /[a\-z]/u.exec('12-34'));
