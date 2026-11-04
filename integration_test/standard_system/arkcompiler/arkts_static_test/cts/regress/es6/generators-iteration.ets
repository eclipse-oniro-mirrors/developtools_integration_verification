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


// Test generator iteration.

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0320: Function expressions are not supported, use arrow functions instead"
---*/

const generatorFunction = (function*(){yield 1;}).__proto__.constructor;

function assertIteratorResult(value, done, result) {
  arktest.assertEQ({ value: value, done: done}, result);
}

function assertIteratorIsClosed(iter) {
  assertIteratorResult(undefined, true, iter.next());
  arktest.expectNoThrow(function() { iter.next(); });
}

function assertThrownIteratorIsClosed(iter) {
  assertIteratorIsClosed(iter);
}

function testGeneratorResultPrototype() {
  function* g() { yield 1; }
  let iter = g();
  let result = iter.next();

  arktest.assertEQ(Object.prototype, Object.getPrototypeOf(result));
  property_names = Object.getOwnPropertyNames(result);
  property_names.sort();
  arktest.assertEQ(['done', 'value'], property_names);
  assertIteratorResult(1, false, result);
}
testGeneratorResultPrototype()

function testGenerator(g, expectedValuesForNext,
                       sendVal, expectedValuesForSend) {
  function testNext(thunk) {
    let iter = thunk();
    for (let i = 0; i < expectedValuesForNext.length; i++) {
      const v1 = expectedValuesForNext[i];
      const v2 = i == expectedValuesForNext.length - 1;
      assertIteratorResult(v1, v2, iter.next());
    }
    assertIteratorIsClosed(iter);
  }
  function testSend(thunk) {
    let iter = thunk();
    for (let i = 0; i < expectedValuesForSend.length; i++) {
      assertIteratorResult(expectedValuesForSend[i],
                           i == expectedValuesForSend.length - 1,
                           iter.next(sendVal));
    }
    assertIteratorIsClosed(iter);
  }
  function testThrow(thunk) {
    for (let i = 0; i < expectedValuesForNext.length; i++) {
      let iter = thunk();
      for (let j = 0; j < i; j++) {
        assertIteratorResult(expectedValuesForNext[j],
                             j == expectedValuesForNext.length - 1,
                             iter.next());
      }
      function Sentinel() {}
      arktest.expectThrow(function () { iter.throw(new Sentinel); }, Sentinel);
      assertThrownIteratorIsClosed(iter);
    }
  }

  testNext(g);
  testSend(g);
  testThrow(g);

  testNext(function*() { return yield* g(); });
  testSend(function*() { return yield* g(); });
  testThrow(function*() { return yield* g(); });

  if (g instanceof generatorFunction) {
    testNext(g);
    testSend(g);
    testThrow(g);
  }
}

testGenerator(function* g1() { },
              [undefined],
              'foo',
              [undefined]);

testGenerator(function* g2() { yield 1; },
              [1, undefined],
              'foo',
              [1, undefined]);

testGenerator(function* g3() { yield 1; yield 2; },
              [1, 2, undefined],
              'foo',
              [1, 2, undefined]);

testGenerator(function* g4() { yield 1; yield 2; return 3; },
              [1, 2, 3],
              'foo',
              [1, 2, 3]);

testGenerator(function* g5() { return 1; },
              [1],
             'foo',
              [1]);

testGenerator(function* g6() { let x = yield 1; return x; },
              [1, undefined],
              'foo',
              [1, 'foo']);

testGenerator(function* g7() { let x = yield 1; yield 2; return x; },
              [1, 2, undefined],
              'foo',
              [1, 2, 'foo']);

testGenerator(function* g8() { for (let x = 0; x < 4; x++) { yield x; } },
              [0, 1, 2, 3, undefined],
              'foo',
              [0, 1, 2, 3, undefined]);

// Generator with arguments.
testGenerator(
    function g9() {
      return (function*(a, b, c, d) {
        yield a; yield b; yield c; yield d;
      })('fee', 'fi', 'fo', 'fum');
    },
    ['fee', 'fi', 'fo', 'fum', undefined],
    'foo',
    ['fee', 'fi', 'fo', 'fum', undefined]);

// Too few arguments.
testGenerator(
    function g10() {
      return (function*(a, b, c, d) {
        yield a; yield b; yield c; yield d;
      })('fee', 'fi');
    },
    ['fee', 'fi', undefined, undefined, undefined],
    'foo',
    ['fee', 'fi', undefined, undefined, undefined]);

// Too many arguments.
testGenerator(
    function g11() {
      return (function*(a, b, c, d) {
        yield a; yield b; yield c; yield d;
      })('fee', 'fi', 'fo', 'fum', 'I smell the blood of an Englishman');
    },
    ['fee', 'fi', 'fo', 'fum', undefined],
    'foo',
    ['fee', 'fi', 'fo', 'fum', undefined]);

// The arguments object.
testGenerator(
    function g12() {
      return (function*(a, b, c, d) {
        for (let i = 0; i < arguments.length; i++) {
          yield arguments[i];
        }
      })('fee', 'fi', 'fo', 'fum', 'I smell the blood of an Englishman');
    },
    ['fee', 'fi', 'fo', 'fum', 'I smell the blood of an Englishman',
     undefined],
    'foo',
    ['fee', 'fi', 'fo', 'fum', 'I smell the blood of an Englishman',
     undefined]);

// Access to captured free variables.
testGenerator(
    function g13() {
      return (function(a, b, c, d) {
        return (function*() {
          yield a; yield b; yield c; yield d;
        })();
      })('fee', 'fi', 'fo', 'fum');
    },
    ['fee', 'fi', 'fo', 'fum', undefined],
    'foo',
    ['fee', 'fi', 'fo', 'fum', undefined]);

// Abusing the arguments object.
testGenerator(
    function g14() {
      return (function*(a, b, c, d) {
        arguments[0] = 'Be he live';
        arguments[1] = 'or be he dead';
        arguments[2] = 'I\'ll grind his bones';
        arguments[3] = 'to make my bread';
        yield a; yield b; yield c; yield d;
      })('fee', 'fi', 'fo', 'fum');
    },
    ['Be he live', 'or be he dead', 'I\'ll grind his bones', 'to make my bread',
     undefined],
    'foo',
    ['Be he live', 'or be he dead', 'I\'ll grind his bones', 'to make my bread',
     undefined]);

// Abusing the arguments object: strict mode.
testGenerator(
    function g15() {
      return (function*(a, b, c, d) {
        'use strict';
        arguments[0] = 'Be he live';
        arguments[1] = 'or be he dead';
        arguments[2] = 'I\'ll grind his bones';
        arguments[3] = 'to make my bread';
        yield a; yield b; yield c; yield d;
      })('fee', 'fi', 'fo', 'fum');
    },
    ['fee', 'fi', 'fo', 'fum', undefined],
    'foo',
    ['fee', 'fi', 'fo', 'fum', undefined]);

// GC.
testGenerator(function* g16() { yield 'baz'; ArkTools.gc(); yield 'qux'; },
              ['baz', 'qux', undefined],
              'foo',
              ['baz', 'qux', undefined]);

// Receivers.
testGenerator(
    function g17() {
      function* g() { yield this.x; yield this.y; }
      const o = { start: g, x: 1, y: 2 };
      return o.start();
    },
    [1, 2, undefined],
    'foo',
    [1, 2, undefined]);

testGenerator(
    function* g19() {
      let x = 1;
      yield x;
      with({x:2}) { yield x; }
      yield x;
    },
    [1, 2, 1, undefined],
    'foo',
    [1, 2, 1, undefined]);

testGenerator(
    function* g20() { yield (1 + (yield 2) + 3); },
    [2, NaN, undefined],
    'foo',
    [2, '1foo3', undefined]);

testGenerator(
    function* g21() { return (1 + (yield 2) + 3); },
    [2, NaN],
    'foo',
    [2, '1foo3']);

testGenerator(
    function* g22() { yield (1 + (yield 2) + 3); yield (4 + (yield 5) + 6); },
    [2, NaN, 5, NaN, undefined],
    'foo',
    [2, '1foo3', 5, '4foo6', undefined]);

testGenerator(
    function* g23() {
      return (yield (1 + (yield 2) + 3)) + (yield (4 + (yield 5) + 6));
    },
    [2, NaN, 5, NaN, NaN],
    'foo',
    [2, '1foo3', 5, '4foo6', 'foofoo']);

// Rewind a try context with and without operands on the stack.
testGenerator(
    function* g24() {
      try {
        return (yield (1 + (yield 2) + 3)) + (yield (4 + (yield 5) + 6));
      } catch (e) {
        throw e;
      }
    },
    [2, NaN, 5, NaN, NaN],
    'foo',
    [2, '1foo3', 5, '4foo6', 'foofoo']);

// Yielding in a catch context, with and without operands on the stack.
testGenerator(
    function* g25() {
      try {
        throw (yield (1 + (yield 2) + 3))
      } catch (e) {
        if (typeof e == 'object') { throw e; }
        return e + (yield (4 + (yield 5) + 6));
      }
    },
    [2, NaN, 5, NaN, NaN],
    'foo',
    [2, '1foo3', 5, '4foo6', 'foofoo']);

// Yield with no arguments yields undefined.
testGenerator(
    function* g26() { return yield yield },
    [undefined, undefined, undefined],
    'foo',
    [undefined, 'foo', 'foo']);

// A newline causes the parser to stop looking for an argument to yield.
testGenerator(
    function* g27() {
      yield
      3
      return
    },
    [undefined, undefined],
    'foo',
    [undefined, undefined]);

// TODO(wingo): We should use TestGenerator for these, except that
// currently yield* will unconditionally propagate a throw() to the
// delegate iterator, which fails for these iterators that don't have
(function() {
    function* g28() {
      yield* [1, 2, 3];
    }
    let iter = g28();
    assertIteratorResult(1, false, iter.next());
    assertIteratorResult(2, false, iter.next());
    assertIteratorResult(3, false, iter.next());
    assertIteratorResult(undefined, true, iter.next());
})();

(function() {
    function* g29() {
      yield* 'abc';
    }
    let iter = g29();
    assertIteratorResult('a', false, iter.next());
    assertIteratorResult('b', false, iter.next());
    assertIteratorResult('c', false, iter.next());
    assertIteratorResult(undefined, true, iter.next());
})();

// Generator function instances.
testGenerator(generatorFunction(),
              [undefined],
              'foo',
              [undefined]);

testGenerator(new generatorFunction(),
              [undefined],
              'foo',
              [undefined]);

testGenerator(generatorFunction('yield 1;'),
              [1, undefined],
              'foo',
              [1, undefined]);

testGenerator(
    function() { return generatorFunction('x', 'y', 'yield x + y;')(1, 2) },
    [3, undefined],
    'foo',
    [3, undefined]);

// Access to this with formal arguments.
testGenerator(
    function () {
      return ({ x: 42, g: function* (a) { yield this.x } }).g(0);
    },
    [42, undefined],
    'foo',
    [42, undefined]);

// Test that yield* validates iterator results.
function testDelegatingYield(junk) {
  const iterator = {next: () => junk};
  const iterable = {[Symbol.iterator]: () => iterator};
  function* g() { return yield* iterable };
  arktest.expectThrow(() => g().next(), ((e: Error): boolean => e instanceof TypeError));
}
testDelegatingYield();
testDelegatingYield(null);
testDelegatingYield(42);
testDelegatingYield(true);

function testTryCatch(instantiate) {
  function* g() { yield 1; try { yield 2; } catch (e) { yield e; } yield 3; }
  function Sentinel() {}

  function test1(iter) {
    assertIteratorResult(1, false, iter.next());
    assertIteratorResult(2, false, iter.next());
    assertIteratorResult(3, false, iter.next());
    assertIteratorIsClosed(iter);
  }
  test1(instantiate(g));

  function test2(iter) {
    arktest.expectThrow(function() { iter.throw(new Sentinel); }, Sentinel);
    assertThrownIteratorIsClosed(iter);
  }
  test2(instantiate(g));

  function test3(iter) {
    assertIteratorResult(1, false, iter.next());
    arktest.expectThrow(function() { iter.throw(new Sentinel); }, Sentinel);
    assertThrownIteratorIsClosed(iter);
  }
  test3(instantiate(g));

  function test4(iter) {
    assertIteratorResult(1, false, iter.next());
    assertIteratorResult(2, false, iter.next());
    let exn = new Sentinel;
    assertIteratorResult(exn, false, iter.throw(exn));
    assertIteratorResult(3, false, iter.next());
    assertIteratorIsClosed(iter);
  }
  test4(instantiate(g));

  function test5(iter) {
    assertIteratorResult(1, false, iter.next());
    assertIteratorResult(2, false, iter.next());
    let exn = new Sentinel;
    assertIteratorResult(exn, false, iter.throw(exn));
    assertIteratorResult(3, false, iter.next());
    arktest.expectThrow(function() { iter.throw(new Sentinel); }, Sentinel);
    assertThrownIteratorIsClosed(iter);
  }
  test5(instantiate(g));

  function test6(iter) {
    assertIteratorResult(1, false, iter.next());
    assertIteratorResult(2, false, iter.next());
    let exn = new Sentinel;
    assertIteratorResult(exn, false, iter.throw(exn));
    arktest.expectThrow(function() { iter.throw(new Sentinel); }, Sentinel);
    assertThrownIteratorIsClosed(iter);
  }
  test6(instantiate(g));

  function test7(iter) {
    assertIteratorResult(1, false, iter.next());
    assertIteratorResult(2, false, iter.next());
    assertIteratorResult(3, false, iter.next());
    assertIteratorIsClosed(iter);
  }
  test7(instantiate(g));
}
testTryCatch(function (g) { return g(); });
testTryCatch(function* (g) { return yield* g(); });

function testTryFinally(instantiate) {
  function* g() { yield 1; try { yield 2; } finally { yield 3; } yield 4; }
  function Sentinel() {}
  function Sentinel2() {}

  function test1(iter) {
    assertIteratorResult(1, false, iter.next());
    assertIteratorResult(2, false, iter.next());
    assertIteratorResult(3, false, iter.next());
    assertIteratorResult(4, false, iter.next());
    assertIteratorIsClosed(iter);
  }
  test1(instantiate(g));

  function test2(iter) {
    arktest.expectThrow(function() { iter.throw(new Sentinel); }, Sentinel);
    assertThrownIteratorIsClosed(iter);
  }
  test2(instantiate(g));

  function test3(iter) {
    assertIteratorResult(1, false, iter.next());
    arktest.expectThrow(function() { iter.throw(new Sentinel); }, Sentinel);
    assertThrownIteratorIsClosed(iter);
  }
  test3(instantiate(g));

  function test4(iter) {
    assertIteratorResult(1, false, iter.next());
    assertIteratorResult(2, false, iter.next());
    assertIteratorResult(3, false, iter.throw(new Sentinel));
    arktest.expectThrow(function() { iter.next(); }, Sentinel);
    assertThrownIteratorIsClosed(iter);
  }
  test4(instantiate(g));

  function test5(iter) {
    assertIteratorResult(1, false, iter.next());
    assertIteratorResult(2, false, iter.next());
    assertIteratorResult(3, false, iter.throw(new Sentinel));
    arktest.expectThrow(function() { iter.throw(new Sentinel2); }, Sentinel2);
    assertThrownIteratorIsClosed(iter);
  }
  test5(instantiate(g));

  function test6(iter) {
    assertIteratorResult(1, false, iter.next());
    assertIteratorResult(2, false, iter.next());
    assertIteratorResult(3, false, iter.next());
    arktest.expectThrow(function() { iter.throw(new Sentinel); }, Sentinel);
    assertThrownIteratorIsClosed(iter);
  }
  test6(instantiate(g));

  function test7(iter) {
    assertIteratorResult(1, false, iter.next());
    assertIteratorResult(2, false, iter.next());
    assertIteratorResult(3, false, iter.next());
    assertIteratorResult(4, false, iter.next());
    arktest.expectThrow(function() { iter.throw(new Sentinel); }, Sentinel);
    assertThrownIteratorIsClosed(iter);
  }
  test7(instantiate(g));

  function test8(iter) {
    assertIteratorResult(1, false, iter.next());
    assertIteratorResult(2, false, iter.next());
    assertIteratorResult(3, false, iter.next());
    assertIteratorResult(4, false, iter.next());
    assertIteratorIsClosed(iter);
  }
  test8(instantiate(g));
}
testTryFinally(function (g) { return g(); });
testTryFinally(function* (g) { return yield* g(); });

function testNestedTry(instantiate) {
  function* g() {
    try {
      yield 1;
      try { yield 2; } catch (e) { yield e; }
      yield 3;
    } finally {
      yield 4;
    }
    yield 5;
  }
  function Sentinel() {}
  function Sentinel2() {}

  function test1(iter) {
    assertIteratorResult(1, false, iter.next());
    assertIteratorResult(2, false, iter.next());
    assertIteratorResult(3, false, iter.next());
    assertIteratorResult(4, false, iter.next());
    assertIteratorResult(5, false, iter.next());
    assertIteratorIsClosed(iter);
  }
  test1(instantiate(g));

  function test2(iter) {
    arktest.expectThrow(function() { iter.throw(new Sentinel); }, Sentinel);
    assertThrownIteratorIsClosed(iter);
  }
  test2(instantiate(g));

  function test3(iter) {
    assertIteratorResult(1, false, iter.next());
    assertIteratorResult(4, false, iter.throw(new Sentinel));
    arktest.expectThrow(function() { iter.next(); }, Sentinel);
    assertThrownIteratorIsClosed(iter);
  }
  test3(instantiate(g));

  function test4(iter) {
    assertIteratorResult(1, false, iter.next());
    assertIteratorResult(4, false, iter.throw(new Sentinel));
    arktest.expectThrow(function() { iter.throw(new Sentinel2); }, Sentinel2);
    assertThrownIteratorIsClosed(iter);
  }
  test4(instantiate(g));

  function test5(iter) {
    assertIteratorResult(1, false, iter.next());
    assertIteratorResult(2, false, iter.next());
    let exn = new Sentinel;
    assertIteratorResult(exn, false, iter.throw(exn));
    assertIteratorResult(3, false, iter.next());
    assertIteratorResult(4, false, iter.next());
    assertIteratorResult(5, false, iter.next());
    assertIteratorIsClosed(iter);
  }
  test5(instantiate(g));

  function test6(iter) {
    assertIteratorResult(1, false, iter.next());
    assertIteratorResult(2, false, iter.next());
    let exn = new Sentinel;
    assertIteratorResult(exn, false, iter.throw(exn));
    assertIteratorResult(4, false, iter.throw(new Sentinel2));
    arktest.expectThrow(function() { iter.next(); }, Sentinel2);
    assertThrownIteratorIsClosed(iter);
  }
  test6(instantiate(g));

  function test7(iter) {
    assertIteratorResult(1, false, iter.next());
    assertIteratorResult(2, false, iter.next());
    let exn = new Sentinel;
    assertIteratorResult(exn, false, iter.throw(exn));
    assertIteratorResult(3, false, iter.next());
    assertIteratorResult(4, false, iter.throw(new Sentinel2));
    arktest.expectThrow(function() { iter.next(); }, Sentinel2);
    assertThrownIteratorIsClosed(iter);
  }
  test7(instantiate(g));

  // That's probably enough.
}
testNestedTry(function (g) { return g(); });
testNestedTry(function* (g) { return yield* g(); });

function testRecursion() {
  function testNextRecursion() {
    function* g() { yield iter.next(); }
    let iter = g();
    return iter.next();
  }
  function testSendRecursion() {
    function* g() { yield iter.next(42); }
    let iter = g();
    return iter.next();
  }
  function testThrowRecursion() {
    function* g() { yield iter.throw(1); }
    let iter = g();
    return iter.next();
  }
  arktest.expectThrow(testNextRecursion, ((e: Error): boolean => e instanceof Error));
  arktest.expectThrow(testSendRecursion, ((e: Error): boolean => e instanceof Error));
  arktest.expectThrow(testThrowRecursion, ((e: Error): boolean => e instanceof Error));
}
testRecursion();


// Test yield* on non-iterable objects.
function* g(junk) { return yield* junk }
const nonIterables = [
  42,
  {[Symbol.iterator]: 42},
  {[Symbol.iterator]: () => 42},
  {[Symbol.iterator]: () => ({next: 42})},
];
for (let junk of nonIterables) {
  arktest.expectThrow(() => g(junk).next(), ((e: Error): boolean => e instanceof TypeError));
}
