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

const r1 = /abc/gi;
arktest.assertEQ('abc', r1.source);
arktest.assertTrue(r1.global);
arktest.assertTrue(r1.ignoreCase);
arktest.assertFalse(r1.multiline);
arktest.assertFalse(r1.sticky);
arktest.assertFalse(r1.unicode);

// Internal slot of prototype is not read.
const r2 = { __proto__: r1 };
arktest.expectThrow(function() { r2.source; }, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() { r2.global; }, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() { r2.ignoreCase; }, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() { r2.multiline; }, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() { r2.sticky; }, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() { r2.unicode; }, ((e: Error): boolean => e instanceof TypeError));

const r3 = /I/;
const string = 'iIiIi';
const expected = 'iXiIi';
arktest.assertFalse(r3.global);
arktest.assertFalse(r3.ignoreCase);
arktest.assertEQ('', r3.flags);
arktest.assertEQ(expected, string.replace(r3, 'X'));

let getCount = 0;
Object.defineProperty(r3, 'global', {
  get: function() { getCount++; return true; }
});
Object.defineProperty(r3, 'ignoreCase', {
  get: function() { getCount++; return true; }
});

arktest.assertTrue(r3.global);
arktest.assertEQ(1, getCount);
arktest.assertTrue(r3.ignoreCase);
arktest.assertEQ(2, getCount);
// Overridden flag getters affects the flags getter.
arktest.assertEQ('gi', r3.flags);
arktest.assertEQ(4, getCount);
// Overridden flag getters affect string.replace
// TODO(adamk): Add more tests here once we've switched
// to use [[OriginalFlags]] in more cases.
// TODO(jgruber): This exact case actually causes an infinite loop in the spec
// (@@replace sees global = true while BuiltinExec sees global = false).
// Comment the test for now and remove / fix once this has been resolved on
// the spec side.


function testName(name) {
  // Test for ES2017 RegExp web compatibility semantics
  // https://github.com/tc39/ecma262/pull/511
  arktest.assertEQ(name === 'source' ? '(?:)' : undefined,
               RegExp.prototype[name]);
  arktest.assertEQ(
      'get ' + name,
      Object.getOwnPropertyDescriptor(RegExp.prototype, name).get.name);
}

testName('global');
testName('ignoreCase');
testName('multiline');
testName('source');
testName('sticky');
testName('unicode');

// Openharmony only support strict mode.

arktest.assertEQ('', RegExp('').flags);
arktest.assertEQ('', /./.flags);
arktest.assertEQ('gimuy', RegExp('', 'yugmi').flags);
arktest.assertEQ('gimuy', /foo/yumig.flags);

const descriptor = Object.getOwnPropertyDescriptor(RegExp.prototype, 'flags');
arktest.assertTrue(descriptor.configurable);
arktest.assertFalse(descriptor.enumerable);
arktest.assertTrue(descriptor.get instanceof Function);
arktest.assertEQ(undefined, descriptor.set);

function testGenericFlags(object) {
  return descriptor.get.call(object);
}

arktest.assertEQ('', testGenericFlags({}));
arktest.assertEQ('i', testGenericFlags({ ignoreCase: true }));
arktest.assertEQ('uy', testGenericFlags({ global: 0, sticky: 1, unicode: 1 }));
arktest.assertEQ('m', testGenericFlags({ __proto__: { multiline: true } }));
arktest.expectThrow(function() { testGenericFlags(); }, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() { testGenericFlags(undefined); }, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() { testGenericFlags(null); }, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() { testGenericFlags(true); }, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() { testGenericFlags(false); }, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() { testGenericFlags(''); }, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() { testGenericFlags(42); }, ((e: Error): boolean => e instanceof TypeError));

let counter = 0;
const map = {};
let object = {
  get global() {
    map.g = counter++;
  },
  get ignoreCase() {
    map.i = counter++;
  },
  get multiline() {
    map.m = counter++;
  },
  get unicode() {
    map.u = counter++;
  },
  get sticky() {
    map.y = counter++;
  }
};
testGenericFlags(object);
arktest.assertEQ({ g: 0, i: 1, m: 2, u: 3, y: 4 }, map);
