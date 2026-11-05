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

// Arrow functions are like functions, except they throw when using the
// "new" operator on them.

/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0087: Property 'getPrototypeOf' does not exist on type 'Object'"
---*/

arktest.assertEQ('function', typeof (() => {}));
const arrowPrototype: Any = Object.getPrototypeOf(() => {});
arktest.assertEQ(Function.prototype as Any, arrowPrototype);
arktest.expectThrow(function() { new (() => {}); }, ((e: Error): boolean => e instanceof TypeError));
arktest.assertFalse('prototype' in (() => {}));

// Check the different syntax variations
arktest.assertEQ(1, (() => 1)());
arktest.assertEQ(2, (a => a + 1)(1));
arktest.assertEQ(3, (() => { return 3; })());
arktest.assertEQ(4, (a => { return a + 3; })(1));
arktest.assertEQ(5, ((a, b) => a + b)(1, 4));
arktest.assertEQ(6, ((a, b) => { return a + b; })(1, 5));

// The following are tests from:
// http://wiki.ecmascript.org/doku.php?id=harmony:arrow_function_syntax

// Empty arrow function returns undefined
const empty = () => {};
arktest.assertEQ(undefined, empty());

// Single parameter case needs no parentheses around parameter list
const identity = x => x;
arktest.assertEQ(empty, identity(empty));

// No need for parentheses even for lower-precedence expression body
const square = x => x * x;
arktest.assertEQ(9, square(3));

// Parenthesize the body to return an object literal expression
const keyMaker = val => ({key: val});
arktest.assertEQ(empty, keyMaker(empty).key);

// Statement body needs braces, must use 'return' explicitly if not void
const evens = [0, 2, 4, 6, 8];
arktest.assertEQ([1, 3, 5, 7, 9], evens.map(v => v + 1));

const fives = [];
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].forEach(v => {
  if (v % 5 === 0) { fives.push(v); }
});
arktest.assertEQ([5, 10], fives);

(function testRestrictedFunctionPropertiesStrict() {
  let arrowFn = () => { 'use strict'; };
  arktest.assertFalse(arrowFn.hasOwnProperty('arguments'));
  arktest.expectThrow(function() { return arrowFn.arguments; }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { arrowFn.arguments = {}; }, ((e: Error): boolean => e instanceof TypeError));

  arktest.assertFalse(arrowFn.hasOwnProperty('caller'));
  arktest.expectThrow(function() { return arrowFn.caller; }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { arrowFn.caller = {}; }, ((e: Error): boolean => e instanceof TypeError));
})();


(function testRestrictedFunctionPropertiesSloppy() {
  let arrowFn = () => {};
  arktest.assertFalse(arrowFn.hasOwnProperty('arguments'));
  arktest.expectThrow(function() { return arrowFn.arguments; }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { arrowFn.arguments = {}; }, ((e: Error): boolean => e instanceof TypeError));

  arktest.assertFalse(arrowFn.hasOwnProperty('caller'));
  arktest.expectThrow(function() { return arrowFn.caller; }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { arrowFn.caller = {}; }, ((e: Error): boolean => e instanceof TypeError));
})();


// upstream engine:4474
(function testConciseBodyReturnsRegexp() {
  const arrow1 = () => /foo/
  const arrow2 = () => /foo/;
  const arrow3 = () => /foo/i
  const arrow4 = () => /foo/i;
  arktest.assertEQ(arrow1.toString(), '() => /foo/');
  arktest.assertEQ(arrow2.toString(), '() => /foo/');
  arktest.assertEQ(arrow3.toString(), '() => /foo/i');
  arktest.assertEQ(arrow4.toString(), '() => /foo/i');
});
