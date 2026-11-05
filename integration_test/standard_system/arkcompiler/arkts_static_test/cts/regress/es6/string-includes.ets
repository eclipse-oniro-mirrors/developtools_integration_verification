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

const condition: boolean = String.prototype.includes.length === 1;
arktest.assertTrue(condition);

let s = 'a';
arktest.assertFalse(s.includes(null));
arktest.assertFalse(s.includes(undefined));
arktest.assertFalse(s.includes());

const reString = 'asdf[a-z]+(asdf)?';
arktest.assertTrue(reString.includes('[a-z]+'));
arktest.assertTrue(reString.includes('(asdf)?'));

// Random greek letters
const twoByteString = '\u039a\u0391\u03a3\u03a3\u0395';

// Test single char pattern
arktest.assertTrue(twoByteString.includes('\u039a'), 'Lamda');
arktest.assertTrue(twoByteString.includes('\u0391'), 'Alpha');
arktest.assertTrue(twoByteString.includes('\u03a3'), 'First Sigma');
arktest.assertTrue(twoByteString.includes('\u03a3',3), 'Second Sigma');
arktest.assertTrue(twoByteString.includes('\u0395'), 'Epsilon');
arktest.assertFalse(twoByteString.includes('\u0392'), 'Not beta');

// Test multi-char pattern
arktest.assertTrue(twoByteString.includes('\u039a\u0391'), 'lambda Alpha');
arktest.assertTrue(twoByteString.includes('\u0391\u03a3'), 'Alpha Sigma');
arktest.assertTrue(twoByteString.includes('\u03a3\u03a3'), 'Sigma Sigma');
arktest.assertTrue(twoByteString.includes('\u03a3\u0395'), 'Sigma Epsilon');

arktest.assertFalse(twoByteString.includes('\u0391\u03a3\u0395'),
    'Not Alpha Sigma Epsilon');

//single char pattern
arktest.assertTrue(twoByteString.includes('\u0395'));

arktest.expectThrow('String.prototype.includes.call(null, \'test\')', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('String.prototype.includes.call(null, null)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('String.prototype.includes.call(undefined, undefined)', ((e: Error): boolean => e instanceof TypeError));

arktest.expectThrow('String.prototype.includes.apply(null, [\'test\'])', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('String.prototype.includes.apply(null, [null])', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('String.prototype.includes.apply(undefined, [undefined])', ((e: Error): boolean => e instanceof TypeError));

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

let i = 0;
const l = TEST_INPUT.length;

for (; i < l; i++) {
  let e = TEST_INPUT[i];
  const v = e.val;
  let s = String(v);
  arktest.assertTrue(s.includes(v), e.msg);
  arktest.assertTrue(String.prototype.includes.call(v, v), e.msg);
  arktest.assertTrue(String.prototype.includes.apply(v, [v]), e.msg);
}

// Test cases found in FF
arktest.assertTrue('abc'.includes('a'));
arktest.assertTrue('abc'.includes('b'));
arktest.assertTrue('abc'.includes('abc'));
arktest.assertTrue('abc'.includes('bc'));
arktest.assertFalse('abc'.includes('d'));
arktest.assertFalse('abc'.includes('abcd'));
arktest.assertFalse('abc'.includes('ac'));
arktest.assertTrue('abc'.includes('abc', 0));
arktest.assertTrue('abc'.includes('bc', 0));
arktest.assertFalse('abc'.includes('de', 0));
arktest.assertTrue('abc'.includes('bc', 1));
arktest.assertTrue('abc'.includes('c', 1));
arktest.assertFalse('abc'.includes('a', 1));
arktest.assertFalse('abc'.includes('abc', 1));
arktest.assertTrue('abc'.includes('c', 2));
arktest.assertFalse('abc'.includes('d', 2));
arktest.assertFalse('abc'.includes('dcd', 2));
arktest.assertFalse('abc'.includes('a', 42));
arktest.assertFalse('abc'.includes('a', Infinity));
arktest.assertTrue('abc'.includes('ab', -43));
arktest.assertFalse('abc'.includes('cd', -42));
arktest.assertTrue('abc'.includes('ab', -Infinity));
arktest.assertFalse('abc'.includes('cd', -Infinity));
arktest.assertTrue('abc'.includes('ab', NaN));
arktest.assertFalse('abc'.includes('cd', NaN));
arktest.assertFalse('xyzzy'.includes('zy\0', 2));

const dots = Array(10000).join('.');
arktest.assertFalse(dots.includes('\x01', 10000));
arktest.assertFalse(dots.includes('\0', 10000));

let myobj = {
  toString: function () {
    return 'abc';
  },
  includes: String.prototype.includes
};
arktest.assertTrue(myobj.includes('abc'));
arktest.assertFalse(myobj.includes('cd'));

let gotStr = false;
const gotPos = false;
myobj = {
  toString: function () {
    arktest.assertFalse(gotPos);
    gotStr = true;
    return 'xyz';
  },
  includes: String.prototype.includes
};

arktest.assertEQ('foo[a-z]+(bar)?'.includes('[a-z]+'), true);
arktest.expectThrow('\'foo[a-z]+(bar)?\'.includes(/[a-z]+/)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('\'foo/[a-z]+/(bar)?\'.includes(/[a-z]+/)', ((e: Error): boolean => e instanceof TypeError));
arktest.assertEQ('foo[a-z]+(bar)?'.includes('(bar)?'), true);
arktest.expectThrow('\'foo[a-z]+(bar)?\'.includes(/(bar)?/)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('\'foo[a-z]+/(bar)?/\'.includes(/(bar)?/)', ((e: Error): boolean => e instanceof TypeError));

arktest.expectThrow('String.prototype.includes.call({ \'toString\': function() { ' +
  'throw RangeError(); } }, /./)', RangeError);
arktest.expectThrow('String.prototype.includes.call({ \'toString\': function() { ' +
  'return \'abc\'; } }, /./)', TypeError);

arktest.expectThrow('String.prototype.includes.apply({ \'toString\': function() { ' +
  'throw RangeError(); } }, [/./])', RangeError);
arktest.expectThrow('String.prototype.includes.apply({ \'toString\': function() { ' +
  'return \'abc\'; } }, [/./])', TypeError);

// includes does its brand checks with Symbol.match
const re = /./;
arktest.expectThrow(function() {
  ''.includes(re);
}, ((e: Error): boolean => e instanceof TypeError));
re[Symbol.match] = false;
arktest.assertEQ(false, ''.includes(re));
