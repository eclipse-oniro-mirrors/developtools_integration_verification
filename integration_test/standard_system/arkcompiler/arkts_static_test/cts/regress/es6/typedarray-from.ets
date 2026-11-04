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
expected_out_1: "Syntax error ESY0318: Class cannot be used as object."
---*/

const typedArrayConstructors = [
  Uint8Array,
  Int8Array,
  Uint16Array,
  Int16Array,
  Uint32Array,
  Int32Array,
  Uint8ClampedArray,
  Float32Array,
  Float64Array
];

function defaultValue(constr) {
  if (constr == Float32Array || constr == Float64Array) { return NaN; }
  return 0;
}

function assertArrayLikeEquals(value, expected, type) {
  arktest.assertEQ(value.__proto__, type.prototype);
  arktest.assertEQ(expected.length, value.length);
  for (let i = 0; i < value.length; ++i) {
    arktest.assertEQ(expected[i], value[i]);
  }
}

(function() {
  let source = [-0, 0, 2**40, 2**41, 2**42];
  let arr = Float64Array.from(source);
  assertArrayLikeEquals(arr, source, Float64Array);

  arr = Float32Array.from(source);
  assertArrayLikeEquals(arr, source, Float32Array);
})();

(function() {
  let source = [-0, 0, , 2**42];
  let expected = [-0, 0, NaN, 2**42];
  let arr = Float64Array.from(source);
  assertArrayLikeEquals(arr, expected, Float64Array);

  arr = Float32Array.from(source);
  assertArrayLikeEquals(arr, expected, Float32Array);
})();

(function() {
  let source = {0: -0, 1: 0, 2: 2**40, 3: 2**41, 4: 2**42, length: 5};
  let expected = [-0, 0, 2**40, 2**41, 2**42];
  let arr = Float64Array.from(source);
  assertArrayLikeEquals(arr, expected, Float64Array);

  arr = Float32Array.from(source);
  assertArrayLikeEquals(arr, expected, Float32Array);
})();

(function() {
  let source = [-0, 0, , 2**42];
  Object.getPrototypeOf(source)[2] = 27;
  let expected = [-0, 0, 27, 2**42];
  let arr = Float64Array.from(source);
  assertArrayLikeEquals(arr, expected, Float64Array);

  arr = Float32Array.from(source);
  assertArrayLikeEquals(arr, expected, Float32Array);
})();

for (let constructor of typedArrayConstructors) {
  arktest.assertEQ(1, constructor.from.length);

  // TypedArray.from only callable on this subclassing ArkTools.typedArray%
  arktest.expectThrow(function () {constructor.from.call(Array, [])}, ((e: Error): boolean => e instanceof TypeError));


  // Assert that calling mapfn with / without thisArg in sloppy and strict modes
  // works as expected.
  const global = this;
  // Openharmony only support strict mode.
  function strict() { 'use strict'; arktest.assertEQ(undefined, this); }
  function strictNull() { 'use strict'; arktest.assertEQ(null, this); }
  // Openharmony only support strict mode.
  constructor.from([1], strict);
  constructor.from([1], strict, void 0);
  constructor.from([1], strictNull, null);

  // TypedArray.from can only be called on TypedArray constructors
  arktest.expectThrow(function() {constructor.from.call({}, [])}, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() {constructor.from.call([], [])}, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() {constructor.from.call(1, [])}, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(
    function() {constructor.from.call(undefined, [])},
    ((e: Error): boolean => e instanceof TypeError)
  );

  // Use a map function that returns non-numbers.
  function mapper(value, index) {
    return String.fromCharCode(value);
  }
  let d = defaultValue(constructor);
  assertArrayLikeEquals(
      constructor.from([72, 69, 89], mapper), [d, d, d], constructor);

  // Converting from various other types, demonstrating that it can
  // operate on array-like objects as well as iterables.
  // TODO(littledan): constructors should have similar flexibility.
  assertArrayLikeEquals(constructor.from(
      { length: 1, 0: 5 }), [5], constructor);

  assertArrayLikeEquals(constructor.from(
      { length: -1, 0: 5 }), [], constructor);

  assertArrayLikeEquals(constructor.from(
      [1, 2, 3]), [1, 2, 3], constructor);

  const set = new Set([1, 2, 3]);
  assertArrayLikeEquals(constructor.from(set), [1, 2, 3],
        constructor);

  function* generator() {
    yield 4;
    yield 5;
    yield 6;
  }

  assertArrayLikeEquals(constructor.from(generator()),
                        [4, 5, 6], constructor);

  // Check mapper is used for non-iterator case.
  function mapper2(value, index) {
    return value + 1;
  }
  const arrayLike = {
    0: 1,
    1: 2,
    2: 3,
    length: 3
  };
  assertArrayLikeEquals(constructor.from(arrayLike, mapper2),
                        [2, 3, 4], constructor);

  // With a smi source. Step 10 will set len = 0.
  let source = 1;
  assertArrayLikeEquals(constructor.from(source), [], constructor);

  arktest.expectThrow(function() { constructor.from(null); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { constructor.from(undefined); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { constructor.from([], null); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { constructor.from([], 'noncallable'); },
               TypeError);

  source = [1, 2, 3];
  let proxy = new Proxy(source, {});
  assertArrayLikeEquals(constructor.from(proxy), source, constructor);

  proxy = new Proxy(source, {
    get: function(target, name) {
      if (name === Symbol.iterator) {
        return target[name];
      }
      if (name === 'length') { return 3; }
      return target[name] + 1;
    }
  });
  assertArrayLikeEquals(constructor.from(proxy), [2, 3, 4], constructor);
}

// Tests that modify global state in a way that affects fast paths e.g. by
// invalidating protectors or changing prototypes.
for (let constructor of typedArrayConstructors) {
  source = [1, 2, 3];
  source[Symbol.iterator] = undefined;
  assertArrayLikeEquals(constructor.from(source), source, constructor);

  source = [{ valueOf: function(){ return 42; }}];
  source[Symbol.iterator] = undefined;
  assertArrayLikeEquals(constructor.from(source), [42], constructor);

  Number.prototype[Symbol.iterator] = function* () {
    yield 1;
    yield 2;
    yield 3;
  }
  assertArrayLikeEquals(constructor.from(1), [1, 2, 3], constructor);
  assertArrayLikeEquals(constructor.from(1.1), [1, 2, 3], constructor);

  const nullIterator = {};
  nullIterator[Symbol.iterator] = null;
  assertArrayLikeEquals(constructor.from(nullIterator), [],
                        constructor);

  const nonObjIterator = {};
  nonObjIterator[Symbol.iterator] = function() { return 'nonObject'; };
  arktest.expectThrow(function() { constructor.from(nonObjIterator); },
               TypeError);

  arktest.expectThrow(function() { constructor.from([], null); }, ((e: Error): boolean => e instanceof TypeError));

  d = defaultValue(constructor);
  let ta1 = new constructor(3).fill(1);
  Object.defineProperty(ta1, 'length', {get: function() {
    return 6;
  }});
  delete ta1[Symbol.iterator];
  delete ta1.__proto__[Symbol.iterator];
  delete ta1.__proto__.__proto__[Symbol.iterator];
  assertArrayLikeEquals(constructor.from(ta1), [1, 1, 1, d, d, d], constructor);

  let ta2 = new constructor(3).fill(1);
  Object.defineProperty(ta2, 'length', {get: function() {
    ArkTools.arrayBufferDetach(ta2.buffer);
    return 6;
  }});
  assertArrayLikeEquals(constructor.from(ta2), [d, d, d, d, d, d], constructor);

  const o1 = {0: 0, 1: 1, 2: 2, length: 6};
  assertArrayLikeEquals(constructor.from(o1), [0, 1, 2, d, d, d], constructor);

  // Ensure iterator is only accessed once, and only invoked once
  let called = 0;
  let arr = [1, 2, 3];
  const obj = {};
  const counter = 0;

  // Test order --- only get iterator method once
  function testIterator() {
    called++;
    arktest.assertEQ(obj, this);
    return arr[Symbol.iterator]();
  }
  let getCalled = 0;
  Object.defineProperty(obj, Symbol.iterator, {
    get: function() {
      getCalled++;
      return testIterator;
    },
    set: function() {
      arktest.assertTrue(false, '@@iterator should not be set');
    }
  });
  assertArrayLikeEquals(constructor.from(obj), [1, 2, 3], constructor);
  arktest.assertEQ(getCalled, 1);
  arktest.assertEQ(called, 1);

  arktest.assertEQ(constructor, Uint8Array.from.call(constructor, [1]).constructor);
  arktest.assertEQ(Uint8Array, constructor.from.call(Uint8Array, [1]).constructor);
}
