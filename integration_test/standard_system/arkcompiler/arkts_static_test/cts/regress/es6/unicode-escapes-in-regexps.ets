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

// ES6 extends the \uxxxx escape and also allows \u{xxxxx}.

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0194: Parameter declaration should have an explicit type annotation."
---*/

function testRegexpHelper(r) {
  arktest.assertTrue(r.test('foo'));
  arktest.assertTrue(r.test('boo'));
  arktest.assertFalse(r.test('moo'));
}


(function TestUnicodeEscapes() {
  testRegexpHelper(/(\u0066|\u0062)oo/);
  testRegexpHelper(/(\u0066|\u0062)oo/u);
  testRegexpHelper(/(\u{0066}|\u{0062})oo/u);
  testRegexpHelper(/(\u{66}|\u{000062})oo/u);

  // Note that we need \\ inside a string, otherwise it's interpreted as a
  // unicode escape inside a string.
  testRegexpHelper(new RegExp('(\\u0066|\\u0062)oo'));
  testRegexpHelper(new RegExp('(\\u0066|\\u0062)oo', 'u'));
  testRegexpHelper(new RegExp('(\\u{0066}|\\u{0062})oo', 'u'));
  testRegexpHelper(new RegExp('(\\u{66}|\\u{000062})oo', 'u'));

  // Though, unicode escapes via strings should work too.
  testRegexpHelper(new RegExp('(\u0066|\u0062)oo'));
  testRegexpHelper(new RegExp('(\u0066|\u0062)oo', 'u'));
  testRegexpHelper(new RegExp('(\u{0066}|\u{0062})oo', 'u'));
  testRegexpHelper(new RegExp('(\u{66}|\u{000062})oo', 'u'));
})();


(function TestUnicodeEscapesInCharacterClasses() {
  testRegexpHelper(/[\u0062-\u0066]oo/);
  testRegexpHelper(/[\u0062-\u0066]oo/u);
  testRegexpHelper(/[\u{0062}-\u{0066}]oo/u);
  testRegexpHelper(/[\u{62}-\u{00000066}]oo/u);

  // Note that we need \\ inside a string, otherwise it's interpreted as a
  // unicode escape inside a string.
  testRegexpHelper(new RegExp('[\\u0062-\\u0066]oo'));
  testRegexpHelper(new RegExp('[\\u0062-\\u0066]oo', 'u'));
  testRegexpHelper(new RegExp('[\\u{0062}-\\u{0066}]oo', 'u'));
  testRegexpHelper(new RegExp('[\\u{62}-\\u{00000066}]oo', 'u'));

  // Though, unicode escapes via strings should work too.
  testRegexpHelper(new RegExp('[\u0062-\u0066]oo'));
  testRegexpHelper(new RegExp('[\u0062-\u0066]oo', 'u'));
  testRegexpHelper(new RegExp('[\u{0062}-\u{0066}]oo', 'u'));
  testRegexpHelper(new RegExp('[\u{62}-\u{00000066}]oo', 'u'));
})();


(function TestBraceEscapesWithoutUnicodeFlag() {
  // \u followed by illegal escape will be parsed as u. {x} will be the
  // character count.
  function helper1(r) {
    arktest.assertFalse(r.test('fbar'));
    arktest.assertFalse(r.test('fubar'));
    arktest.assertTrue(r.test('fuubar'));
    arktest.assertFalse(r.test('fuuubar'));
  }
  helper1(/f\u{2}bar/);
  helper1(new RegExp('f\\u{2}bar'));

  function helper2(r) {
    arktest.assertFalse(r.test('fbar'));
    arktest.assertTrue(r.test('fubar'));
    arktest.assertTrue(r.test('fuubar'));
    arktest.assertFalse(r.test('fuuubar'));
  }

  helper2(/f\u{1,2}bar/);
  helper2(new RegExp('f\\u{1,2}bar'));

  function helper3(r) {
    arktest.assertTrue(r.test('u'));
    arktest.assertTrue(r.test('{'));
    arktest.assertTrue(r.test('2'));
    arktest.assertTrue(r.test('}'));
    arktest.assertFalse(r.test('q'));
    arktest.assertFalse(r.test('('));
    arktest.assertFalse(r.test(')'));
  }
  helper3(/[\u{2}]/);
  helper3(new RegExp('[\\u{2}]'));
})();


(function TestInvalidEscapes() {
  // Without the u flag, invalid unicode escapes and other invalid escapes are
  // treated as identity escapes.
  function helper1(r) {
    arktest.assertTrue(r.test('firstuxz89second'));
  }
  helper1(/first\u\x\z\8\9second/);
  helper1(new RegExp('first\\u\\x\\z\\8\\9second'));

  function helper2(r) {
    arktest.assertTrue(r.test('u'));
    arktest.assertTrue(r.test('x'));
    arktest.assertTrue(r.test('z'));
    arktest.assertTrue(r.test('8'));
    arktest.assertTrue(r.test('9'));
    arktest.assertFalse(r.test('q'));
    arktest.assertFalse(r.test('7'));
  }
  helper2(/[\u\x\z\8\9]/);
  helper2(new RegExp('[\\u\\x\\z\\8\\9]'));

  // However, with the u flag, these are treated as invalid escapes.
  arktest.expectThrow('/\\u/u', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('/\\u12/u', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('/\\ufoo/u', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('/\\x/u', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('/\\xfoo/u', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('/\\z/u', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('/\\8/u', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('/\\9/u', ((e: Error): boolean => e instanceof SyntaxError));

  arktest.expectThrow('new RegExp(\'\\\\u\', \'u\')', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('new RegExp(\'\\\\u12\', \'u\')', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('new RegExp(\'\\\\ufoo\', \'u\')', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('new RegExp(\'\\\\x\', \'u\')', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('new RegExp(\'\\\\xfoo\', \'u\')', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('new RegExp(\'\\\\z\', \'u\')', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('new RegExp(\'\\\\8\', \'u\')', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('new RegExp(\'\\\\9\', \'u\')', ((e: Error): boolean => e instanceof SyntaxError));
})();


(function TestTooBigHexEscape() {
  // The hex number inside \u{} has a maximum value.
  /\u{10ffff}/u
  new RegExp('\\u{10ffff}', 'u')
  arktest.expectThrow('/\\u{110000}/u', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('new RegExp(\'\\\\u{110000}\', \'u\')', ((e: Error): boolean => e instanceof SyntaxError));

  // Without the u flag, they're of course fine ({x} is the count).
  /\u{110000}/
  new RegExp('\\u{110000}')
})();


(function TestSyntaxEscapes() {
  // Syntax escapes work the same with or without the u flag.
  function helper(r) {
    arktest.assertTrue(r.test('foo[bar'));
    arktest.assertFalse(r.test('foo]bar'));
  }
  helper(/foo\[bar/);
  helper(new RegExp('foo\\[bar'));
  helper(/foo\[bar/u);
  helper(new RegExp('foo\\[bar', 'u'));
})();


(function TestUnicodeSurrogates() {
  function helper(r) {
    arktest.assertTrue(r.test('foo\u{10e6d}bar'));
  }
  helper(/foo\ud803\ude6dbar/u);
  helper(new RegExp('foo\\ud803\\ude6dbar', 'u'));
})();


(function AllFlags() {
  // Test that we can pass all possible regexp flags and they work properly.
  function helper1(r) {
    arktest.assertTrue(r.global);
    arktest.assertTrue(r.ignoreCase);
    arktest.assertTrue(r.multiline);
    arktest.assertTrue(r.sticky);
    arktest.assertTrue(r.unicode);
  }

  helper1(/foo/gimyu);
  helper1(new RegExp('foo', 'gimyu'));

  function helper2(r) {
    arktest.assertFalse(r.global);
    arktest.assertFalse(r.ignoreCase);
    arktest.assertFalse(r.multiline);
    arktest.assertFalse(r.sticky);
    arktest.assertFalse(r.unicode);
  }

  helper2(/foo/);
  helper2(new RegExp('foo'));
})();


(function DuplicatedFlags() {
  // Test that duplicating the u flag is not allowed.
  arktest.expectThrow('/foo/ugu');
  arktest.expectThrow('new RegExp(\'foo\', \'ugu\')');
})();


(function ToString() {
  // Test that the u flag is included in the string representation of regexps.
  function helper(r) {
    arktest.assertEQ(r.toString(), '/foo/u');
  }
  helper(/foo/u);
  helper(new RegExp('foo', 'u'));
})();

// Non-BMP patterns.
// Single character atom.
arktest.assertTrue(new RegExp('\u{12345}', 'u').test('\u{12345}'));
arktest.assertTrue(/\u{12345}/u.test('\u{12345}'));
arktest.assertTrue(new RegExp('\u{12345}', 'u').test('\ud808\udf45'));
arktest.assertTrue(/\u{12345}/u.test('\ud808\udf45'));
arktest.assertFalse(new RegExp('\u{12345}', 'u').test('\udf45'));
arktest.assertFalse(/\u{12345}/u.test('\udf45'));

// Multi-character atom.
arktest.assertTrue(new RegExp('\u{12345}\u{23456}', 'u').test('a\u{12345}\u{23456}b'));
arktest.assertTrue(/\u{12345}\u{23456}/u.test('b\u{12345}\u{23456}c'));
arktest.assertFalse(new RegExp('\u{12345}\u{23456}', 'u').test('a\udf45\u{23456}b'));
arktest.assertFalse(/\u{12345}\u{23456}/u.test('b\udf45\u{23456}c'));

// Disjunction.
arktest.assertTrue(new RegExp('\u{12345}(?:\u{23456})', 'u').test(
    'a\u{12345}\u{23456}b'));
arktest.assertTrue(/\u{12345}(?:\u{23456})/u.test('b\u{12345}\u{23456}c'));
arktest.assertFalse(new RegExp('\u{12345}(?:\u{23456})', 'u').test(
    'a\udf45\u{23456}b'));
arktest.assertFalse(/\u{12345}(?:\u{23456})/u.test('b\udf45\u{23456}c'));

// Alternative.
arktest.assertTrue(new RegExp('\u{12345}|\u{23456}', 'u').test('a\u{12345}b'));
arktest.assertTrue(/\u{12345}|\u{23456}/u.test('b\u{23456}c'));
arktest.assertFalse(new RegExp('\u{12345}|\u{23456}', 'u').test('a\udf45\ud84db'));
arktest.assertFalse(/\u{12345}|\u{23456}/u.test('b\udf45\ud808c'));

// Capture.
arktest.assertTrue(new RegExp('(\u{12345}|\u{23456}).\\1', 'u').test(
    '\u{12345}b\u{12345}'));
arktest.assertTrue(/(\u{12345}|\u{23456}).\1/u.test('\u{12345}b\u{12345}'));
arktest.assertFalse(new RegExp('(\u{12345}|\u{23456}).\\1', 'u').test(
    '\u{12345}b\u{23456}'));
arktest.assertFalse(/(\u{12345}|\u{23456}).\1/u.test('\u{12345}b\u{23456}'));

// Quantifier.
arktest.assertTrue(new RegExp('\u{12345}{3}', 'u').test('\u{12345}\u{12345}\u{12345}'));
arktest.assertTrue(/\u{12345}{3}/u.test('\u{12345}\u{12345}\u{12345}'));
arktest.assertTrue(new RegExp('\u{12345}{3}').test('\u{12345}\udf45\udf45'));
arktest.assertFalse(/\ud808\udf45{3}/u.test('\u{12345}\udf45\udf45'));
arktest.assertTrue(/\ud808\udf45{3}/u.test('\u{12345}\u{12345}\u{12345}'));
arktest.assertFalse(new RegExp('\u{12345}{3}', 'u').test('\u{12345}\udf45\udf45'));
arktest.assertFalse(/\u{12345}{3}/u.test('\u{12345}\udf45\udf45'));

// Literal surrogates.
arktest.assertEQ(['\u{10000}\u{10000}'],
             new RegExp('\ud800\udc00+', 'u').exec('\u{10000}\u{10000}'));
arktest.assertEQ(['\u{10000}\u{10000}'],
             new RegExp('\\ud800\\udc00+', 'u').exec('\u{10000}\u{10000}'));

arktest.assertEQ(['\u{10003}\u{50001}'],
             new RegExp('[\\ud800\\udc03-\\ud900\\udc01\]+', 'u').exec(
                 '\u{10003}\u{50001}'));
arktest.assertEQ(['\u{10003}\u{50001}'],
             new RegExp('[\ud800\udc03-\u{50001}\]+', 'u').exec(
                 '\u{10003}\u{50001}'));

// Unicode escape sequences to represent a non-BMP character cannot have
// mixed notation, and must follow the rules for RegExpUnicodeEscapeSequence.
arktest.expectThrow(() => new RegExp('[\\ud800\udc03-\ud900\\udc01\]+', 'u'));
arktest.expectThrow(() => new RegExp('[\\ud800\udc03-\ud900\\udc01\]+', 'u'));
arktest.assertEQ(new RegExp('\\ud800\udc00+', 'u').exec('\u{10000}\u{10000}'));
arktest.assertEQ(new RegExp('\ud800\\udc00+', 'u').exec('\u{10000}\u{10000}'));

arktest.assertEQ(new RegExp('[\\ud800\udc00]', 'u').exec('\u{10000}'));
arktest.assertEQ(new RegExp('[\\{ud800}\udc00]', 'u').exec('\u{10000}'));
arktest.assertEQ(new RegExp('[\ud800\\udc00]', 'u').exec('\u{10000}'));
arktest.assertEQ(new RegExp('[\ud800\\{udc00}]', 'u').exec('\u{10000}'));

let highSurrogate = String.fromCharCode(55296);
const lowSurrogate = String.fromCharCode(56320);
const pairedSurrogates = highSurrogate + lowSurrogate + lowSurrogate;
const highSurrogateEscape = '\\u' + 'D' + '800';
const lowSurrogateEscape = '\\u' + 'D' + 'C00';
const highCodePointEscape = '\\u{' + 'D' + '800}';
const lowCodePointEscape = '\\u{' + 'D' + 'C00}';

arktest.assertEQ(new RegExp(highCodePointEscape + lowCodePointEscape + '+', 'u')
                    .exec(pairedSurrogates));
arktest.assertEQ(new RegExp(highSurrogateEscape + lowCodePointEscape + '+', 'u')
                    .exec(pairedSurrogates));
arktest.assertEQ(new RegExp(highCodePointEscape + lowSurrogateEscape + '+', 'u')
                    .exec(pairedSurrogates));
