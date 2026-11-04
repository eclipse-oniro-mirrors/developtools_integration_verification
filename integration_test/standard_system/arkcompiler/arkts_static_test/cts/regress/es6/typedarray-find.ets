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

arktest.assertEQ(1, constructor.prototype.find.length);

let a = new constructor([21, 22, 23, 24]);
arktest.assertEQ(undefined, a.find(function() { return false; }));
arktest.assertEQ(21, a.find(function() { return true; }));
arktest.assertEQ(undefined, a.find(function(val) { return 121 === val; }));
arktest.assertEQ(24, a.find(function(val) { return 24 === val; }));
arktest.assertEQ(23, a.find(function(val) { return 23 === val; }), null);
arktest.assertEQ(22, a.find(function(val) { return 22 === val; }), undefined);


//
// Test predicate is not called when array is empty
//
(function() {
  let a = new constructor([]);
  let l = -1;
  let o = -1;
  let v = -1;
  let k = -1;

  a.find(function(val, key, obj) {
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
// Test predicate is called with correct arguments
//
(function() {
  let a = new constructor([5]);
  let l = -1;
  let o = -1;
  let v = -1;
  let k = -1;

  let found = a.find(function(val, key, obj) {
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
  arktest.assertEQ(undefined, found);
})();


//
// Test predicate is called array.length times
//
(function() {
  let a = new constructor([1, 2, 3, 4, 5]);
  let l = 0;
  let found = a.find(function() {
    l++;
    return false;
  });

  arktest.assertEQ(a.length, l);
  arktest.assertEQ(undefined, found);
})();


//
// Test array modifications
//
(function() {
  a = new constructor([1, 2, 3]);
  let found = a.find(function(val, key) { a[key] = ++val; return false; });
  arktest.assertEQ([2, 3, 4], a);
  arktest.assertEQ(3, a.length);
  arktest.assertEQ(undefined, found);
})();

//
// Test thisArg
//
(function() {
  // Test String as a thisArg
  let found = new constructor([1, 2, 3]).find(function(val, key) {
    return this.charAt(Number(key)) === String(val);
  }, '321');
  arktest.assertEQ(2, found);

  // Test object as a thisArg
  const thisArg = {
    elementAt: function(key) {
      return this[key];
    }
  };
  Array.prototype.push.apply(thisArg, [3, 2, 1]);

  found = new constructor([1, 2, 3]).find(function(val, key) {
    return this.elementAt(key) === val;
  }, thisArg);
  arktest.assertEQ(2, found);

  // Create a new object in each function call when receiver is a
  // primitive value. See ECMA-262, Annex C(The Strict Mode of ECMAScript).
  // Openharmony only support strict mode.
  // The value passed to push() function through this in strict mode
  // will not be cast into an object.
  a = [];
  new constructor([1, 2]).find(function() { a.push(this) }, '');
  arktest.assertFalse(a[0] !== a[1]);

  // Do not create a new object otherwise.
  a = [];
  new constructor([1, 2]).find(function() { a.push(this) }, {});
  arktest.assertEQ(a[0], a[1]);

  // In strict mode primitive values should not be coerced to an object.
  a = [];
  new constructor([1, 2]).find(function() { 'use strict'; a.push(this); }, '');
  arktest.assertEQ('', a[0]);
  arktest.assertEQ(a[0], a[1]);

})();

// Test exceptions
arktest.expectThrow('constructor.prototype.find.call(null, function() { })',
  TypeError);
arktest.expectThrow('constructor.prototype.find.call(undefined, function() { })',
  TypeError);
arktest.expectThrow('constructor.prototype.find.apply(null, function() { }, [])',
  TypeError);
arktest.expectThrow('constructor.prototype.find.apply(undefined, function() { }, [])',
  TypeError);
arktest.expectThrow('constructor.prototype.find.apply([], function() { }, [])',
  TypeError);
arktest.expectThrow('constructor.prototype.find.apply({}, function() { }, [])',
  TypeError);
arktest.expectThrow('constructor.prototype.find.apply("", function() { }, [])',
  TypeError);

arktest.expectThrow('new constructor([]).find(null)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('new constructor([]).find(undefined)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('new constructor([]).find(0)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('new constructor([]).find(true)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('new constructor([]).find(false)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('new constructor([]).find("")', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('new constructor([]).find({})', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('new constructor([]).find([])', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('new constructor([]).find(/\d+/)', ((e: Error): boolean => e instanceof TypeError));

// Shadowing length doesn't affect find, unlike Array.prototype.find
a = new constructor([1, 2]);
Object.defineProperty(a, 'length', {value: 1});
let x = 0;
arktest.assertEQ(a.find(function(elt) { x += elt; return false; }), undefined);
arktest.assertEQ(x, 3);
arktest.assertEQ(Array.prototype.find.call(a,
    function(elt) { x += elt; return false; }), undefined);
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

arktest.expectThrow(() => array.find(tmp), ((e: Error): boolean => e instanceof TypeError));
}
