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
expected_out_1: "Syntax error ESY0320: Function expressions are not supported, use arrow functions instead"
---*/

(function testRestIndex() {
  arktest.assertEQ(5, ((...args) => args.length)(1,2,3,4,5));
  arktest.assertEQ(4, ((a, ...args) => args.length)(1,2,3,4,5));
  arktest.assertEQ(3, ((a, b, ...args) => args.length)(1,2,3,4,5));
  arktest.assertEQ(2, ((a, b, c, ...args) => args.length)(1,2,3,4,5));
  arktest.assertEQ(1, ((a, b, c, d, ...args) => args.length)(1,2,3,4,5));
  arktest.assertEQ(0, ((a, b, c, d, e, ...args) => args.length)(1,2,3,4,5));
})();

// strictTest and sloppyTest should be called with descending natural
// numbers, as in:
//
//
const strictTest = (() => {
  'use strict';
  return (a, b, ...c) => {
    arktest.assertEQ(Array, c.constructor);
    arktest.assertTrue(Array.isArray(c));

    let expectedLength = (a === undefined) ? 0 : a - 2;
    arktest.assertEQ(expectedLength, c.length);

    for (let i = 2; i < a; ++i) {
      arktest.assertEQ(c[i - 2], a - i);
    }
  };
})();

const sloppyTest = (a, b, ...c) => {
  arktest.assertEQ(Array, c.constructor);
  arktest.assertTrue(Array.isArray(c));

  let expectedLength = (a === undefined) ? 0 : a - 2;
  arktest.assertEQ(expectedLength, c.length);

  for (let i = 2; i < a; ++i) {
    arktest.assertEQ(c[i - 2], a - i);
  }
}


const O = {
  strict: strictTest,
  sloppy: sloppyTest
};

(function testStrictRestParamArity() {
  arktest.assertEQ(2, strictTest.length);
  arktest.assertEQ(2, O.strict.length);
})();


(function testRestParamsStrictMode() {
  strictTest();
  strictTest(2, 1);
  strictTest(6, 5, 4, 3, 2, 1);
  strictTest(3, 2, 1);
  O.strict();
  O.strict(2, 1);
  O.strict(6, 5, 4, 3, 2, 1);
  O.strict(3, 2, 1);
})();


(function testRestParamsStrictModeApply() {
  strictTest.apply(null, []);
  strictTest.apply(null, [2, 1]);
  strictTest.apply(null, [6, 5, 4, 3, 2, 1]);
  strictTest.apply(null, [3, 2, 1]);
  O.strict.apply(O, []);
  O.strict.apply(O, [2, 1]);
  O.strict.apply(O, [6, 5, 4, 3, 2, 1]);
  O.strict.apply(O, [3, 2, 1]);
})();


(function testRestParamsStrictModeCall() {
  strictTest.call(null);
  strictTest.call(null, 2, 1);
  strictTest.call(null, 6, 5, 4, 3, 2, 1);
  strictTest.call(null, 3, 2, 1);
  O.strict.call(O);
  O.strict.call(O, 2, 1);
  O.strict.call(O, 6, 5, 4, 3, 2, 1);
  O.strict.call(O, 3, 2, 1);
})();


(function testsloppyRestParamArity() {
  arktest.assertEQ(2, sloppyTest.length);
  arktest.assertEQ(2, O.sloppy.length);
})();


(function testRestParamssloppyMode() {
  sloppyTest();
  sloppyTest(2, 1);
  sloppyTest(6, 5, 4, 3, 2, 1);
  sloppyTest(3, 2, 1);
  O.sloppy();
  O.sloppy(2, 1);
  O.sloppy(6, 5, 4, 3, 2, 1);
  O.sloppy(3, 2, 1);
})();


(function testRestParamssloppyModeApply() {
  sloppyTest.apply(null, []);
  sloppyTest.apply(null, [2, 1]);
  sloppyTest.apply(null, [6, 5, 4, 3, 2, 1]);
  sloppyTest.apply(null, [3, 2, 1]);
  O.sloppy.apply(O, []);
  O.sloppy.apply(O, [2, 1]);
  O.sloppy.apply(O, [6, 5, 4, 3, 2, 1]);
  O.sloppy.apply(O, [3, 2, 1]);
})();


(function testRestParamssloppyModeCall() {
  sloppyTest.call(null);
  sloppyTest.call(null, 2, 1);
  sloppyTest.call(null, 6, 5, 4, 3, 2, 1);
  sloppyTest.call(null, 3, 2, 1);
  O.sloppy.call(O);
  O.sloppy.call(O, 2, 1);
  O.sloppy.call(O, 6, 5, 4, 3, 2, 1);
  O.sloppy.call(O, 3, 2, 1);
})();


(function testUnmappedArguments() {
  // Normal functions make their arguments object unmapped, but arrow
  // functions don't have an arguments object anyway.  Check that the
  // right thing happens for arguments in arrow functions with rest
  // parameters.
  arktest.assertEQ(arguments, ((...rest) => arguments)());
})();
