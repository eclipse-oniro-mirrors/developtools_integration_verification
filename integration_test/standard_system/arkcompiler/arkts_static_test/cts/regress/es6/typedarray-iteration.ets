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

// Tests for standard TypedArray array iteration functions.


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

function assertArrayLikeEquals(expected, value, type) {
  arktest.assertEQ(value.__proto__, type.prototype);
  arktest.assertEQ(expected.length, value.length);
  for (let i = 0; i < value.length; ++i) {
    arktest.assertEQ(expected[i], value[i]);
  }
}

for (let constructor of typedArrayConstructors) {
  (function TypedArrayFilterTest() {
    // Simple use.
    let a = new constructor([0, 1]);
    assertArrayLikeEquals([0], a.filter(function(n) { return n == 0; }),
                          constructor);
    assertArrayLikeEquals([0, 1], a, constructor);

    // Use specified object as this object when calling the function.
    let o = { value: 42 }
    a = new constructor([1, 42, 3, 42, 4]);
    assertArrayLikeEquals([42, 42], a.filter(function(n) {
      return this.value == n
    }, o), constructor);

    // Modify original array.
    a = new constructor([1, 42, 3, 42, 4]);
    assertArrayLikeEquals([42, 42], a.filter(function(n, index, array) {
      array[index] = 43; return 42 == n;
    }), constructor);
    assertArrayLikeEquals([43, 43, 43, 43, 43], a, constructor);

    // Create a new object in each function call when receiver is a
    // primitive value. See ECMA-262, Annex C(The Strict Mode of ECMAScript).
    // Openharmony only support strict mode.
    // The value passed to push() function through this in strict mode
    // will not be cast into an object.
    a = [];
    new constructor([1, 2]).filter(function() { a.push(this) }, '');
    arktest.assertFalse(a[0] !== a[1]);

    // Do not create a new object otherwise.
    a = [];
    new constructor([1, 2]).filter(function() { a.push(this) }, {});
    arktest.assertEQ(a[0], a[1]);

    // In strict mode primitive values should not be coerced to an object.
    a = [];
    new constructor([1, 2]).filter(function() {
      'use strict';
      a.push(this);
    }, '');
    arktest.assertEQ('', a[0]);
    arktest.assertEQ(a[0], a[1]);

    // Calling this method on other types is a TypeError
    arktest.expectThrow(function() {
      constructor.prototype.filter.call([], function() {});
    }, ((e: Error): boolean => e instanceof TypeError));

    // Shadowing the length property doesn't change anything
    a = new constructor([1, 2]);
    Object.defineProperty(a, 'length', { value: 1 });
    assertArrayLikeEquals([2], a.filter(function(elt) {
      return elt == 2;
    }), constructor);

    // Detached Operation
    let array = new constructor([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
    ArkTools.arrayBufferDetach(array.buffer);
    arktest.expectThrow(() => array.filter(() => false), ((e: Error): boolean => e instanceof TypeError));
  })();

  (function TypedArrayMapTest() {
    let a = new constructor([0, 1, 2, 3, 4]);

    // Simple use.
    let result = [1, 2, 3, 4, 5];
    assertArrayLikeEquals(result, a.map(function(n) { return n + 1; }),
                          constructor);
    arktest.assertEQ(a, a);

    // Use specified object as this object when calling the function.
    let o = { delta: 42 }
    result = [42, 43, 44, 45, 46];
    assertArrayLikeEquals(result, a.map(function(n) {
      return this.delta + n;
    }, o), constructor);

    // Modify original array.
    a = new constructor([0, 1, 2, 3, 4]);
    result = [1, 2, 3, 4, 5];
    assertArrayLikeEquals(result, a.map(function(n, index, array) {
      array[index] = n + 1;
      return n + 1;
    }), constructor);
    assertArrayLikeEquals(result, a, constructor);

    // Create a new object in each function call when receiver is a
    // primitive value. See ECMA-262, Annex C(The Strict Mode of ECMAScript).
    // Openharmony only support strict mode.
    // The value passed to push() function through this in strict mode
    // will not be cast into an object.
    a = [];
    new constructor([1, 2]).map(function() { a.push(this) }, '');
    arktest.assertFalse(a[0] !== a[1]);

    // Do not create a new object otherwise.
    a = [];
    new constructor([1, 2]).map(function() { a.push(this) }, {});
    arktest.assertEQ(a[0], a[1]);

    // In strict mode primitive values should not be coerced to an object.
    a = [];
    new constructor([1, 2]).map(function() { 'use strict'; a.push(this); }, '');
    arktest.assertEQ('', a[0]);
    arktest.assertEQ(a[0], a[1]);

    // Test that the result is converted to the right type
    assertArrayLikeEquals([3, 3], new constructor([1, 2]).map(function() {
      return '3';
    }), constructor);
    if (constructor !== Float32Array && constructor !== Float64Array) {
      assertArrayLikeEquals([0, 0], new constructor([1, 2]).map(function() {
        return NaN;
      }), constructor);
    }

    // Detached Operation
    let array = new constructor([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
    ArkTools.arrayBufferDetach(array.buffer);
    arktest.expectThrow(() => array.map((v) => v), ((e: Error): boolean => e instanceof TypeError));
  })();

  //
  // ArkTools.typedArray%.prototype.some
  //
  (function TypedArraySomeTest() {
    let a = new constructor([0, 1, 2, 3, 4]);

    // Simple use.
    arktest.assertTrue(a.some(function(n) { return n == 3}));
    arktest.assertFalse(a.some(function(n) { return n == 5}));

    // Use specified object as this object when calling the function.
    let o = { element: 42 };
    a = new constructor([1, 42, 3]);
    arktest.assertTrue(a.some(function(n) { return this.element == n; }, o));
    a = new constructor([1]);
    arktest.assertFalse(a.some(function(n) { return this.element == n; }, o));

    // Modify original array.
    a = new constructor([0, 1, 2, 3]);
    arktest.assertTrue(a.some(function(n, index, array) {
      array[index] = n + 1;
      return n == 2;
    }));
    assertArrayLikeEquals([1, 2, 3, 3], a, constructor);

    // Create a new object in each function call when receiver is a
    // primitive value. See ECMA-262, Annex C(The Strict Mode of ECMAScript).
    // Openharmony only support strict mode.
    // The value passed to push() function through this in strict mode
    // will not be cast into an object.
    a = [];
    new constructor([1, 2]).some(function() { a.push(this) }, '');
    arktest.assertFalse(a[0] !== a[1]);

    // Do not create a new object otherwise.
    a = [];
    new constructor([1, 2]).some(function() { a.push(this) }, {});
    arktest.assertEQ(a[0], a[1]);

    // In strict mode primitive values should not be coerced to an object.
    a = [];
    new constructor([1, 2]).some(function() {
      'use strict';
      a.push(this);
    }, '');
    arktest.assertEQ('', a[0]);
    arktest.assertEQ(a[0], a[1]);

    // Calling this method on other types is a TypeError
    arktest.expectThrow(function() {
      constructor.prototype.some.call([], function() {});
    }, ((e: Error): boolean => e instanceof TypeError));

    // Shadowing the length property doesn't change anything
    a = new constructor([1, 2]);
    Object.defineProperty(a, 'length', { value: 1 });
    arktest.assertEQ(true, a.some(function(elt) { return elt == 2; }));
    arktest.assertEQ(false, Array.prototype.some.call(a, function(elt) {
      return elt == 2;
    }));

    // Detached Operation
    let array = new constructor([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
    ArkTools.arrayBufferDetach(array.buffer);
    arktest.expectThrow(() => array.some((v) => false), ((e: Error): boolean => e instanceof TypeError));
  })();

}
