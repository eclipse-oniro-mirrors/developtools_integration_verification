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

// Test for-of semantics.

/*---
tags: [compile-only, negative]
expected_out_1: >-
  Syntax error ESY0314: Generator functions are not supported, please use
  async/await mechanism for multitasking
---*/

'use strict';


// First, some helpers.

function* values() {
  for (let i = 0; i < arguments.length; i++) {
    yield arguments[i];
  }
}

function wrapIterator(iterator) {
    let iterable = {};
    iterable[Symbol.iterator] = function() { return iterator; };
    return iterable;
}

function integersUntil(max) {
  function next() {
    const ret = { value: this.n, done: this.n == max };
    this.n++;
    return ret;
  }
  return wrapIterator({ next: next, n: 0 });
}

function results(results) {
  let i = 0;
  function next() {
    return results[i++];
  }
  return wrapIterator({ next: next });
}

function* integersFrom(n) {
  while (1) { yield n++; }
}

// A destructive append.
function append(x, tail) {
  tail[tail.length] = x;
  return tail;
}

function sum(x, tail) {
  return x + tail;
}

function fold(cons, seed, iterable) {
  for (let x of iterable) {
    seed = cons(x, seed);
  }
  return seed;
}

function* take(iterable, n) {
  if (n == 0) {
    return;
  }
  for (let x of iterable) {
    yield x;
    if (--n == 0) { break; }
  }
}

function nth(iterable, n) {
  for (let x of iterable) {
    if (n-- == 0) { return x; }
  }
  throw 'unreachable';
}

function* skipEvery(iterable, n) {
  let i = 0;
  for (let x of iterable) {
    if (++i % n == 0) { continue; }
    yield x;
  }
}

function* iterMap(iterable, f) {
  for (let x of iterable) {
    yield f(x);
  }
}
function nestedFold(cons, seed, iterable) {
  const visited = []
  for (let x of iterable) {
    for (let y of x) {
      seed = cons(y, seed);
    }
  }
  return seed;
}

function* unreachable(iterable) {
  for (let x of iterable) {
    throw 'not reached';
  }
}

function oneTimeGetter(o, prop, val) {
  function setNever() { throw 'unreachable'; }
  let gotten = false;
  function getOnce() {
    if (gotten) { throw 'got twice'; }
    gotten = true;
    return val;
  }
  Object.defineProperty(o, prop, {get: getOnce, set: setNever})
  return o;
}

function neverGetter(o, prop) {
  function never() { throw 'unreachable'; }
  Object.defineProperty(o, prop, {get: never, set: never})
  return o;
}

function removeNextAfter(iterable, n) {
  let iterator = iterable[Symbol.iterator]();
  function next() {
    if (n-- == 0) { delete this.next; }
    return iterator.next();
  }
  return wrapIterator({ next: next });
}

function poisonNextAfter(iterable, n) {
  let iterator = iterable[Symbol.iterator]();
  function next() {
    return iterator.next();
  }
  function nextGetter() {
    if (n-- < 0) {
      throw 'poisoned';
      }
    return next;
  }
  let o = {};
  Object.defineProperty(o, 'next', { get: nextGetter });
  return wrapIterator(o);
}

// Now, the tests.

// Non-generator iterators.
arktest.assertEQ(45, fold(sum, 0, integersUntil(10)));
// Generator iterators.
arktest.assertEQ([1, 2, 3], fold(append, [], values(1, 2, 3)));
// Break.
arktest.assertEQ(45, fold(sum, 0, take(integersFrom(0), 10)));
// Continue.
arktest.assertEQ(90, fold(sum, 0, take(skipEvery(integersFrom(0), 2), 10)));
// Return.
arktest.assertEQ(10, nth(integersFrom(0), 10));
// Nested for-of.
arktest.assertEQ([0, 0, 1, 0, 1, 2, 0, 1, 2, 3],
             nestedFold(append,
                         [],
                         iterMap(integersUntil(5), integersUntil)));
// Result objects with sparse fields.
arktest.assertEQ([undefined, 1, 2, 3],
             fold(append, [],
                  results([{ done: false },
                           { value: 1, done: false },
                           // A missing "done" is the same as undefined, which
                           // is false.
                           { value: 2 },
                           // Not done.
                           { value: 3, done: 0 },
                           // Done.
                           { value: 4, done: 42 }])));
// Results that are not objects.
arktest.expectThrow(function() {
  arktest.assertEQ([undefined, undefined, undefined],
               fold(append, [],
                    results([10, 'foo', /qux/, { value: 37, done: true }])));
}, ((e: Error): boolean => e instanceof TypeError));
// Getters (shudder).
arktest.assertEQ([1, 2],
             fold(append, [],
                  results([oneTimeGetter({ value: 1 }, 'done', false),
                           oneTimeGetter({ done: false }, 'value', 2),
                           { value: 37, done: true },
                           neverGetter(neverGetter({}, 'done'), 'value')])));

// Unlike the case with for-in, null and undefined cause an error.
arktest.expectThrow('fold(sum, 0, unreachable(null))', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('fold(sum, 0, unreachable(undefined))', ((e: Error): boolean => e instanceof TypeError));

// Other non-iterators do cause an error.
arktest.expectThrow('fold(sum, 0, unreachable({}))', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('fold(sum, 0, unreachable(false))', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('fold(sum, 0, unreachable(37))', ((e: Error): boolean => e instanceof TypeError));

// "next" is looked up only once during the iteration prologue (see
// https://github.com/tc39/ecma262/pull/988)
arktest.assertEQ(45, fold(sum, 0, removeNextAfter(integersUntil(10), 5)));
arktest.assertEQ(45,
             fold(sum, 0, removeNextAfter(integersUntil(10), 10)));
arktest.assertEQ(45,
             fold(sum, 0, poisonNextAfter(integersUntil(10), 10)));

function labelledContinue(iterable) {
  let n = 0;
outer:
  while (true) {
    n++;
    for (let x of iterable) { continue outer; }
    break;
  }
  return n;
}
arktest.assertEQ(11, labelledContinue(integersUntil(10)));

function labelledBreak(iterable) {
  let n = 0;
outer:
  while (true) {
    n++;
    for (let x of iterable) { break outer; }
  }
  return n;
}
arktest.assertEQ(1, labelledBreak(integersUntil(10)));

// Test continue/break in catch.
function catchControl(iterable, k) {
  let n = 0;
  for (let x of iterable) {
    try {
      return k(x);
    } catch (e) {
      if (e == 'continue') {
        continue;
      } else if (e == 'break') {
        break;
      } else {
        throw e;
      }
    }
  } while (false){ ; }
  return false;
}
arktest.assertEQ(false,
             catchControl(integersUntil(10),
                           function() { throw 'break' }));
arktest.assertEQ(false,
             catchControl(integersUntil(10),
                           function() { throw 'continue' }));
arktest.assertEQ(5,
             catchControl(integersUntil(10),
                           function(x) {
                             if (x == 5) { return x; }
                             throw 'continue';
                           }));

// Test continue/break in try.
function tryControl(iterable, k) {
  let n = 0;
  for (let x of iterable) {
    try {
      let e = k(x);
      if (e == 'continue') {
        continue;
      } else if (e == 'break') {
        break;
      }
      return e;
    } catch (e) {
      throw e;
    }
  } while (false){ ; }
  return false;
}
arktest.assertEQ(false,
             tryControl(integersUntil(10),
                         function() { return 'break' }));
arktest.assertEQ(false,
             tryControl(integersUntil(10),
                         function() { return 'continue' }));
arktest.assertEQ(5,
             tryControl(integersUntil(10),
                         function(x) { return (x == 5) ? x : 'continue' }));

// TODO(neis,cbruni): Enable once the corresponding traps work again.
// Proxy results, with getters.
//     get: function(receiver, name) { return x[name]; }
// }
//              fold(append, [],
//                   results([one_time_getter({ value: 1 }, 'done', false),
//                            one_time_getter({ done: false }, 'value', 2),
//                            { value: 37, done: true },
//                            never_getter(never_getter({}, 'done'), 'value')]
//                           .map(transparent_proxy))));

// Proxy iterators.
//     get: function(receiver, name) {
//     },
//     // Needed for integers_until(10)'s this.n++.
//     set: function(receiver, name, val) {
//     }
//   }));
// }


function testIteratorResultObjectNonObject(value, descr) {
  const arr = [];
  let ex;
  const message = 'Iterator result ' + (descr || value) + ' is not an object';
  try {
    fold(append, arr,
         results([{value: 1}, {}, value, {value: 2}, {done: true}]));
  } catch (e) {
    ex = e;
  }
  arktest.assertTrue(ex instanceof TypeError);
  arktest.assertEQ(message, ex.message);
  arktest.assertEQ([1, undefined], arr);
}
testIteratorResultObjectNonObject(null);
testIteratorResultObjectNonObject(undefined);
testIteratorResultObjectNonObject(42);
testIteratorResultObjectNonObject('abc');
testIteratorResultObjectNonObject(false);
testIteratorResultObjectNonObject(Symbol('x'), 'Symbol(x)');
