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
expected_out_1: "Semantic error ESE0127: No matching call signature for startsWith(\"a\", Double)"
---*/

const startsWithInfinity: boolean = 'abc'.startsWith('a', Infinity);
arktest.assertFalse(startsWithInfinity);

arktest.assertEQ(1, String.prototype.startsWith.length);

const testString = 'Hello World';
arktest.assertTrue(testString.startsWith(''));
arktest.assertTrue(testString.startsWith('Hello'));
arktest.assertFalse(testString.startsWith('hello'));
arktest.assertFalse(testString.startsWith('Hello World!'));
arktest.assertFalse(testString.startsWith(null));
arktest.assertFalse(testString.startsWith(undefined));
arktest.assertFalse(testString.startsWith());

arktest.assertTrue('null'.startsWith(null));
arktest.assertTrue('undefined'.startsWith(undefined));

const georgianUnicodeString = '\u10D0\u10D1\u10D2\u10D3\u10D4\u10D5\u10D6\u10D7';
arktest.assertTrue(georgianUnicodeString.startsWith(georgianUnicodeString));
arktest.assertTrue(georgianUnicodeString.startsWith('\u10D0\u10D1\u10D2'));
arktest.assertFalse(georgianUnicodeString.startsWith(String.fromCharCode(4312)));

arktest.expectThrow('String.prototype.startsWith.call(null, \'test\')', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('String.prototype.startsWith.call(null, null)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('String.prototype.startsWith.call(undefined, undefined)', ((e: Error): boolean => e instanceof TypeError));

arktest.expectThrow('String.prototype.startsWith.apply(null, [\'test\'])', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('String.prototype.startsWith.apply(null, [null])', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('String.prototype.startsWith.apply(undefined, [undefined])', ((e: Error): boolean => e instanceof TypeError));

let TEST_INPUT = [{
  msg: 'Empty string', val: ''
}, {
  msg: 'Number 1234.34', val: 1234.34
}, {
  msg: 'Integer number 0', val: 0
}, {
  msg: 'Negative number -1', val: -1
}, {
  msg: 'Boolean true', val: true
}, {
  msg: 'Boolean false', val: false
}, {
  msg: 'Empty array []', val: []
}, {
  msg: 'Empty object {}', val: {}
}, {
  msg: 'Array of size 3', val: new Array(3)
}];

function testNonStringValues() {
  let i = 0;
  let l = TEST_INPUT.length;

  for (; i < l; i++) {
    let e = TEST_INPUT[i];
    let v = e.val;
    const s = String(v);
    arktest.assertTrue(s.startsWith(v), e.msg);
    arktest.assertTrue(String.prototype.startsWith.call(v, v), e.msg);
    arktest.assertTrue(String.prototype.startsWith.apply(v, [v]), e.msg);
  }
}
testNonStringValues();

function testCutomType() {
  let i = 0;
  let l = TEST_INPUT.length;

  for (; i < l; i++) {
    let e = TEST_INPUT[i];
    let v = e.val;
  }
}
testCutomType();

// Test cases found in FF
arktest.assertTrue('abc'.startsWith('abc'));
arktest.assertTrue('abcd'.startsWith('abc'));
arktest.assertTrue('abc'.startsWith('a'));
arktest.assertFalse('abc'.startsWith('abcd'));
arktest.assertFalse('abc'.startsWith('bcde'));
arktest.assertFalse('abc'.startsWith('b'));
arktest.assertTrue('abc'.startsWith('abc', 0));
arktest.assertFalse('abc'.startsWith('bc', 0));
arktest.assertTrue('abc'.startsWith('bc', 1));
arktest.assertFalse('abc'.startsWith('c', 1));
arktest.assertFalse('abc'.startsWith('abc', 1));
arktest.assertTrue('abc'.startsWith('c', 2));
arktest.assertFalse('abc'.startsWith('d', 2));
arktest.assertFalse('abc'.startsWith('dcd', 2));
arktest.assertFalse('abc'.startsWith('a', 42));
arktest.assertFalse('abc'.startsWith('a', Infinity));
arktest.assertTrue('abc'.startsWith('a', NaN));
arktest.assertFalse('abc'.startsWith('b', NaN));
arktest.assertTrue('abc'.startsWith('ab', -43));
arktest.assertTrue('abc'.startsWith('ab', -Infinity));
arktest.assertFalse('abc'.startsWith('bc', -42));
arktest.assertFalse('abc'.startsWith('bc', -Infinity));

// Test cases taken from
Object.prototype[1] = 2; // try to break `arguments[1]`

arktest.assertEQ(String.prototype.startsWith.length, 1);
arktest.assertEQ(String.prototype.propertyIsEnumerable('startsWith'), false);

arktest.assertEQ('undefined'.startsWith(), true);
arktest.assertEQ('undefined'.startsWith(undefined), true);
arktest.assertEQ('undefined'.startsWith(null), false);
arktest.assertEQ('null'.startsWith(), false);
arktest.assertEQ('null'.startsWith(undefined), false);
arktest.assertEQ('null'.startsWith(null), true);

arktest.assertEQ('abc'.startsWith(), false);
arktest.assertEQ('abc'.startsWith(''), true);
arktest.assertEQ('abc'.startsWith('\0'), false);
arktest.assertEQ('abc'.startsWith('a'), true);
arktest.assertEQ('abc'.startsWith('b'), false);
arktest.assertEQ('abc'.startsWith('ab'), true);
arktest.assertEQ('abc'.startsWith('bc'), false);
arktest.assertEQ('abc'.startsWith('abc'), true);
arktest.assertEQ('abc'.startsWith('bcd'), false);
arktest.assertEQ('abc'.startsWith('abcd'), false);
arktest.assertEQ('abc'.startsWith('bcde'), false);

arktest.assertEQ('abc'.startsWith('', NaN), true);
arktest.assertEQ('abc'.startsWith('\0', NaN), false);
arktest.assertEQ('abc'.startsWith('a', NaN), true);
arktest.assertEQ('abc'.startsWith('b', NaN), false);
arktest.assertEQ('abc'.startsWith('ab', NaN), true);
arktest.assertEQ('abc'.startsWith('bc', NaN), false);
arktest.assertEQ('abc'.startsWith('abc', NaN), true);
arktest.assertEQ('abc'.startsWith('bcd', NaN), false);
arktest.assertEQ('abc'.startsWith('abcd', NaN), false);
arktest.assertEQ('abc'.startsWith('bcde', NaN), false);

arktest.assertEQ('abc'.startsWith('', false), true);
arktest.assertEQ('abc'.startsWith('\0', false), false);
arktest.assertEQ('abc'.startsWith('a', false), true);
arktest.assertEQ('abc'.startsWith('b', false), false);
arktest.assertEQ('abc'.startsWith('ab', false), true);
arktest.assertEQ('abc'.startsWith('bc', false), false);
arktest.assertEQ('abc'.startsWith('abc', false), true);
arktest.assertEQ('abc'.startsWith('bcd', false), false);
arktest.assertEQ('abc'.startsWith('abcd', false), false);
arktest.assertEQ('abc'.startsWith('bcde', false), false);

arktest.assertEQ('abc'.startsWith('', undefined), true);
arktest.assertEQ('abc'.startsWith('\0', undefined), false);
arktest.assertEQ('abc'.startsWith('a', undefined), true);
arktest.assertEQ('abc'.startsWith('b', undefined), false);
arktest.assertEQ('abc'.startsWith('ab', undefined), true);
arktest.assertEQ('abc'.startsWith('bc', undefined), false);
arktest.assertEQ('abc'.startsWith('abc', undefined), true);
arktest.assertEQ('abc'.startsWith('bcd', undefined), false);
arktest.assertEQ('abc'.startsWith('abcd', undefined), false);
arktest.assertEQ('abc'.startsWith('bcde', undefined), false);

arktest.assertEQ('abc'.startsWith('', null), true);
arktest.assertEQ('abc'.startsWith('\0', null), false);
arktest.assertEQ('abc'.startsWith('a', null), true);
arktest.assertEQ('abc'.startsWith('b', null), false);
arktest.assertEQ('abc'.startsWith('ab', null), true);
arktest.assertEQ('abc'.startsWith('bc', null), false);
arktest.assertEQ('abc'.startsWith('abc', null), true);
arktest.assertEQ('abc'.startsWith('bcd', null), false);
arktest.assertEQ('abc'.startsWith('abcd', null), false);
arktest.assertEQ('abc'.startsWith('bcde', null), false);

arktest.assertEQ('abc'.startsWith('', -Infinity), true);
arktest.assertEQ('abc'.startsWith('\0', -Infinity), false);
arktest.assertEQ('abc'.startsWith('a', -Infinity), true);
arktest.assertEQ('abc'.startsWith('b', -Infinity), false);
arktest.assertEQ('abc'.startsWith('ab', -Infinity), true);
arktest.assertEQ('abc'.startsWith('bc', -Infinity), false);
arktest.assertEQ('abc'.startsWith('abc', -Infinity), true);
arktest.assertEQ('abc'.startsWith('bcd', -Infinity), false);
arktest.assertEQ('abc'.startsWith('abcd', -Infinity), false);
arktest.assertEQ('abc'.startsWith('bcde', -Infinity), false);

arktest.assertEQ('abc'.startsWith('', -1), true);
arktest.assertEQ('abc'.startsWith('\0', -1), false);
arktest.assertEQ('abc'.startsWith('a', -1), true);
arktest.assertEQ('abc'.startsWith('b', -1), false);
arktest.assertEQ('abc'.startsWith('ab', -1), true);
arktest.assertEQ('abc'.startsWith('bc', -1), false);
arktest.assertEQ('abc'.startsWith('abc', -1), true);
arktest.assertEQ('abc'.startsWith('bcd', -1), false);
arktest.assertEQ('abc'.startsWith('abcd', -1), false);
arktest.assertEQ('abc'.startsWith('bcde', -1), false);

arktest.assertEQ('abc'.startsWith('', -0), true);
arktest.assertEQ('abc'.startsWith('\0', -0), false);
arktest.assertEQ('abc'.startsWith('a', -0), true);
arktest.assertEQ('abc'.startsWith('b', -0), false);
arktest.assertEQ('abc'.startsWith('ab', -0), true);
arktest.assertEQ('abc'.startsWith('bc', -0), false);
arktest.assertEQ('abc'.startsWith('abc', -0), true);
arktest.assertEQ('abc'.startsWith('bcd', -0), false);
arktest.assertEQ('abc'.startsWith('abcd', -0), false);
arktest.assertEQ('abc'.startsWith('bcde', -0), false);

arktest.assertEQ('abc'.startsWith('', +0), true);
arktest.assertEQ('abc'.startsWith('\0', +0), false);
arktest.assertEQ('abc'.startsWith('a', +0), true);
arktest.assertEQ('abc'.startsWith('b', +0), false);
arktest.assertEQ('abc'.startsWith('ab', +0), true);
arktest.assertEQ('abc'.startsWith('bc', +0), false);
arktest.assertEQ('abc'.startsWith('abc', +0), true);
arktest.assertEQ('abc'.startsWith('bcd', +0), false);
arktest.assertEQ('abc'.startsWith('abcd', +0), false);
arktest.assertEQ('abc'.startsWith('bcde', +0), false);

arktest.assertEQ('abc'.startsWith('', 1), true);
arktest.assertEQ('abc'.startsWith('\0', 1), false);
arktest.assertEQ('abc'.startsWith('a', 1), false);
arktest.assertEQ('abc'.startsWith('b', 1), true);
arktest.assertEQ('abc'.startsWith('ab', 1), false);
arktest.assertEQ('abc'.startsWith('bc', 1), true);
arktest.assertEQ('abc'.startsWith('abc', 1), false);
arktest.assertEQ('abc'.startsWith('bcd', 1), false);
arktest.assertEQ('abc'.startsWith('abcd', 1), false);
arktest.assertEQ('abc'.startsWith('bcde', 1), false);

arktest.assertEQ('abc'.startsWith('', +Infinity), true);
arktest.assertEQ('abc'.startsWith('\0', +Infinity), false);
arktest.assertEQ('abc'.startsWith('a', +Infinity), false);
arktest.assertEQ('abc'.startsWith('b', +Infinity), false);
arktest.assertEQ('abc'.startsWith('ab', +Infinity), false);
arktest.assertEQ('abc'.startsWith('bc', +Infinity), false);
arktest.assertEQ('abc'.startsWith('abc', +Infinity), false);
arktest.assertEQ('abc'.startsWith('bcd', +Infinity), false);
arktest.assertEQ('abc'.startsWith('abcd', +Infinity), false);
arktest.assertEQ('abc'.startsWith('bcde', +Infinity), false);

arktest.assertEQ('abc'.startsWith('', true), true);
arktest.assertEQ('abc'.startsWith('\0', true), false);
arktest.assertEQ('abc'.startsWith('a', true), false);
arktest.assertEQ('abc'.startsWith('b', true), true);
arktest.assertEQ('abc'.startsWith('ab', true), false);
arktest.assertEQ('abc'.startsWith('bc', true), true);
arktest.assertEQ('abc'.startsWith('abc', true), false);
arktest.assertEQ('abc'.startsWith('bcd', true), false);
arktest.assertEQ('abc'.startsWith('abcd', true), false);
arktest.assertEQ('abc'.startsWith('bcde', true), false);

arktest.assertEQ('abc'.startsWith('', 'x'), true);
arktest.assertEQ('abc'.startsWith('\0', 'x'), false);
arktest.assertEQ('abc'.startsWith('a', 'x'), true);
arktest.assertEQ('abc'.startsWith('b', 'x'), false);
arktest.assertEQ('abc'.startsWith('ab', 'x'), true);
arktest.assertEQ('abc'.startsWith('bc', 'x'), false);
arktest.assertEQ('abc'.startsWith('abc', 'x'), true);
arktest.assertEQ('abc'.startsWith('bcd', 'x'), false);
arktest.assertEQ('abc'.startsWith('abcd', 'x'), false);
arktest.assertEQ('abc'.startsWith('bcde', 'x'), false);

arktest.assertEQ('[a-z]+(bar)?'.startsWith('[a-z]+'), true);
arktest.expectThrow(function() { '[a-z]+(bar)?'.startsWith(/[a-z]+/); }, ((e: Error): boolean => e instanceof TypeError));
arktest.assertEQ('[a-z]+(bar)?'.startsWith('(bar)?', 6), true);
arktest.expectThrow(function() { '[a-z]+(bar)?'.startsWith(/(bar)?/); }, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() { '[a-z]+/(bar)?/'.startsWith(/(bar)?/); }, ((e: Error): boolean => e instanceof TypeError));

// http://mathiasbynens.be/notes/javascript-unicode#poo-test
const string = 'I\xF1t\xEBrn\xE2ti\xF4n\xE0liz\xE6ti\xF8n\u2603\uD83D\uDCA9';
arktest.assertEQ(string.startsWith(''), true);
arktest.assertEQ(string.startsWith('\xF1t\xEBr'), false);
arktest.assertEQ(string.startsWith('\xF1t\xEBr', 1), true);
arktest.assertEQ(string.startsWith('\xE0liz\xE6'), false);
arktest.assertEQ(string.startsWith('\xE0liz\xE6', 11), true);
arktest.assertEQ(string.startsWith('\xF8n\u2603\uD83D\uDCA9'), false);
arktest.assertEQ(string.startsWith('\xF8n\u2603\uD83D\uDCA9', 18), true);
arktest.assertEQ(string.startsWith('\u2603'), false);
arktest.assertEQ(string.startsWith('\u2603', 20), true);
arktest.assertEQ(string.startsWith('\uD83D\uDCA9'), false);
arktest.assertEQ(string.startsWith('\uD83D\uDCA9', 21), true);

arktest.expectThrow(function() {
  String.prototype.startsWith.call(undefined);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.startsWith.call(undefined, 'b');
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.startsWith.call(undefined, 'b', 4);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.startsWith.call(null);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.startsWith.call(null, 'b');
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.startsWith.call(null, 'b', 4);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.assertEQ(String.prototype.startsWith.call(42, '2'), false);
arktest.assertEQ(String.prototype.startsWith.call(42, '4'), true);
arktest.assertEQ(String.prototype.startsWith.call(42, 'b', 4), false);
arktest.assertEQ(String.prototype.startsWith.call(42, '2', 1), true);
arktest.assertEQ(String.prototype.startsWith.call(42, '2', 4), false);
arktest.assertEQ(String.prototype.startsWith.call({
  'toString': function() { return 'abc'; }
}, 'b', 0), false);
arktest.assertEQ(String.prototype.startsWith.call({
  'toString': function() { return 'abc'; }
}, 'b', 1), true);
arktest.assertEQ(String.prototype.startsWith.call({
  'toString': function() { return 'abc'; }
}, 'b', 2), false);
arktest.expectThrow(function() {
  String.prototype.startsWith.call({
    'toString': function() { throw RangeError(); }
  }, /./);
}, ((e: Error): boolean => e instanceof RangeError));
arktest.expectThrow(function() {
  String.prototype.startsWith.call({
    'toString': function() { return 'abc'; }
  }, /./);
}, ((e: Error): boolean => e instanceof TypeError));

arktest.expectThrow(function() {
  String.prototype.startsWith.apply(undefined);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.startsWith.apply(undefined, ['b']);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.startsWith.apply(undefined, ['b', 4]);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.startsWith.apply(null);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.startsWith.apply(null, ['b']);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.startsWith.apply(null, ['b', 4]);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.assertEQ(String.prototype.startsWith.apply(42, ['2']), false);
arktest.assertEQ(String.prototype.startsWith.apply(42, ['4']), true);
arktest.assertEQ(String.prototype.startsWith.apply(42, ['b', 4]), false);
arktest.assertEQ(String.prototype.startsWith.apply(42, ['2', 1]), true);
arktest.assertEQ(String.prototype.startsWith.apply(42, ['2', 4]), false);
arktest.assertEQ(String.prototype.startsWith.apply({
  'toString': function() {
    return 'abc';
  }
}, ['b', 0]), false);
arktest.assertEQ(String.prototype.startsWith.apply({
  'toString': function() {
    return 'abc';
  }
}, ['b', 1]), true);
arktest.assertEQ(String.prototype.startsWith.apply({
  'toString': function() {
    return 'abc';
  }
}, ['b', 2]), false);
arktest.expectThrow(function() {
  String.prototype.startsWith.apply({
    'toString': function() { throw RangeError(); }
  }, [/./]);
}, ((e: Error): boolean => e instanceof RangeError));
arktest.expectThrow(function() {
  String.prototype.startsWith.apply({
    'toString': function() { return 'abc'; }
  }, [/./]);
}, ((e: Error): boolean => e instanceof TypeError));

// startsWith does its brand checks with Symbol.match
const re = /./;
arktest.expectThrow(function() {
  ''.startsWith(re);
}, ((e: Error): boolean => e instanceof TypeError));
re[Symbol.match] = false;
arktest.assertEQ(false, ''.startsWith(re));
