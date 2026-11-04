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
  Float64Array];

for (let constructor of typedArrayConstructors) {

arktest.assertEQ(1, constructor.prototype.findIndex.length);

let a = new constructor([21, 22, 23, 24]);
arktest.assertEQ(-1, a.findIndex(function() { return false; }));
arktest.assertEQ(-1, a.findIndex(function(val) { return 121 === val; }));
arktest.assertEQ(0, a.findIndex(function() { return true; }));
arktest.assertEQ(1, a.findIndex(function(val) { return 22 === val; }), undefined);
arktest.assertEQ(2, a.findIndex(function(val) { return 23 === val; }), null);
arktest.assertEQ(3, a.findIndex(function(val) { return 24 === val; }));


//
// Test predicate is not called when array is empty
//
(function() {
  let a = new constructor([]);
  let l = -1;
  let o = -1;
  let v = -1;
  let k = -1;

  a.findIndex(function(val, key, obj) {
    o = obj;
    l = obj.length;
    v = val;
    k = key;

    return false;
  });

  arktest.assertEQ(-1, l);
  arktest.assertEQ(-1, o);
  arktest.assertEQ(-1, v);
  arktest.assertEQ(-1, k);
})();


//
// Test predicate is called with correct argumetns
//
(function() {
  let a = new constructor([5]);
  let l = -1;
  let o = -1;
  let v = -1;
  let k = -1;

  let index = a.findIndex(function(val, key, obj) {
    o = obj;
    l = obj.length;
    v = val;
    k = key;

    return false;
  });

  arktest.assertEQ(a, o);
  arktest.assertEQ(a.length, l);
  arktest.assertEQ(5, v);
  arktest.assertEQ(0, k);
  arktest.assertEQ(-1, index);
})();


//
// Test predicate is called array.length times
//
(function() {
  let a = new constructor([1, 2, 3, 4, 5]);
  let l = 0;

  a.findIndex(function() {
    l++;
    return false;
  });

  arktest.assertEQ(a.length, l);
})();


//
// Test array modifications
//
(function() {
  a = new constructor([1, 2, 3]);
  a.findIndex(function(val, key) { a[key] = ++val; return false; });
  arktest.assertEQ([2, 3, 4], a);
  arktest.assertEQ(3, a.length);
})();


//
// Test thisArg
//
(function() {
  // Test String as a thisArg
  let index = new constructor([1, 2, 3]).findIndex(function(val, key) {
    return this.charAt(Number(key)) === String(val);
  }, '321');
  arktest.assertEQ(1, index);

  // Test object as a thisArg
  const thisArg = {
    elementAt: function(key) {
      return this[key];
    }
  };
  Array.prototype.push.apply(thisArg, [3, 2, 1]);

  index = new constructor([1, 2, 3]).findIndex(function(val, key) {
    return this.elementAt(key) === val;
  }, thisArg);
  arktest.assertEQ(1, index);

  // Create a new object in each function call when receiver is a
  // primitive value. See ECMA-262, Annex C(The Strict Mode of ECMAScript).
  // The value passed to push() function through this in strict mode
  // will not be cast into an object.
  a = [];
  new constructor([1, 2]).findIndex(function() { a.push(this) }, '');
  arktest.assertFalse(a[0] !== a[1]);

  // Do not create a new object otherwise.
  a = [];
  new constructor([1, 2]).findIndex(function() { a.push(this) }, {});
  arktest.assertEQ(a[0], a[1]);

  // In strict mode primitive values should not be coerced to an object.
  a = [];
  new constructor([1, 2]).findIndex(function() { 'use strict'; a.push(this); }, '');
  arktest.assertEQ('', a[0]);
  arktest.assertEQ(a[0], a[1]);

})();

// Test exceptions
arktest.expectThrow('constructor.prototype.findIndex.call(null, function() { })',
  TypeError);
arktest.expectThrow('constructor.prototype.findIndex.call(undefined, function() { })',
  TypeError);
arktest.expectThrow('constructor.prototype.findIndex.apply(null, function() { }, [])',
  TypeError);
arktest.expectThrow('constructor.prototype.findIndex.apply(undefined, function() { }, [])',
  TypeError);
arktest.expectThrow('constructor.prototype.findIndex.apply([], function() { }, [])',
  TypeError);
arktest.expectThrow('constructor.prototype.findIndex.apply({}, function() { }, [])',
  TypeError);
arktest.expectThrow('constructor.prototype.findIndex.apply("", function() { }, [])',
  TypeError);

arktest.expectThrow('new constructor([]).findIndex(null)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('new constructor([]).findIndex(undefined)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('new constructor([]).findIndex(0)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('new constructor([]).findIndex(true)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('new constructor([]).findIndex(false)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('new constructor([]).findIndex("")', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('new constructor([]).findIndex({})', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('new constructor([]).findIndex([])', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('new constructor([]).findIndex(/\d+/)', ((e: Error): boolean => e instanceof TypeError));

// Shadowing length doesn't affect findIndex, unlike Array.prototype.findIndex
a = new constructor([1, 2]);
Object.defineProperty(a, 'length', {value: 1});
let x = 0;
arktest.assertEQ(a.findIndex(function(elt) { x += elt; return false; }), -1);
arktest.assertEQ(x, 3);
arktest.assertEQ(Array.prototype.findIndex.call(a,
    function(elt) { x += elt; return false; }), -1);
arktest.assertEQ(x, 4);

// Detached Operation
  const tmp = {
    [Symbol.toPrimitive]() {
      arktest.assertTrue(false, 'Parameter should not be processed when ' +
                        'array.[[ViewedArrayBuffer]] is detached.');
      return 0;
    }
  };
  const array = new constructor([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
  ArkTools.arrayBufferDetach(array.buffer);
  arktest.expectThrow(() => array.findIndex(tmp), ((e: Error): boolean => e instanceof TypeError));
}
