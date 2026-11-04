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
expected_out_1: "Semantic error ESE655063: Generic function from requires explicit type arguments when used as a value."
---*/

let from = Array.from;



(function() {

arktest.assertEQ(1, Array.from.length);

function assertArrayLikeEquals(value, expected, type) {
  arktest.assertTrue(value instanceof type);
  arktest.assertEQ(expected.length, value.length);
  for (let i=0; i<value.length; ++i) {
    arktest.assertEQ(expected[i], value[i]);
  }
}

// Assert that constructor is called with "length" for array-like objects
let myCollectionCalled = false;
function myCollection(length) {
  myCollectionCalled = true;
  arktest.assertEQ(1, arguments.length);
  arktest.assertEQ(5, length);
}

Array.from.call(myCollection, {length: 5});
arktest.assertTrue(myCollectionCalled);

// Assert that calling mapfn with / without thisArg in sloppy and strict modes
// works as expected.
const global = this;
function nonStrict(){ arktest.assertEQ(global, this); }
function strict(){ 'use strict'; arktest.assertEQ(void 0, this); }
function strictNull(){ 'use strict'; arktest.assertEQ(null, this); }
Array.from([1], nonStrict);
Array.from([1], nonStrict, void 0);
Array.from([1], nonStrict, null);
Array.from([1], strict);
Array.from([1], strict, void 0);
Array.from([1], strictNull, null);

function testArrayFrom(thisArg, constructor) {
  assertArrayLikeEquals(Array.from.call(thisArg, [], undefined), [],
      constructor);
  assertArrayLikeEquals(Array.from.call(thisArg, NaN), [], constructor);
  assertArrayLikeEquals(Array.from.call(thisArg, Infinity), [], constructor);
  assertArrayLikeEquals(Array.from.call(thisArg, 10000000), [], constructor);
  assertArrayLikeEquals(Array.from.call(thisArg, 'test'), ['t', 'e', 's', 't'],
      constructor);

  assertArrayLikeEquals(Array.from.call(thisArg,
      { length: 1, '0': { 'foo': 'bar' } }), [{'foo': 'bar'}], constructor);

  assertArrayLikeEquals(Array.from.call(thisArg,
      { length: -1, '0': { 'foo': 'bar' } }), [], constructor);

  assertArrayLikeEquals(Array.from.call(thisArg,
      [ 'foo', 'bar', 'baz' ]), ['foo', 'bar', 'baz'], constructor);

  const kSet = new Set(['foo', 'bar', 'baz']);
  assertArrayLikeEquals(Array.from.call(thisArg, kSet), ['foo', 'bar', 'baz'],
      constructor);

  const kMap = new Map(['foo', 'bar', 'baz'].entries());
  assertArrayLikeEquals(Array.from.call(thisArg, kMap),
      [[0, 'foo'], [1, 'bar'], [2, 'baz']], constructor);


  function* generator() {
    yield 'a';
    yield 'b';
    yield 'c';
  }

  assertArrayLikeEquals(Array.from.call(thisArg, generator()),
                        ['a', 'b', 'c'], constructor);

  // Mozilla:
  // Array.from on a string handles surrogate pairs correctly.
  const gclef = '\uD834\uDD1E'; // U+1D11E MUSICAL SYMBOL G CLEF
  assertArrayLikeEquals(Array.from.call(thisArg, gclef), [gclef], constructor);
  assertArrayLikeEquals(Array.from.call(thisArg, gclef + ' G'),
      [gclef, ' ', 'G'], constructor);

  assertArrayLikeEquals(Array.from.call(thisArg, 'test', function(x) {
    return this.filter(x);
  }, {
    filter: function(x) { return x.toUpperCase(); }
  }), ['T', 'E', 'S', 'T'], constructor);
  assertArrayLikeEquals(Array.from.call(thisArg, 'test', function(x) {
    return x.toUpperCase();
  }), ['T', 'E', 'S', 'T'], constructor);

  arktest.expectThrow(function() { Array.from.call(thisArg, null); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(
    function() { Array.from.call(thisArg, undefined); },
    ((e: Error): boolean => e instanceof TypeError)
  );
  arktest.expectThrow(
    function() { Array.from.call(thisArg, [], null); },
    ((e: Error): boolean => e instanceof TypeError)
  );
  arktest.expectThrow(function() { Array.from.call(thisArg, [], 'noncallable'); },
               TypeError);

  const nullIterator = {};
  nullIterator[Symbol.iterator] = null;
  assertArrayLikeEquals(Array.from.call(thisArg, nullIterator), [],
                        constructor);

  const nonObjIterator = {};
  nonObjIterator[Symbol.iterator] = function() { return 'nonObject'; };
  arktest.expectThrow(function() { Array.from.call(thisArg, nonObjIterator); },
               TypeError);

  arktest.expectThrow(
    function() { Array.from.call(thisArg, [], null); },
    ((e: Error): boolean => e instanceof TypeError)
  );

  // Ensure iterator is only accessed once, and only invoked once
  let called = false;
  let arr = [1, 2, 3];
  const obj = {};

  // Test order --- only get iterator method once
  function testIterator() {
    arktest.assertFalse(called, '@@iterator should be called only once');
    called = true;
    arktest.assertEQ(obj, this);
    return arr[Symbol.iterator]();
  }
  let getCalled = false;
  Object.defineProperty(obj, Symbol.iterator, {
    get: function() {
      arktest.assertFalse(getCalled, '@@iterator should be accessed only once');
      getCalled = true;
      return testIterator;
    },
    set: function() {
      arktest.assertTrue(false, '@@iterator should not be set');
    }
  });
  assertArrayLikeEquals(Array.from.call(thisArg, obj), [1, 2, 3], constructor);
}

function other() {}

const boundFn = (function() {}).bind(Array, 27);

testArrayFrom(Array, Array);
testArrayFrom(null, Array);
testArrayFrom({}, Array);
testArrayFrom(Object, Object);
testArrayFrom(other, other);
testArrayFrom(Math.cos, Array);
testArrayFrom(Math.cos.bind(Math), Array);
testArrayFrom(boundFn, boundFn);

// Assert that [[DefineOwnProperty]] is used in ArrayFrom, meaning a
// setter isn't called, and a failed [[DefineOwnProperty]] will throw.
let setterCalled = 0;
function exotic() {
  Object.defineProperty(this,  '0', {
    get: function() { return 2; },
    set: function() { setterCalled++; }
  });
}
// Non-configurable properties can't be overwritten with DefineOwnProperty
arktest.expectThrow(function () { Array.from.call(exotic, [1]); }, ((e: Error): boolean => e instanceof TypeError));
// The setter wasn't called
arktest.assertEQ(0, setterCalled);

// Non-callable iterators should cause a TypeError before calling the target
// constructor.
items = {};
items[Symbol.iterator] = 7;
function TestError() {}
function arrayLike() { throw new TestError() }
arktest.expectThrow(function() { Array.from.call(arrayLike, items); }, ((e: Error): boolean => e instanceof TypeError));

// Check that array properties defined are writable, enumerable, configurable
function ordinary() { }
let x = Array.from.call(ordinary, [2]);
const xlength = Object.getOwnPropertyDescriptor(x, 'length');
arktest.assertEQ(1, xlength.value);
arktest.assertEQ(true, xlength.writable);
arktest.assertEQ(true, xlength.enumerable);
arktest.assertEQ(true, xlength.configurable);
const x0 = Object.getOwnPropertyDescriptor(x, 0);
arktest.assertEQ(2, x0.value);
arktest.assertEQ(true, xlength.writable);
arktest.assertEQ(true, xlength.enumerable);
arktest.assertEQ(true, xlength.configurable);

})();

(function testElementsKind() {
  // Check that Array.from returns PACKED elements.
  let arr = Array.from([1,2,3]);
  arktest.assertTrue(ArkTools.hasFastPackedElements(arr));
  arktest.assertTrue(ArkTools.hasSmiElements(arr));

  let arr = Array.from({length: 3});
  arktest.assertTrue(ArkTools.hasFastPackedElements(arr));
  arktest.assertTrue(ArkTools.hasObjectElements(arr));

  let arr = Array.from({length: 3}, (x) => 1);
  arktest.assertTrue(ArkTools.hasFastPackedElements(arr));
  arktest.assertTrue(ArkTools.hasSmiElements(arr));

  let arr = Array.from({length: 3}, (x) => 1.5);
  arktest.assertTrue(ArkTools.hasFastPackedElements(arr));
  arktest.assertTrue(ArkTools.hasDoubleElements(arr));
})();
