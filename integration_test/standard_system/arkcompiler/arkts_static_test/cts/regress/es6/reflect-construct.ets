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

(function testReflectConstructArity() {
  arktest.assertEQ(2, Reflect.construct.length);
})();


(function testReflectConstructNonConstructor() {
  arktest.expectThrow(function() {
    new Reflect.construct(function(){}, []);
  }, ((e: Error): boolean => e instanceof TypeError));
})();


(function testReflectConstructArg1NonConstructor() {
  try {
    Reflect.construct(() => {}, []);
  } catch (e) {
    arktest.assertTrue(e instanceof TypeError);
    // Openharmony throw message is `Reflect.construct target is not constructor`.
    // `() => {} is not a constructor` => `Reflect.construct target is not constructor`
    arktest.assertEQ('Reflect.construct target is not constructor', e.message);
    return;
  }
  arktest.assertTrue(false, 'Exception expected');
})();


(function testReflectConstructArg3NonConstructor() {
  try {
    Reflect.construct(function() {}, [], () => {});
  } catch (e) {
    arktest.assertTrue(e instanceof TypeError);
    // Openharmony throw message is `Reflect.construct newTarget is present, but not constructor`.
    // `() => {} is not a constructor` => `Reflect.construct newTarget is present, but not constructor`
    arktest.assertEQ('Reflect.construct newTarget is present, but not constructor', e.message);
    return;
  }
  arktest.assertTrue(false, 'Exception expected');
})();


(function testReflectConstructBasic() {
  function constructor() { 'use strict'; }
  arktest.assertTrue(Reflect.construct(constructor, []) instanceof constructor);
})();


(function testReflectConstructBasicSloppy() {
  function constructor() {}
  arktest.assertTrue(Reflect.construct(constructor, []) instanceof constructor);
})();


(function testReflectConstructReturnSomethingElseStrict() {
  let R = {};
  function constructor() { 'use strict'; return R; }
  arktest.assertEQ(R, Reflect.construct(constructor, []));
})();


(function testReflectConstructReturnSomethingElseSloppy() {
  let R = {};
  function constructor() { return R; }
  arktest.assertEQ(R, Reflect.construct(constructor, []));
})();


(function testReflectConstructNewTargetStrict() {
  'use strict';
  function constructor() { this[9] = 1; }
  let O = Reflect.construct(constructor, [], Array);
  arktest.assertEQ(1, O[9]);
  // Ordinary object with Array.prototype --- no exotic Array magic
  arktest.assertFalse(Array.isArray(O));
  arktest.assertEQ(0, O.length);
  arktest.assertEQ(Array.prototype, Object.getPrototypeOf(O));
})();


(function testReflectConstructNewTargetSloppy() {
  function constructor() { this[9] = 1; }
  let O = Reflect.construct(constructor, [], Array);
  arktest.assertEQ(1, O[9]);
  // Ordinary object with Array.prototype --- no exotic Array magic
  arktest.assertFalse(Array.isArray(O));
  arktest.assertEQ(0, O.length);
  arktest.assertEQ(Array.prototype, Object.getPrototypeOf(O));
})();


(function testReflectConstructNewTargetStrict2() {
  'use strict';
  function constructor() { this[9] = 1; }
  constructor.prototype.add = function(x) {
    this[this.length] = x; return this;
  }
  let O = Reflect.construct(Array, [1, 2, 3], constructor);
  // Exotic Array object with Constructor.prototype
  arktest.assertTrue(Array.isArray(O));
  arktest.assertEQ(constructor.prototype, Object.getPrototypeOf(O));
  arktest.assertFalse(O instanceof Array);
  arktest.assertEQ(3, O.length);
  arktest.assertEQ(undefined, O[9]);
  arktest.assertEQ(O, O.add(4));
  arktest.assertEQ(4, O.length);
  arktest.assertEQ(4, O[3]);
})();


(function testReflectConstructNewTargetSloppy2() {
  function constructor() { this[9] = 1; }
  constructor.prototype.add = function(x) {
    this[this.length] = x; return this;
  }
  let O = Reflect.construct(Array, [1, 2, 3], constructor);
  // Exotic Array object with Constructor.prototype
  arktest.assertTrue(Array.isArray(O));
  arktest.assertEQ(constructor.prototype, Object.getPrototypeOf(O));
  arktest.assertFalse(O instanceof Array);
  arktest.assertEQ(3, O.length);
  arktest.assertEQ(undefined, O[9]);
  arktest.assertEQ(O, O.add(4));
  arktest.assertEQ(4, O.length);
  arktest.assertEQ(4, O[3]);
})();


(function testReflectConstructNewTargetStrict3() {
  'use strict';
  function a() {}
  function b() {}
  let O = Reflect.construct(a, [], b);
  // TODO(caitp): bug: newTarget prototype is not used if it is not
  // explicitly set.
})();


(function testReflectConstructNewTargetSloppy3() {
  function a() {}
  function b() {}
  let O = Reflect.construct(a, [], b);
  // TODO(caitp): bug: newTarget prototype is not used if it is not
  // explicitly set.
})();


(function testAppliedArgumentsLength() {
  function lengthStrict() { 'use strict'; this.a = arguments.length; }
  function lengthSloppy() { this.a = arguments.length; }

  arktest.assertEQ(0, Reflect.construct(lengthStrict, []).a);
  arktest.assertEQ(0, Reflect.construct(lengthSloppy, []).a);
  arktest.assertEQ(0, Reflect.construct(lengthStrict, {}).a);
  arktest.assertEQ(0, Reflect.construct(lengthSloppy, {}).a);

  for (let i = 0; i < 256; ++i) {
    arktest.assertEQ(i, Reflect.construct(lengthStrict, new Array(i)).a);
    arktest.assertEQ(i, Reflect.construct(lengthSloppy, new Array(i)).a);
    arktest.assertEQ(i, Reflect.construct(lengthStrict, { length: i }).a);
    arktest.assertEQ(i, Reflect.construct(lengthSloppy, { length: i }).a);
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
    Reflect.construct(noopStrict, argsList);
  }, MyError);

  arktest.expectThrow(function() {
    Reflect.construct(noopSloppy, argsList);
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
    Reflect.construct(noopStrict, argsList);
  }, MyError);

  arktest.expectThrow(function() {
    Reflect.construct(noopSloppy, argsList);
  }, MyError);
})();


(function testAppliedNonFunctionStrict() {
  'use strict';
  arktest.expectThrow(function() { Reflect.construct(void 0, []); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.construct(null, []); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.construct(123, []); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.construct('str', []); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(
    function() { Reflect.construct(Symbol('x'), []); },
    ((e: Error): boolean => e instanceof TypeError)
  );
  arktest.expectThrow(function() { Reflect.construct(/123/, []); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.construct(NaN, []); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.construct({}, []); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.construct([], []); }, ((e: Error): boolean => e instanceof TypeError));
})();


(function testAppliedNonFunctionSloppy() {
  arktest.expectThrow(function() { Reflect.construct(void 0, []); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.construct(null, []); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.construct(123, []); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.construct('str', []); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(
    function() { Reflect.construct(Symbol('x'), []); },
    ((e: Error): boolean => e instanceof TypeError)
  );
  arktest.expectThrow(function() { Reflect.construct(/123/, []); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.construct(NaN, []); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.construct({}, []); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.construct([], []); }, ((e: Error): boolean => e instanceof TypeError));
})();


(function testAppliedArgumentsNonList() {
  function noopStrict() { 'use strict'; }
  function noopSloppy() {}
  arktest.expectThrow(
    function() { Reflect.construct(noopStrict, null); },
    ((e: Error): boolean => e instanceof TypeError)
  );
  arktest.expectThrow(
    function() { Reflect.construct(noopSloppy, null); },
    ((e: Error): boolean => e instanceof TypeError)
  );
  arktest.expectThrow(
    function() { Reflect.construct(noopStrict, 1); },
    ((e: Error): boolean => e instanceof TypeError)
  );
  arktest.expectThrow(
    function() { Reflect.construct(noopSloppy, 1); },
    ((e: Error): boolean => e instanceof TypeError)
  );
  arktest.expectThrow(
    function() { Reflect.construct(noopStrict, 'BAD'); },
    ((e: Error): boolean => e instanceof TypeError)
  );
  arktest.expectThrow(
    function() { Reflect.construct(noopSloppy, 'BAD'); },
    ((e: Error): boolean => e instanceof TypeError)
  );
  arktest.expectThrow(
    function() { Reflect.construct(noopStrict, true); },
    ((e: Error): boolean => e instanceof TypeError)
  );
  arktest.expectThrow(
    function() { Reflect.construct(noopSloppy, true); },
    ((e: Error): boolean => e instanceof TypeError)
  );
  const sym = Symbol('x');
  arktest.expectThrow(
    function() { Reflect.construct(noopStrict, sym); },
    ((e: Error): boolean => e instanceof TypeError)
  );
  arktest.expectThrow(
    function() { Reflect.construct(noopSloppy, sym); },
    ((e: Error): boolean => e instanceof TypeError)
  );
})();


(function testAppliedArgumentValue() {
  function firstStrict(a) { 'use strict'; this.a = a; }
  function firstSloppy(a) { this.a = a; }
  function lastStrict(a) { 'use strict'; this.a = arguments[arguments.length - 1]; }
  function lastSloppy(a) { this.a = arguments[arguments.length - 1]; }
  function sumStrict() {
    'use strict';
    let sum = arguments[0];
    for (let i = 1; i < arguments.length; ++i) {
      sum += arguments[i];
    }
    this.a = sum;
  }
  function sumSloppy() {
    let sum = arguments[0];
    for (let i = 1; i < arguments.length; ++i) {
      sum += arguments[i];
    }
    this.a = sum;
  }

  arktest.assertEQ('OK!', Reflect.construct(firstStrict, ['OK!']).a);
  arktest.assertEQ('OK!', Reflect.construct(firstSloppy, ['OK!']).a);
  arktest.assertEQ('OK!', Reflect.construct(firstStrict,
                                        { 0: 'OK!', length: 1 }).a);
  arktest.assertEQ('OK!', Reflect.construct(firstSloppy,
                                        { 0: 'OK!', length: 1 }).a);
  arktest.assertEQ('OK!', Reflect.construct(lastStrict,
                                        [0, 1, 2, 3, 4, 5, 6, 7, 8, 'OK!']).a);
  arktest.assertEQ('OK!', Reflect.construct(lastSloppy,
                                        [0, 1, 2, 3, 4, 5, 6, 7, 8, 'OK!']).a);
  arktest.assertEQ('OK!', Reflect.construct(lastStrict,
                                        { 9: 'OK!', length: 10 }).a);
  arktest.assertEQ('OK!', Reflect.construct(lastSloppy,
                                        { 9: 'OK!', length: 10 }).a);
  arktest.assertEQ('TEST', Reflect.construct(sumStrict,
                                         ['T', 'E', 'S', 'T']).a);
  arktest.assertEQ('TEST!!', Reflect.construct(sumStrict,
                                           ['T', 'E', 'S', 'T', '!', '!']).a);
  arktest.assertEQ(10, Reflect.construct(sumStrict,
                                     { 0: 1, 1: 2, 2: 3, 3: 4, length: 4 }).a);
  arktest.assertEQ('TEST', Reflect.construct(sumSloppy,
                                         ['T', 'E', 'S', 'T']).a);
  arktest.assertEQ('TEST!!', Reflect.construct(sumSloppy,
                                           ['T', 'E', 'S', 'T', '!', '!']).a);
  arktest.assertEQ(10, Reflect.construct(sumSloppy,
                                     { 0: 1, 1: 2, 2: 3, 3: 4, length: 4 }).a);
})();

(function() {
  function* f() { yield 1; yield 2; }
  function* g() { yield 3; yield 4; }
  arktest.expectThrow(()=>Reflect.construct(f, [], g));
})();

// Openharmony not support eval, Comment out the following testcases.
// (function () {

//     ["AggregateError", [[]]],
//       "Array",
//       "ArrayBuffer",
//       "Boolean",
//       ["DataView", [new ArrayBuffer()]],
//       "Date",
//       "Error",
//       "EvalError",
//       "Float32Array",
//       "Float64Array",
//       ["Function", ["return 153;"]],
//       ["Function", ["'use strict'; return 153;"]],
//       ["((function*(){}).constructor)", ["yield 153;"]],  // GeneratorFunction
//       ["((function*(){}).constructor)", ["'use strict'; yield 153;"]],
//       // AsyncGeneratorFunction
//       ["((async function*(){}).constructor)", ["return 153;"]],
//       "Int8Array",
//       "Int16Array",
//       "Int32Array",
//       "Map",
//       "Number",
//       "Object",
//       ["Promise", [(resolve, reject)=>{}]],
//       "RangeError",
//       "ReferenceError",
//       "RegExp",
//       "Set",
//       "String",
//       "SyntaxError",
//       // ArkTools.typedArray%?
//       "TypeError",
//       "Uint8Array",
//       "Uint8ClampedArray",
//       "Uint16Array",
//       "Uint32Array",
//       "URIError",
//       "WeakMap",
//       "WeakSet"
//   ];

//   }

//   }
