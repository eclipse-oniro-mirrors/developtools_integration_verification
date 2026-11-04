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

(function testReflectApplyArity() {
  arktest.assertEQ(3, Reflect.apply.length);
})();


(function testReflectApplyNonConstructor() {
  arktest.expectThrow(function() {
    new Reflect.apply(function(){}, null, []);
  }, ((e: Error): boolean => e instanceof TypeError));
})();


(function testAppliedReceiverSloppy() {
  function returnThis() { return this; }
  let receiver = {};

  arktest.assertEQ(this, Reflect.apply(returnThis, void 0, []));
  // Openharmony only support strict mode. this is undefined, not equals null.
  arktest.assertEQ(this, Reflect.apply(returnThis, this, []));
  arktest.assertEQ(receiver, Reflect.apply(returnThis, receiver, []));

  // Wrap JS values
  arktest.assertEQ(String.prototype,
             Object.getPrototypeOf(Reflect.apply(returnThis, 'str', [])));
  arktest.assertEQ(Number.prototype,
             Object.getPrototypeOf(Reflect.apply(returnThis, 123, [])));
  arktest.assertEQ(Boolean.prototype,
             Object.getPrototypeOf(Reflect.apply(returnThis, true, [])));
  arktest.assertEQ(Symbol.prototype,
             Object.getPrototypeOf(
                Reflect.apply(returnThis, Symbol('test'), [])));
})();


(function testAppliedReceiverStrict() {
  function returnThis() { 'use strict'; return this; }
  let receiver = {};

  arktest.assertEQ(void 0, Reflect.apply(returnThis, void 0, []));
  arktest.assertEQ(this, Reflect.apply(returnThis, this, []));
  arktest.assertEQ(receiver, Reflect.apply(returnThis, receiver, []));

  // Don't wrap value types
  const regexp = /123/;
  const symbol = Symbol('test');
  arktest.assertEQ('str', Reflect.apply(returnThis, 'str', []));
  arktest.assertEQ(123, Reflect.apply(returnThis, 123, []));
  arktest.assertEQ(true, Reflect.apply(returnThis, true, []));
  arktest.assertEQ(regexp, Reflect.apply(returnThis, regexp, []));
  arktest.assertEQ(symbol, Reflect.apply(returnThis, symbol, []));
})();


(function testAppliedArgumentsLength() {
  function returnLengthStrict() { 'use strict'; return arguments.length; }
  function returnLengthSloppy() { return arguments.length; }

  arktest.assertEQ(0, Reflect.apply(returnLengthStrict, this, []));
  arktest.assertEQ(0, Reflect.apply(returnLengthSloppy, this, []));
  arktest.assertEQ(0, Reflect.apply(returnLengthStrict, this, {}));
  arktest.assertEQ(0, Reflect.apply(returnLengthSloppy, this, {}));

  for (let i = 0; i < 256; ++i) {
    arktest.assertEQ(i, Reflect.apply(returnLengthStrict, this, new Array(i)));
    arktest.assertEQ(i, Reflect.apply(returnLengthSloppy, this, new Array(i)));
    arktest.assertEQ(i, Reflect.apply(returnLengthStrict, this, { length: i }));
    arktest.assertEQ(i, Reflect.apply(returnLengthSloppy, this, { length: i }));
  }
})();


(function testAppliedArgumentsLengthThrows() {
  function noopStrict() { 'use strict'; }
  function noopSloppy() { }
  function MyError() {}

  let argsList = {};
  Object.defineProperty(argsList, 'length', {
    get: function() { throw new MyError(); }
  });

  arktest.expectThrow(function() {
    Reflect.apply(noopStrict, this, argsList);
  }, MyError);

  arktest.expectThrow(function() {
    Reflect.apply(noopSloppy, this, argsList);
  }, MyError);
})();


(function testAppliedArgumentsElementThrows() {
  function noopStrict() { 'use strict'; }
  function noopSloppy() { }
  function MyError() {}

  let argsList = { length: 1 };
  Object.defineProperty(argsList, '0', {
    get: function() { throw new MyError(); }
  });

  arktest.expectThrow(function() {
    Reflect.apply(noopStrict, this, argsList);
  }, MyError);

  arktest.expectThrow(function() {
    Reflect.apply(noopSloppy, this, argsList);
  }, MyError);
})();


(function testAppliedNonFunctionStrict() {
  'use strict';
  arktest.expectThrow(function() { Reflect.apply(void 0); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.apply(null); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.apply(123); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.apply('str'); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.apply(Symbol('x')); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.apply(/123/); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.apply(NaN); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.apply({}); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.apply([]); }, ((e: Error): boolean => e instanceof TypeError));
})();


(function testAppliedNonFunctionSloppy() {
  arktest.expectThrow(function() { Reflect.apply(void 0); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.apply(null); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.apply(123); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.apply('str'); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.apply(Symbol('x')); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.apply(/123/); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.apply(NaN); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.apply({}); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.apply([]); }, ((e: Error): boolean => e instanceof TypeError));
})();


(function testAppliedArgumentsNonList() {
  function noopStrict() { 'use strict'; }
  function noopSloppy() {}
  const R = void 0;
  arktest.expectThrow(
    function() { Reflect.apply(noopStrict, R, null); },
    ((e: Error): boolean => e instanceof TypeError)
  );
  arktest.expectThrow(
    function() { Reflect.apply(noopSloppy, R, null); },
    ((e: Error): boolean => e instanceof TypeError)
  );
  arktest.expectThrow(function() { Reflect.apply(noopStrict, R, 1); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.apply(noopSloppy, R, 1); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(
    function() { Reflect.apply(noopStrict, R, 'BAD'); },
    ((e: Error): boolean => e instanceof TypeError)
  );
  arktest.expectThrow(
    function() { Reflect.apply(noopSloppy, R, 'BAD'); },
    ((e: Error): boolean => e instanceof TypeError)
  );
  arktest.expectThrow(
    function() { Reflect.apply(noopStrict, R, true); },
    ((e: Error): boolean => e instanceof TypeError)
  );
  arktest.expectThrow(
    function() { Reflect.apply(noopSloppy, R, true); },
    ((e: Error): boolean => e instanceof TypeError)
  );
  const sym = Symbol('x');
  arktest.expectThrow(
    function() { Reflect.apply(noopStrict, R, sym); },
    ((e: Error): boolean => e instanceof TypeError)
  );
  arktest.expectThrow(
    function() { Reflect.apply(noopSloppy, R, sym); },
    ((e: Error): boolean => e instanceof TypeError)
  );
})();


(function testAppliedArgumentValue() {
  function returnFirstStrict(a) { 'use strict'; return a; }
  function returnFirstSloppy(a) { return a; }
  function returnLastStrict(a) { 'use strict'; return arguments[arguments.length - 1]; }
  function returnLastSloppy(a) { return arguments[arguments.length - 1]; }
  function returnSumStrict() {
    'use strict';
    let sum = arguments[0];
    for (let i = 1; i < arguments.length; ++i) {
      sum += arguments[i];
    }
    return sum;
  }
  function returnSumSloppy() {
    let sum = arguments[0];
    for (let i = 1; i < arguments.length; ++i) {
      sum += arguments[i];
    }
    return sum;
  }

  arktest.assertEQ('OK!', Reflect.apply(returnFirstStrict, this, ['OK!']));
  arktest.assertEQ('OK!', Reflect.apply(returnFirstSloppy, this, ['OK!']));
  arktest.assertEQ('OK!', Reflect.apply(returnFirstStrict, this,
                                    { 0: 'OK!', length: 1 }));
  arktest.assertEQ('OK!', Reflect.apply(returnFirstSloppy, this,
                                    { 0: 'OK!', length: 1 }));
  arktest.assertEQ('OK!', Reflect.apply(returnLastStrict, this,
                                    [0, 1, 2, 3, 4, 5, 6, 7, 8, 'OK!']));
  arktest.assertEQ('OK!', Reflect.apply(returnLastSloppy, this,
                                    [0, 1, 2, 3, 4, 5, 6, 7, 8, 'OK!']));
  arktest.assertEQ('OK!', Reflect.apply(returnLastStrict, this,
                                    { 9: 'OK!', length: 10 }));
  arktest.assertEQ('OK!', Reflect.apply(returnLastSloppy, this,
                                    { 9: 'OK!', length: 10 }));
  arktest.assertEQ('TEST', Reflect.apply(returnSumStrict, this,
                                     ['T', 'E', 'S', 'T']));
  arktest.assertEQ('TEST!!', Reflect.apply(returnSumStrict, this,
                                       ['T', 'E', 'S', 'T', '!', '!']));
  arktest.assertEQ(10, Reflect.apply(returnSumStrict, this,
                                 { 0: 1, 1: 2, 2: 3, 3: 4, length: 4 }));
  arktest.assertEQ('TEST', Reflect.apply(returnSumSloppy, this,
                                     ['T', 'E', 'S', 'T']));
  arktest.assertEQ('TEST!!', Reflect.apply(returnSumSloppy, this,
                                       ['T', 'E', 'S', 'T', '!', '!']));
  arktest.assertEQ(10, Reflect.apply(returnSumSloppy, this,
                                 { 0: 1, 1: 2, 2: 3, 3: 4, length: 4 }));
})();
