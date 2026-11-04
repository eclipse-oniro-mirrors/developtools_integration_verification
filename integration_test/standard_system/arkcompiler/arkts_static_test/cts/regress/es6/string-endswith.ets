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
expected_out_1: "Semantic error ESE0087: Property 'prototype' does not exist on type 'String'"
---*/

const condition: boolean = String.prototype.endsWith.length === 1;
arktest.assertTrue(condition);

const testString = 'Hello World';
arktest.assertTrue(testString.endsWith(''));
arktest.assertTrue(testString.endsWith('World'));
arktest.assertFalse(testString.endsWith('world'));
arktest.assertFalse(testString.endsWith('Hello World!'));
arktest.assertFalse(testString.endsWith(null));
arktest.assertFalse(testString.endsWith(undefined));
arktest.assertFalse(testString.endsWith());

arktest.assertTrue('null'.endsWith(null));
arktest.assertTrue('undefined'.endsWith(undefined));

const georgianUnicodeString = '\u10D0\u10D1\u10D2\u10D3\u10D4\u10D5\u10D6\u10D7';
arktest.assertTrue(georgianUnicodeString.endsWith(georgianUnicodeString));
arktest.assertTrue(georgianUnicodeString.endsWith('\u10D4\u10D5\u10D6\u10D7'));
arktest.assertFalse(georgianUnicodeString.endsWith('\u10D0'));

arktest.expectThrow('String.prototype.endsWith.call(null, \'test\')', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('String.prototype.endsWith.call(null, null)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('String.prototype.endsWith.call(undefined, undefined)', ((e: Error): boolean => e instanceof TypeError));

arktest.expectThrow('String.prototype.endsWith.apply(null, [\'test\'])', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('String.prototype.endsWith.apply(null, [null])', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('String.prototype.endsWith.apply(undefined, [undefined])', ((e: Error): boolean => e instanceof TypeError));

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
    arktest.assertTrue(s.endsWith(v), e.msg);
    arktest.assertTrue(String.prototype.endsWith.call(v, v), e.msg);
    arktest.assertTrue(String.prototype.endsWith.apply(v, [v]), e.msg);
  }
}
testNonStringValues();

// Test cases found in FF
arktest.assertTrue('abc'.endsWith('abc'));
arktest.assertTrue('abcd'.endsWith('bcd'));
arktest.assertTrue('abc'.endsWith('c'));
arktest.assertFalse('abc'.endsWith('abcd'));
arktest.assertFalse('abc'.endsWith('bbc'));
arktest.assertFalse('abc'.endsWith('b'));
arktest.assertTrue('abc'.endsWith('abc', 3));
arktest.assertTrue('abc'.endsWith('bc', 3));
arktest.assertFalse('abc'.endsWith('a', 3));
arktest.assertTrue('abc'.endsWith('bc', 3));
arktest.assertTrue('abc'.endsWith('a', 1));
arktest.assertFalse('abc'.endsWith('abc', 1));
arktest.assertTrue('abc'.endsWith('b', 2));
arktest.assertFalse('abc'.endsWith('d', 2));
arktest.assertFalse('abc'.endsWith('dcd', 2));
arktest.assertFalse('abc'.endsWith('a', 42));
arktest.assertTrue('abc'.endsWith('bc', Infinity));
arktest.assertFalse('abc'.endsWith('a', Infinity));
arktest.assertTrue('abc'.endsWith('bc', undefined));
arktest.assertFalse('abc'.endsWith('bc', -43));
arktest.assertFalse('abc'.endsWith('bc', -Infinity));
arktest.assertFalse('abc'.endsWith('bc', NaN));

// Test cases taken from
Object.prototype[1] = 2; // try to break `arguments[1]`

arktest.assertEQ(String.prototype.endsWith.length, 1);
arktest.assertEQ(String.prototype.propertyIsEnumerable('endsWith'), false);

arktest.assertEQ('undefined'.endsWith(), true);
arktest.assertEQ('undefined'.endsWith(undefined), true);
arktest.assertEQ('undefined'.endsWith(null), false);
arktest.assertEQ('null'.endsWith(), false);
arktest.assertEQ('null'.endsWith(undefined), false);
arktest.assertEQ('null'.endsWith(null), true);

arktest.assertEQ('abc'.endsWith(), false);
arktest.assertEQ('abc'.endsWith(''), true);
arktest.assertEQ('abc'.endsWith('\0'), false);
arktest.assertEQ('abc'.endsWith('c'), true);
arktest.assertEQ('abc'.endsWith('b'), false);
arktest.assertEQ('abc'.endsWith('ab'), false);
arktest.assertEQ('abc'.endsWith('bc'), true);
arktest.assertEQ('abc'.endsWith('abc'), true);
arktest.assertEQ('abc'.endsWith('bcd'), false);
arktest.assertEQ('abc'.endsWith('abcd'), false);
arktest.assertEQ('abc'.endsWith('bcde'), false);

arktest.assertEQ('abc'.endsWith('', NaN), true);
arktest.assertEQ('abc'.endsWith('\0', NaN), false);
arktest.assertEQ('abc'.endsWith('c', NaN), false);
arktest.assertEQ('abc'.endsWith('b', NaN), false);
arktest.assertEQ('abc'.endsWith('ab', NaN), false);
arktest.assertEQ('abc'.endsWith('bc', NaN), false);
arktest.assertEQ('abc'.endsWith('abc', NaN), false);
arktest.assertEQ('abc'.endsWith('bcd', NaN), false);
arktest.assertEQ('abc'.endsWith('abcd', NaN), false);
arktest.assertEQ('abc'.endsWith('bcde', NaN), false);

arktest.assertEQ('abc'.endsWith('', false), true);
arktest.assertEQ('abc'.endsWith('\0', false), false);
arktest.assertEQ('abc'.endsWith('c', false), false);
arktest.assertEQ('abc'.endsWith('b', false), false);
arktest.assertEQ('abc'.endsWith('ab', false), false);
arktest.assertEQ('abc'.endsWith('bc', false), false);
arktest.assertEQ('abc'.endsWith('abc', false), false);
arktest.assertEQ('abc'.endsWith('bcd', false), false);
arktest.assertEQ('abc'.endsWith('abcd', false), false);
arktest.assertEQ('abc'.endsWith('bcde', false), false);

arktest.assertEQ('abc'.endsWith('', undefined), true);
arktest.assertEQ('abc'.endsWith('\0', undefined), false);
arktest.assertEQ('abc'.endsWith('c', undefined), true);
arktest.assertEQ('abc'.endsWith('b', undefined), false);
arktest.assertEQ('abc'.endsWith('ab', undefined), false);
arktest.assertEQ('abc'.endsWith('bc', undefined), true);
arktest.assertEQ('abc'.endsWith('abc', undefined), true);
arktest.assertEQ('abc'.endsWith('bcd', undefined), false);
arktest.assertEQ('abc'.endsWith('abcd', undefined), false);
arktest.assertEQ('abc'.endsWith('bcde', undefined), false);

arktest.assertEQ('abc'.endsWith('', null), true);
arktest.assertEQ('abc'.endsWith('\0', null), false);
arktest.assertEQ('abc'.endsWith('c', null), false);
arktest.assertEQ('abc'.endsWith('b', null), false);
arktest.assertEQ('abc'.endsWith('ab', null), false);
arktest.assertEQ('abc'.endsWith('bc', null), false);
arktest.assertEQ('abc'.endsWith('abc', null), false);
arktest.assertEQ('abc'.endsWith('bcd', null), false);
arktest.assertEQ('abc'.endsWith('abcd', null), false);
arktest.assertEQ('abc'.endsWith('bcde', null), false);

arktest.assertEQ('abc'.endsWith('', -Infinity), true);
arktest.assertEQ('abc'.endsWith('\0', -Infinity), false);
arktest.assertEQ('abc'.endsWith('c', -Infinity), false);
arktest.assertEQ('abc'.endsWith('b', -Infinity), false);
arktest.assertEQ('abc'.endsWith('ab', -Infinity), false);
arktest.assertEQ('abc'.endsWith('bc', -Infinity), false);
arktest.assertEQ('abc'.endsWith('abc', -Infinity), false);
arktest.assertEQ('abc'.endsWith('bcd', -Infinity), false);
arktest.assertEQ('abc'.endsWith('abcd', -Infinity), false);
arktest.assertEQ('abc'.endsWith('bcde', -Infinity), false);

arktest.assertEQ('abc'.endsWith('', -1), true);
arktest.assertEQ('abc'.endsWith('\0', -1), false);
arktest.assertEQ('abc'.endsWith('c', -1), false);
arktest.assertEQ('abc'.endsWith('b', -1), false);
arktest.assertEQ('abc'.endsWith('ab', -1), false);
arktest.assertEQ('abc'.endsWith('bc', -1), false);
arktest.assertEQ('abc'.endsWith('abc', -1), false);
arktest.assertEQ('abc'.endsWith('bcd', -1), false);
arktest.assertEQ('abc'.endsWith('abcd', -1), false);
arktest.assertEQ('abc'.endsWith('bcde', -1), false);

arktest.assertEQ('abc'.endsWith('', -0), true);
arktest.assertEQ('abc'.endsWith('\0', -0), false);
arktest.assertEQ('abc'.endsWith('c', -0), false);
arktest.assertEQ('abc'.endsWith('b', -0), false);
arktest.assertEQ('abc'.endsWith('ab', -0), false);
arktest.assertEQ('abc'.endsWith('bc', -0), false);
arktest.assertEQ('abc'.endsWith('abc', -0), false);
arktest.assertEQ('abc'.endsWith('bcd', -0), false);
arktest.assertEQ('abc'.endsWith('abcd', -0), false);
arktest.assertEQ('abc'.endsWith('bcde', -0), false);

arktest.assertEQ('abc'.endsWith('', +0), true);
arktest.assertEQ('abc'.endsWith('\0', +0), false);
arktest.assertEQ('abc'.endsWith('c', +0), false);
arktest.assertEQ('abc'.endsWith('b', +0), false);
arktest.assertEQ('abc'.endsWith('ab', +0), false);
arktest.assertEQ('abc'.endsWith('bc', +0), false);
arktest.assertEQ('abc'.endsWith('abc', +0), false);
arktest.assertEQ('abc'.endsWith('bcd', +0), false);
arktest.assertEQ('abc'.endsWith('abcd', +0), false);
arktest.assertEQ('abc'.endsWith('bcde', +0), false);

arktest.assertEQ('abc'.endsWith('', 1), true);
arktest.assertEQ('abc'.endsWith('\0', 1), false);
arktest.assertEQ('abc'.endsWith('c', 1), false);
arktest.assertEQ('abc'.endsWith('b', 1), false);
arktest.assertEQ('abc'.endsWith('ab', 1), false);
arktest.assertEQ('abc'.endsWith('bc', 1), false);
arktest.assertEQ('abc'.endsWith('abc', 1), false);
arktest.assertEQ('abc'.endsWith('bcd', 1), false);
arktest.assertEQ('abc'.endsWith('abcd', 1), false);
arktest.assertEQ('abc'.endsWith('bcde', 1), false);

arktest.assertEQ('abc'.endsWith('', 2), true);
arktest.assertEQ('abc'.endsWith('\0', 2), false);
arktest.assertEQ('abc'.endsWith('c', 2), false);
arktest.assertEQ('abc'.endsWith('b', 2), true);
arktest.assertEQ('abc'.endsWith('ab', 2), true);
arktest.assertEQ('abc'.endsWith('bc', 2), false);
arktest.assertEQ('abc'.endsWith('abc', 2), false);
arktest.assertEQ('abc'.endsWith('bcd', 2), false);
arktest.assertEQ('abc'.endsWith('abcd', 2), false);
arktest.assertEQ('abc'.endsWith('bcde', 2), false);

arktest.assertEQ('abc'.endsWith('', +Infinity), true);
arktest.assertEQ('abc'.endsWith('\0', +Infinity), false);
arktest.assertEQ('abc'.endsWith('c', +Infinity), true);
arktest.assertEQ('abc'.endsWith('b', +Infinity), false);
arktest.assertEQ('abc'.endsWith('ab', +Infinity), false);
arktest.assertEQ('abc'.endsWith('bc', +Infinity), true);
arktest.assertEQ('abc'.endsWith('abc', +Infinity), true);
arktest.assertEQ('abc'.endsWith('bcd', +Infinity), false);
arktest.assertEQ('abc'.endsWith('abcd', +Infinity), false);
arktest.assertEQ('abc'.endsWith('bcde', +Infinity), false);

arktest.assertEQ('abc'.endsWith('', true), true);
arktest.assertEQ('abc'.endsWith('\0', true), false);
arktest.assertEQ('abc'.endsWith('c', true), false);
arktest.assertEQ('abc'.endsWith('b', true), false);
arktest.assertEQ('abc'.endsWith('ab', true), false);
arktest.assertEQ('abc'.endsWith('bc', true), false);
arktest.assertEQ('abc'.endsWith('abc', true), false);
arktest.assertEQ('abc'.endsWith('bcd', true), false);
arktest.assertEQ('abc'.endsWith('abcd', true), false);
arktest.assertEQ('abc'.endsWith('bcde', true), false);

arktest.assertEQ('abc'.endsWith('', 'x'), true);
arktest.assertEQ('abc'.endsWith('\0', 'x'), false);
arktest.assertEQ('abc'.endsWith('c', 'x'), false);
arktest.assertEQ('abc'.endsWith('b', 'x'), false);
arktest.assertEQ('abc'.endsWith('ab', 'x'), false);
arktest.assertEQ('abc'.endsWith('bc', 'x'), false);
arktest.assertEQ('abc'.endsWith('abc', 'x'), false);
arktest.assertEQ('abc'.endsWith('bcd', 'x'), false);
arktest.assertEQ('abc'.endsWith('abcd', 'x'), false);
arktest.assertEQ('abc'.endsWith('bcde', 'x'), false);

arktest.assertEQ('[a-z]+(bar)?'.endsWith('(bar)?'), true);
arktest.expectThrow(function() {
  '[a-z]+(bar)?'.endsWith(/(bar)?/);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.assertEQ('[a-z]+(bar)?'.endsWith('[a-z]+', 6), true);
arktest.expectThrow(function() {
  '[a-z]+(bar)?'.endsWith(/(bar)?/);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  '[a-z]+/(bar)?/'.endsWith(/(bar)?/);
}, ((e: Error): boolean => e instanceof TypeError));

// http://mathiasbynens.be/notes/javascript-unicode#poo-test
const string = 'I\xF1t\xEBrn\xE2ti\xF4n\xE0liz\xE6ti\xF8n\u2603\uD83D\uDCA9';
arktest.assertEQ(string.endsWith(''), true);
arktest.assertEQ(string.endsWith('\xF1t\xEBr'), false);
arktest.assertEQ(string.endsWith('\xF1t\xEBr', 5), true);
arktest.assertEQ(string.endsWith('\xE0liz\xE6'), false);
arktest.assertEQ(string.endsWith('\xE0liz\xE6', 16), true);
arktest.assertEQ(string.endsWith('\xF8n\u2603\uD83D\uDCA9'), true);
arktest.assertEQ(string.endsWith('\xF8n\u2603\uD83D\uDCA9', 23), true);
arktest.assertEQ(string.endsWith('\u2603'), false);
arktest.assertEQ(string.endsWith('\u2603', 21), true);
arktest.assertEQ(string.endsWith('\uD83D\uDCA9'), true);
arktest.assertEQ(string.endsWith('\uD83D\uDCA9', 23), true);

arktest.expectThrow(function() {
  String.prototype.endsWith.call(undefined);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.endsWith.call(undefined, 'b');
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.endsWith.call(undefined, 'b', 4);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.endsWith.call(null);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.endsWith.call(null, 'b');
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.endsWith.call(null, 'b', 4);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.assertEQ(String.prototype.endsWith.call(42, '2'), true);
arktest.assertEQ(String.prototype.endsWith.call(42, '4'), false);
arktest.assertEQ(String.prototype.endsWith.call(42, 'b', 4), false);
arktest.assertEQ(String.prototype.endsWith.call(42, '2', 1), false);
arktest.assertEQ(String.prototype.endsWith.call(42, '2', 4), true);
arktest.assertEQ(String.prototype.endsWith.call({
  'toString': function() { return 'abc'; }
}, 'b', 0), false);
arktest.assertEQ(String.prototype.endsWith.call({
  'toString': function() { return 'abc'; }
}, 'b', 1), false);
arktest.assertEQ(String.prototype.endsWith.call({
  'toString': function() { return 'abc'; }
}, 'b', 2), true);
arktest.expectThrow(function() {
  String.prototype.endsWith.call({
    'toString': function() { throw RangeError(); }
  }, /./);
}, ((e: Error): boolean => e instanceof RangeError));
arktest.expectThrow(function() {
  String.prototype.endsWith.call({
    'toString': function() { return 'abc'; }
  }, /./);
}, ((e: Error): boolean => e instanceof TypeError));

arktest.expectThrow(function() {
  String.prototype.endsWith.apply(undefined);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.endsWith.apply(undefined, ['b']);
},
TypeError);
arktest.expectThrow(function() {
  String.prototype.endsWith.apply(undefined, ['b', 4]);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.endsWith.apply(null);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.endsWith.apply(null, ['b']);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() {
  String.prototype.endsWith.apply(null, ['b', 4]);
}, ((e: Error): boolean => e instanceof TypeError));
arktest.assertEQ(String.prototype.endsWith.apply(42, ['2']), true);
arktest.assertEQ(String.prototype.endsWith.apply(42, ['4']), false);
arktest.assertEQ(String.prototype.endsWith.apply(42, ['b', 4]), false);
arktest.assertEQ(String.prototype.endsWith.apply(42, ['2', 1]), false);
arktest.assertEQ(String.prototype.endsWith.apply(42, ['2', 4]), true);
arktest.assertEQ(String.prototype.endsWith.apply({
  'toString': function() { return 'abc'; }
}, ['b', 0]), false);
arktest.assertEQ(String.prototype.endsWith.apply({
  'toString': function() { return 'abc'; }
}, ['b', 1]), false);
arktest.assertEQ(String.prototype.endsWith.apply({
  'toString': function() { return 'abc'; }
}, ['b', 2]), true);
arktest.expectThrow(function() {
  String.prototype.endsWith.apply({
    'toString': function() { throw RangeError(); }
  }, [/./]);
}, ((e: Error): boolean => e instanceof RangeError));
arktest.expectThrow(function() {
  String.prototype.endsWith.apply({
    'toString': function() { return 'abc'; }
  }, [/./]);
}, ((e: Error): boolean => e instanceof TypeError));

// endsWith does its brand checks with Symbol.match
const re = /./;
arktest.expectThrow(function() {
  ''.startsWith(re);
}, ((e: Error): boolean => e instanceof TypeError));
re[Symbol.match] = false;
arktest.assertEQ(false, ''.startsWith(re));

let didThrow = false;
try {
  ''.endsWith(/./);
} catch (err) {
  didThrow = true;
  arktest.assertEQ(err.name, 'TypeError');
  arktest.assertEQ(err.message, 'First argument to String.prototype.endsWith must not be a regular expression');
}
arktest.assertTrue(didThrow);
