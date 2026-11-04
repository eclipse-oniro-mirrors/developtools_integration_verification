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
  arktest.assertEQ(5, (function(...args) { return args.length; })(1,2,3,4,5));
  arktest.assertEQ(4, (function(a, ...args) { return args.length; })(1,2,3,4,5));
  arktest.assertEQ(3, (function(a, b, ...args) { return args.length; })(1,2,3,4,5));
  arktest.assertEQ(2, (function(a, b, c, ...args) {
                      return args.length;
                    })(1, 2, 3, 4, 5));
  arktest.assertEQ(1, (function(a, b, c, d, ...args) {
                      return args.length;
                    })(1, 2, 3, 4, 5));
  arktest.assertEQ(0, (function(a, b, c, d, e, ...args) {
                    return args.length;
                  })(1, 2, 3, 4, 5));
})();


const strictTest = (function() {
  'use strict';
  return function strictTest(a, b, ...c) {
    arktest.assertEQ(Array, c.constructor);
    arktest.assertTrue(Array.isArray(c));

    let expectedLength = arguments.length >= 3 ? arguments.length - 2 : 0;
    arktest.assertEQ(expectedLength, c.length);

    for (let i = 2, j = 0; i < arguments.length; ++i) {
      arktest.assertEQ(c[j++], arguments[i]);
    }
  };
})();


function sloppyTest(a, b, ...c) {
  arktest.assertEQ(Array, c.constructor);
  arktest.assertTrue(Array.isArray(c));

  let expectedLength = arguments.length >= 3 ? arguments.length - 2 : 0;
  arktest.assertEQ(expectedLength, c.length);

  for (let i = 2, j = 0; i < arguments.length; ++i) {
    arktest.assertEQ(c[j++], arguments[i]);
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
  strictTest(1, 2);
  strictTest(1, 2, 3, 4, 5, 6);
  strictTest(1, 2, 3);
  O.strict();
  O.strict(1, 2);
  O.strict(1, 2, 3, 4, 5, 6);
  O.strict(1, 2, 3);
})();


(function testRestParamsStrictModeApply() {
  strictTest.apply(null, []);
  strictTest.apply(null, [1, 2]);
  strictTest.apply(null, [1, 2, 3, 4, 5, 6]);
  strictTest.apply(null, [1, 2, 3]);
  O.strict.apply(O, []);
  O.strict.apply(O, [1, 2]);
  O.strict.apply(O, [1, 2, 3, 4, 5, 6]);
  O.strict.apply(O, [1, 2, 3]);
})();


(function testRestParamsStrictModeCall() {
  strictTest.call(null);
  strictTest.call(null, 1, 2);
  strictTest.call(null, 1, 2, 3, 4, 5, 6);
  strictTest.call(null, 1, 2, 3);
  O.strict.call(O);
  O.strict.call(O, 1, 2);
  O.strict.call(O, 1, 2, 3, 4, 5, 6);
  O.strict.call(O, 1, 2, 3);
})();


(function testsloppyRestParamArity() {
  arktest.assertEQ(2, sloppyTest.length);
  arktest.assertEQ(2, O.sloppy.length);
})();


(function testRestParamssloppyMode() {
  sloppyTest();
  sloppyTest(1, 2);
  sloppyTest(1, 2, 3, 4, 5, 6);
  sloppyTest(1, 2, 3);
  O.sloppy();
  O.sloppy(1, 2);
  O.sloppy(1, 2, 3, 4, 5, 6);
  O.sloppy(1, 2, 3);
})();


(function testRestParamssloppyModeApply() {
  sloppyTest.apply(null, []);
  sloppyTest.apply(null, [1, 2]);
  sloppyTest.apply(null, [1, 2, 3, 4, 5, 6]);
  sloppyTest.apply(null, [1, 2, 3]);
  O.sloppy.apply(O, []);
  O.sloppy.apply(O, [1, 2]);
  O.sloppy.apply(O, [1, 2, 3, 4, 5, 6]);
  O.sloppy.apply(O, [1, 2, 3]);
})();


(function testRestParamssloppyModeCall() {
  sloppyTest.call(null);
  sloppyTest.call(null, 1, 2);
  sloppyTest.call(null, 1, 2, 3, 4, 5, 6);
  sloppyTest.call(null, 1, 2, 3);
  O.sloppy.call(O);
  O.sloppy.call(O, 1, 2);
  O.sloppy.call(O, 1, 2, 3, 4, 5, 6);
  O.sloppy.call(O, 1, 2, 3);
})();


(function testUnmappedArguments() {
  // Strict/Unmapped arguments should always be used for functions with rest
  // parameters
  arktest.expectThrow(function(...rest) { return arguments.callee; }, ((e: Error): boolean => e instanceof TypeError));
  // TODO(caitp): figure out why this doesn't throw sometimes, even though the
})();


(function testNoAliasArgumentsStrict() {
  ((function() {
    'use strict';
    return (function strictF(a, ...rest) {
              arguments[0] = 1;
              arktest.assertEQ(3, a);
              arguments[1] = 2;
              arktest.assertEQ([4, 5], rest);
            });
  })())(3, 4, 5);
})();


(function testNoAliasArgumentsSloppy() {
  function sloppyF(a, ...rest) {
    arguments[0] = 1;
    arktest.assertEQ(3, a);
    arguments[1] = 2;
    arktest.assertEQ([4, 5], rest);
  }
  sloppyF(3, 4, 5);
})();


(function testRestParamsWithNewTarget() {
  'use strict';
  class Base {
    constructor(...a) {
      this.base = a;
      arktest.assertEQ(arguments.length, a.length);
      let args = [];
      for (let i = 0; i < arguments.length; ++i) {
        args.push(arguments[i]);
      }
      arktest.assertEQ(args, a);
    }
  }
  class Child extends Base {
    constructor(...b) {
      super(1, 2, 3);
      this.child = b;
      arktest.assertEQ(arguments.length, b.length);
      let args = [];
      for (let i = 0; i < arguments.length; ++i) {
        args.push(arguments[i]);
      }
      arktest.assertEQ(args, b);
    }
  }

  let c = new Child(1, 2, 3);
  arktest.assertEQ([1, 2, 3], c.child);
  arktest.assertEQ([1, 2, 3], c.base);
})();

(function TestDirectiveThrows() {
  'use strict';

  arktest.expectThrow(
    function(){ eval('function(...rest){\'use strict\';}') }, SyntaxError);
  arktest.expectThrow(function(){ eval('(...rest) => {\'use strict\';}') }, ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow(
    function(){ eval('(class{foo(...rest) {\'use strict\';}});') }, SyntaxError);

  arktest.expectThrow(
    function(){ eval('function(a, ...rest){\'use strict\';}') }, SyntaxError);
  arktest.expectThrow(
    function(){ eval('(a, ...rest) => {\'use strict\';}') }, SyntaxError);
  arktest.expectThrow(
    function(){ eval('(class{foo(a, ...rest) {\'use strict\';}});') },
    SyntaxError);
})();

(function TestRestArrayPattern() {
  function f(...[a, b, c]) { return a + b + c; }
  arktest.assertEQ(6, f(1, 2, 3));
  arktest.assertEQ('123', f(1, '2', 3));
  arktest.assertEQ(NaN, f(1));

  let f2 = (...[a, b, c]) => a + b + c;
  arktest.assertEQ(6, f2(1, 2, 3));
  arktest.assertEQ('123', f2(1, '2', 3));
  arktest.assertEQ(NaN, f2(1));
})();

(function TestRestObjectPattern() {
  function f(...{length, 0: firstName, 1: lastName}) {
    return `Hello ${lastName}, ${firstName}! Called with ${length} args!`;
  }
  arktest.assertEQ('Hello Ross, Bob! Called with 4 args!', f('Bob', 'Ross', 0, 0));

  let f2 = (...{length, 0: firstName, 1: lastName}) =>
      `Hello ${lastName}, ${firstName}! Called with ${length} args!`;
  arktest.assertEQ('Hello Ross, Bob! Called with 4 args!', f2('Bob', 'Ross', 0, 0));
})();
