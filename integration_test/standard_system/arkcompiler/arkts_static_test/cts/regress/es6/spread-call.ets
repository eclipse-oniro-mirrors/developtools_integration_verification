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
expected_out_1: "Syntax error ESY0135: Nested functions are not allowed."
---*/

function testSpreadCallsStrict() {
  'use strict'
  function countArgs() { return arguments.length; }

  // Test this argument
  function returnThis() { return this; }
  arktest.assertEQ(void 0, returnThis(...'test'));

  // Test argument counting with different iterables
  arktest.assertEQ(0, countArgs(...''));
  arktest.assertEQ(4, countArgs(...'test'));
  arktest.assertEQ(4, countArgs(...'tes', ...'t'));
  arktest.assertEQ(4, countArgs('t', ...'es', 't'));
  arktest.assertEQ(4, countArgs('tes', ...'t!!'));

  arktest.assertEQ(1, countArgs(...[1]));
  arktest.assertEQ(2, countArgs(...[1, 2]));
  arktest.assertEQ(3, countArgs(...[1, 2, 3]));
  arktest.assertEQ(4, countArgs(...[1, 2, 3, 4]));
  arktest.assertEQ(5, countArgs(...[1, 2, 3, 4, 5]));
  arktest.assertEQ(6, countArgs(...[1, 2, 3, 4, 5, 6]));

  arktest.assertEQ(1, countArgs(...[1.1]));
  arktest.assertEQ(2, countArgs(...[1.1, 2.2]));
  arktest.assertEQ(3, countArgs(...[1.1, 2.2, 3.3]));
  arktest.assertEQ(4, countArgs(...[1.1, 2.2, 3.3, 4.4]));
  arktest.assertEQ(5, countArgs(...[1.1, 2.2, 3.3, 4.4, 5.5]));
  arktest.assertEQ(6, countArgs(...[1.1, 2.2, 3.3, 4.4, 5.5, 6.6]));

  arktest.assertEQ(1, countArgs(...new Set([1])));
  arktest.assertEQ(2, countArgs(...new Set([1, 2])));
  arktest.assertEQ(3, countArgs(...new Set([1, 2, 3])));
  arktest.assertEQ(4, countArgs(...new Set([1, 2, 3, 4])));
  arktest.assertEQ(5, countArgs(...new Set([1, 2, 3, 4, 5])));
  arktest.assertEQ(6, countArgs(...new Set([1, 2, 3, 4, 5, 6])));

  arktest.assertEQ(3, countArgs(...(function*(){ yield 1; yield 2; yield 3; })()));

  // Test values
  function sum() {
    let sum = arguments[0];
    for (let i = 1; i < arguments.length; ++i) {
      sum += arguments[i];
    }
    return sum;
  }

  arktest.expectThrow(function() {
    sum(...0);
  }, ((e: Error): boolean => e instanceof TypeError));
  arktest.assertEQ(void 0, sum(...''));
  arktest.assertEQ(void 0, sum(...[]));
  arktest.assertEQ(void 0, sum(...new Set));
  arktest.assertEQ(void 0, sum(...(function*() { })()));

  arktest.assertEQ('test', sum(...'test'));
  arktest.assertEQ(10, sum(...[1, 2, 3, 4]));
  arktest.assertEQ(10, sum(...[1, 2, 3], 4));
  arktest.assertEQ(10, sum(1, ...[2, 3], 4));
  arktest.assertEQ(10, sum(1, ...[2, 3], ...[4]));
  arktest.assertEQ(10, sum(1, 2, ...[3, 4]));
  arktest.assertEQ(10, sum(...new Set([1, 2, 3, 4])));
  arktest.assertEQ(10, sum(...(function*() {
    yield 1;
    yield 2;
    yield 3;
    yield 4;
  })()));

  // nested spreads
  function makeArray() {
    let result = [];
    for (let i = 0; i < arguments.length; ++i) {
      result.push(arguments[i]);
    }
    return result;
  }
  arktest.assertEQ(10, sum(...makeArray(...[1, 2, 3, 4])));
  arktest.assertEQ('test!!!', sum(...makeArray(...'test!!!')));

  // Interleaved spread/unspread args
  arktest.assertEQ(36, sum(0, ...[1], 2, 3, ...[4, 5], 6, 7, 8));
  arktest.assertEQ(45, sum(0, ...[1], 2, 3, ...[4, 5], 6, 7, 8, ...[9]));

  // Methods
  let O = {
    returnThis: returnThis,
    countArgs: countArgs,
    sum: sum,
    makeArray: makeArray,

    nested: {
      returnThis: returnThis,
      countArgs: countArgs,
      sum: sum,
      makeArray: makeArray
    }
  };

  // Test this argument
  arktest.assertEQ(O, O.returnThis(...'test'));
  arktest.assertEQ(O, O['returnThis'](...'test'));
  arktest.assertEQ(O.nested, O.nested.returnThis(...'test'));
  arktest.assertEQ(O.nested, O.nested['returnThis'](...'test'));

  // Test argument counting with different iterables
  arktest.assertEQ(0, O.countArgs(...''));
  arktest.assertEQ(4, O.countArgs(...'test'));
  arktest.assertEQ(4, O.countArgs(...'tes', ...'t'));
  arktest.assertEQ(4, O.countArgs('t', ...'es', 't'));
  arktest.assertEQ(4, O.countArgs('tes', ...'t!!'));

  arktest.assertEQ(1, O.countArgs(...[1]));
  arktest.assertEQ(2, O.countArgs(...[1, 2]));
  arktest.assertEQ(3, O.countArgs(...[1, 2, 3]));
  arktest.assertEQ(4, O.countArgs(...[1, 2, 3, 4]));
  arktest.assertEQ(5, O.countArgs(...[1, 2, 3, 4, 5]));
  arktest.assertEQ(6, O.countArgs(...[1, 2, 3, 4, 5, 6]));

  arktest.assertEQ(1, O.countArgs(...new Set([1])));
  arktest.assertEQ(2, O.countArgs(...new Set([1, 2])));
  arktest.assertEQ(3, O.countArgs(...new Set([1, 2, 3])));
  arktest.assertEQ(4, O.countArgs(...new Set([1, 2, 3, 4])));
  arktest.assertEQ(5, O.countArgs(...new Set([1, 2, 3, 4, 5])));
  arktest.assertEQ(6, O.countArgs(...new Set([1, 2, 3, 4, 5, 6])));

  arktest.assertEQ(3, O.countArgs(
      ...(function*(){ yield 1; yield 2; yield 3; })()));

  // Test values
  arktest.assertEQ(void 0, O.sum(...''));
  arktest.assertEQ(void 0, O.sum(...[]));
  arktest.assertEQ(void 0, O.sum(...new Set));
  arktest.assertEQ(void 0, O.sum(...(function*() { })()));

  arktest.assertEQ('test', O.sum(...'test'));
  arktest.assertEQ(10, O.sum(...[1, 2, 3, 4]));
  arktest.assertEQ(10, O.sum(...[1, 2, 3], 4));
  arktest.assertEQ(10, O.sum(1, ...[2, 3], 4));
  arktest.assertEQ(10, O.sum(1, ...[2, 3], ...[4]));
  arktest.assertEQ(10, O.sum(1, 2, ...[3, 4]));
  arktest.assertEQ(10, O.sum(...new Set([1, 2, 3, 4])));
  arktest.assertEQ(10, O.sum(...(function*() {
    yield 1;
    yield 2;
    yield 3;
    yield 4;
  })()));

  // nested spreads
  arktest.assertEQ(10, O.sum(...O.makeArray(...[1, 2, 3, 4])));
  arktest.assertEQ('test!!!', O.sum(...O.makeArray(...'test!!!')));

  // Interleaved spread/unspread args
  arktest.assertEQ(36, O.sum(0, ...[1], 2, 3, ...[4, 5], 6, 7, 8));
  arktest.assertEQ(45, O.sum(0, ...[1], 2, 3, ...[4, 5], 6, 7, 8, ...[9]));
};
ArkTools.prepareFunctionForOptimization(testSpreadCallsStrict);
testSpreadCallsStrict();
ArkTools.optimizeFunctionOnNextCall(testSpreadCallsStrict);
testSpreadCallsStrict();


(function testSpreadCallsSloppy() {
  // Test this argument
  function returnThis() { return this; }
  arktest.assertEQ(this, returnThis(...'test'));

  function countArgs() { return arguments.length; }

  // Test argument counting with different iterables
  arktest.assertEQ(0, countArgs(...''));
  arktest.assertEQ(4, countArgs(...'test'));
  arktest.assertEQ(4, countArgs(...'tes', ...'t'));
  arktest.assertEQ(4, countArgs('t', ...'es', 't'));
  arktest.assertEQ(4, countArgs('tes', ...'t!!'));

  arktest.assertEQ(1, countArgs(...[1]));
  arktest.assertEQ(2, countArgs(...[1, 2]));
  arktest.assertEQ(3, countArgs(...[1, 2, 3]));
  arktest.assertEQ(4, countArgs(...[1, 2, 3, 4]));
  arktest.assertEQ(5, countArgs(...[1, 2, 3, 4, 5]));
  arktest.assertEQ(6, countArgs(...[1, 2, 3, 4, 5, 6]));

  arktest.assertEQ(1, countArgs(...new Set([1])));
  arktest.assertEQ(2, countArgs(...new Set([1, 2])));
  arktest.assertEQ(3, countArgs(...new Set([1, 2, 3])));
  arktest.assertEQ(4, countArgs(...new Set([1, 2, 3, 4])));
  arktest.assertEQ(5, countArgs(...new Set([1, 2, 3, 4, 5])));
  arktest.assertEQ(6, countArgs(...new Set([1, 2, 3, 4, 5, 6])));

  arktest.assertEQ(3, countArgs(...(function*(){
    yield 1;
    yield 2;
    yield 3;
  })()));

  // Test values
  function sum() {
    let sum = arguments[0];
    for (let i = 1; i < arguments.length; ++i) {
      sum += arguments[i];
    }
    return sum;
  }

  arktest.expectThrow(function() {
    sum(...0);
  }, ((e: Error): boolean => e instanceof TypeError));
  arktest.assertEQ(void 0, sum(...''));
  arktest.assertEQ(void 0, sum(...[]));
  arktest.assertEQ(void 0, sum(...new Set));
  arktest.assertEQ(void 0, sum(...(function*() { })()));

  arktest.assertEQ('test', sum(...'test'));
  arktest.assertEQ(10, sum(...[1, 2, 3, 4]));
  arktest.assertEQ(10, sum(...[1, 2, 3], 4));
  arktest.assertEQ(10, sum(1, ...[2, 3], 4));
  arktest.assertEQ(10, sum(1, ...[2, 3], ...[4]));
  arktest.assertEQ(10, sum(1, 2, ...[3, 4]));
  arktest.assertEQ(10, sum(...new Set([1, 2, 3, 4])));
  arktest.assertEQ(10, sum(...(function*() {
    yield 1;
    yield 2;
    yield 3;
    yield 4;
  })()));

  // nested spreads
  function makeArray() {
    let result = [];
    for (let i = 0; i < arguments.length; ++i) {
      result.push(arguments[i]);
    }
    return result;
  }
  arktest.assertEQ(10, sum(...makeArray(...[1, 2, 3, 4])));
  arktest.assertEQ('test!!!', sum(...makeArray(...'test!!!')));

  // Interleaved spread/unspread args
  arktest.assertEQ(36, sum(0, ...[1], 2, 3, ...[4, 5], 6, 7, 8));
  arktest.assertEQ(45, sum(0, ...[1], 2, 3, ...[4, 5], 6, 7, 8, ...[9]));

  // Methods
  let O = {
    returnThis: returnThis,
    countArgs: countArgs,
    sum: sum,
    makeArray: makeArray,

    nested: {
      returnThis: returnThis,
      countArgs: countArgs,
      sum: sum,
      makeArray: makeArray
    }
  };

  // Test this argument
  arktest.assertEQ(O, O.returnThis(...'test'));
  arktest.assertEQ(O, O['returnThis'](...'test'));
  arktest.assertEQ(O.nested, O.nested.returnThis(...'test'));
  arktest.assertEQ(O.nested, O.nested['returnThis'](...'test'));

  // Test argument counting with different iterables
  arktest.assertEQ(0, O.countArgs(...''));
  arktest.assertEQ(4, O.countArgs(...'test'));
  arktest.assertEQ(4, O.countArgs(...'tes', ...'t'));
  arktest.assertEQ(4, O.countArgs('t', ...'es', 't'));
  arktest.assertEQ(4, O.countArgs('tes', ...'t!!'));

  arktest.assertEQ(1, O.countArgs(...[1]));
  arktest.assertEQ(2, O.countArgs(...[1, 2]));
  arktest.assertEQ(3, O.countArgs(...[1, 2, 3]));
  arktest.assertEQ(4, O.countArgs(...[1, 2, 3, 4]));
  arktest.assertEQ(5, O.countArgs(...[1, 2, 3, 4, 5]));
  arktest.assertEQ(6, O.countArgs(...[1, 2, 3, 4, 5, 6]));

  arktest.assertEQ(1, O.countArgs(...new Set([1])));
  arktest.assertEQ(2, O.countArgs(...new Set([1, 2])));
  arktest.assertEQ(3, O.countArgs(...new Set([1, 2, 3])));
  arktest.assertEQ(4, O.countArgs(...new Set([1, 2, 3, 4])));
  arktest.assertEQ(5, O.countArgs(...new Set([1, 2, 3, 4, 5])));
  arktest.assertEQ(6, O.countArgs(...new Set([1, 2, 3, 4, 5, 6])));

  arktest.assertEQ(3, O.countArgs(...(function*(){
    yield 1;
    yield 2;
    yield 3;
  })()));

  // Test values
  arktest.assertEQ(void 0, O.sum(...''));
  arktest.assertEQ(void 0, O.sum(...[]));
  arktest.assertEQ(void 0, O.sum(...new Set));
  arktest.assertEQ(void 0, O.sum(...(function*() { })()));

  arktest.assertEQ('test', O.sum(...'test'));
  arktest.assertEQ(10, O.sum(...[1, 2, 3, 4]));
  arktest.assertEQ(10, O.sum(...[1, 2, 3], 4));
  arktest.assertEQ(10, O.sum(1, ...[2, 3], 4));
  arktest.assertEQ(10, O.sum(1, ...[2, 3], ...[4]));
  arktest.assertEQ(10, O.sum(1, 2, ...[3, 4]));
  arktest.assertEQ(10, O.sum(...new Set([1, 2, 3, 4])));
  arktest.assertEQ(10, O.sum(...(function*() {
    yield 1;
    yield 2;
    yield 3;
    yield 4;
  })()));

  // nested spreads
  arktest.assertEQ(10, O.sum(...O.makeArray(...[1, 2, 3, 4])));
  arktest.assertEQ('test!!!', O.sum(...O.makeArray(...'test!!!')));

  // Interleaved spread/unspread args
  arktest.assertEQ(36, O.sum(0, ...[1], 2, 3, ...[4, 5], 6, 7, 8));
  arktest.assertEQ(45, O.sum(0, ...[1], 2, 3, ...[4, 5], 6, 7, 8, ...[9]));
})();


(function testSpreadEvaluationOrder() {
  'use strict';
  let log = '';
  function* gen() { log += 'X'; yield 0; log += 'Y'; }
  function a() { log += 'A'; }
  function b() { log += 'B'; return gen(); }
  function* c() { log += 'C1'; yield 1; log += 'C2'; }
  function d() { log += 'D'; }
  function e() { log += 'E'; }
  function fn() {
    const args = [];
    for (let i = 0; i < arguments.length; ++i) { args.push(arguments[i]); }
    return args;
  }

  let result = fn(a(), ...b(), d());
  arktest.assertEQ([undefined, 0, undefined], result);
  arktest.assertEQ('ABXYD', log);

  log = '';
  result = fn(...b(), d());
  arktest.assertEQ([0, undefined], result);
  arktest.assertEQ('BXYD', log);

  log = '';
  result = fn(a(), ...b());
  arktest.assertEQ([undefined, 0], result);
  arktest.assertEQ('ABXY', log);

  log = '';
  result = fn(a(), ...b(), ...c(), d(), e());
  arktest.assertEQ([undefined, 0, 1, undefined, undefined], result);
  arktest.assertEQ('ABXYC1C2DE', log);

  log = '';
  result = fn(a(), ...b(), ...c(), d(), e(), ...b(), ...c());
  arktest.assertEQ([undefined, 0, 1, undefined, undefined, 0, 1], result);
  arktest.assertEQ('ABXYC1C2DEBXYC1C2', log);
})();

(function testArrayPrototypeHoleGetterModifiesIteratorPrototypeNext() {
  function sum() {
    let sum = arguments[0];
    for (let i = 1; i < arguments.length; ++i) {
      sum += arguments[i];
    }
    return sum;
  }
  let a = [1, 2];
  a[3] = 4;
  let called = 0;

  // .next method is only accessed during iteration prologue (see
  // https://github.com/tc39/ecma262/pull/988)
  let arrayIteratorPrototype = Array.prototype[Symbol.iterator]().__proto__;
  let arrayIteratorPrototypeNextDescriptor =
      Object.getOwnPropertyDescriptor(arrayIteratorPrototype, 'next');
  Object.defineProperty(Array.prototype, 2, {
    get: function() {
      let ai = a[Symbol.iterator]();
      let originalNext = ai.__proto__['next'];
      Object.defineProperty(ai.__proto__, 'next', {
        get: function() {
          called++;
          return originalNext;
        },
        configurable: true
      });
      return 3;
    },
    configurable: true
  });

  arktest.assertEQ(10, sum(...a));
  arktest.assertEQ(0, called);

  Object.defineProperty(arrayIteratorPrototype, 'next',
                        arrayIteratorPrototypeNextDescriptor);
  Object.defineProperty(Array.prototype, 2, {});
})();

(function testArrayHasOtherPrototype() {
  function countArgs() { return arguments.length; }
  let a = [1, 2, 3];
  let b = {};
  Object.defineProperty(b, Symbol.iterator, {
    value: function*() {
      yield 4;
    },
    configurable: true
  });

  Object.setPrototypeOf(a, b);

  arktest.assertEQ(1, countArgs(...a));
})();

(function testArrayIteratorPrototypeGetter() {
  function countArgs() { return arguments.length; }
  let a = [1, 2, 3];
  let ai = a[Symbol.iterator]();
  let called = 0;

  let originalNext = ai.__proto__['next'];

  Object.defineProperty(ai.__proto__, 'next', {
    get: function() {
      called++;
      return originalNext;
    }
  });

  countArgs(...a);

  // .next method is only accessed during iteration prologue (see
  // https://github.com/tc39/ecma262/pull/988)
  arktest.assertEQ(1, called);
})();

(function testArrayIteratorPrototypeModified() {
  function countArgs() { return arguments.length; }
  let a = [1,2,3];
  let ai = a[Symbol.iterator]();
  Object.defineProperty(ai.__proto__, 'next', {
    value: function() {
      return {value: undefined, done: true};
     },
     configurable: true
  });

  arktest.assertEQ(0, countArgs(...a));

})();

(function testCustomArrayPrototypeIterator() {
  const origIterator =
      Object.getOwnPropertyDescriptor(Array.prototype, Symbol.iterator);
  Object.defineProperty(Array.prototype, Symbol.iterator, {
    value: function*() {
      yield 1;
      yield 2;
      yield 3;
    },
    configurable: true
  });
  function returnCountStrict() { 'use strict'; return arguments.length; }
  function returnCountSloppy() { return arguments.length; }

  arktest.assertEQ(3, returnCountStrict(...[1]));
  arktest.assertEQ(4, returnCountStrict(1, ...[2]));
  arktest.assertEQ(5, returnCountStrict(1, ...[2], 3));
  arktest.assertEQ(3, returnCountSloppy(...[1]));
  arktest.assertEQ(4, returnCountSloppy(1, ...[2]));
  arktest.assertEQ(5, returnCountSloppy(1, ...[2], 3));

  Object.defineProperty(Array.prototype, Symbol.iterator, origIterator);
})();

(function testGetPropertyIteratorCalledExactlyOnce() {
  function countArgs() { return arguments.length; }
  let a = [1, 2, 3];
  let called = 0;

  Object.defineProperty(Array.prototype, Symbol.iterator, {
    value: function*() {
      yield 1;
      yield 2;
    },
    configurable: true
  });

  const it = a[Symbol.iterator];
  Object.defineProperty(a, Symbol.iterator, {
    get: function() {
      called++;
      return it;
    }
  });

  countArgs(...a);

  arktest.assertEQ(1, called);
})();
