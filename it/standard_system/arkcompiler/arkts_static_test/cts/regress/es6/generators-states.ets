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

// Test generator states.

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0194: Parameter declaration should have an explicit type annotation."
---*/

function Foo() {}
function Bar() {}

function assertIteratorResult(value, done, result) {
  arktest.assertEQ({ value: value, done: done}, result);
}

function assertIteratorIsClosed(iter) {
  assertIteratorResult(undefined, true, iter.next());
  // Next and throw on a closed iterator.
  arktest.expectNoThrow(function() { iter.next(); });
  arktest.expectThrow(function() { iter.throw(new Bar); }, Bar);
}

let iter;
function* nextGenerator() { yield iter.next(); }
function* throwGenerator() { yield iter.throw(new Bar); }

// Throw on a suspendedStart iterator.
iter = nextGenerator();
arktest.expectThrow(function() { iter.throw(new Foo) }, Foo)
assertIteratorIsClosed(iter);
arktest.expectThrow(function() { iter.throw(new Foo) }, Foo)
assertIteratorIsClosed(iter);

// The same.
iter = throwGenerator();
arktest.expectThrow(function() { iter.throw(new Foo) }, Foo)
arktest.expectThrow(function() { iter.throw(new Foo) }, Foo)
assertIteratorIsClosed(iter);

// Next on an executing iterator raises a TypeError.
iter = nextGenerator();
arktest.expectThrow(function() { iter.next() }, ((e: Error): boolean => e instanceof TypeError))
assertIteratorIsClosed(iter);

// Throw on an executing iterator raises a TypeError.
iter = throwGenerator();
arktest.expectThrow(function() { iter.next() }, ((e: Error): boolean => e instanceof TypeError))
assertIteratorIsClosed(iter);

// Next on an executing iterator doesn't change the state of the
// generator.
iter = (function* () {
  try {
    iter.next();
    yield 1;
  } catch (e) {
    try {
      // This next() should raise the same exception, because the first
      // next() left the iter in the executing state.
      iter.next();
      yield 2;
    } catch (e) {
      yield 3;
    }
  }
  yield 4;
})();
assertIteratorResult(3, false, iter.next());
assertIteratorResult(4, false, iter.next());
assertIteratorIsClosed(iter);


// A return that doesn't close.
{
  let g = function*() { try {return 42} finally {yield 43} };

  let x = g();
  arktest.assertEQ({value: 43, done: false}, x.next());
  arktest.assertEQ({value: 42, done: true}, x.next());
}
{
  let x;
  let g = function*() { try {return 42} finally {x.throw(666)} };

  x = g();
  arktest.expectThrow(() => x.next(), ((e: Error): boolean => e instanceof TypeError));  // Still executing.
}
{
  let x;
  let g = function*() {
    try {return 42} finally {try {x.throw(666)} catch(e) {}}
  };

  x = g();
  arktest.assertEQ({value: 42, done: true}, x.next());
}
