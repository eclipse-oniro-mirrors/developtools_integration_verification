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

// Tests the Reflect.preventExtensions method - ES6 26.1.12.
// This is adapted from object-prevent-extensions.js.


/*---
tags: [compile-only, negative]
expected_out_1: >-
  "Semantic error ESE0174: Cannot infer type for obj1 because class composite needs an explicit target type"
---*/

const obj1 = {};
// Extensible defaults to true.
arktest.assertTrue(Object.isExtensible(obj1));
arktest.assertTrue(Reflect.preventExtensions(obj1));

// Make sure the is_extensible flag is set.
arktest.assertFalse(Object.isExtensible(obj1));
obj1.x = 42;
arktest.assertEQ(undefined, obj1.x);

// Try adding a new element.
obj1[1] = 42;
arktest.assertEQ(undefined, obj1[1]);


// Try when the object has an existing property.
let obj2 = {};
arktest.assertTrue(Object.isExtensible(obj2));
obj2.x = 42;
arktest.assertEQ(42, obj2.x);
arktest.assertTrue(Object.isExtensible(obj2));

arktest.assertTrue(Reflect.preventExtensions(obj2));
arktest.assertEQ(42, obj2.x);

obj2.y = 42;
// obj2.y should still be undefined.
arktest.assertEQ(undefined, obj2.y);
// Make sure we can still write values to obj.x.
obj2.x = 43;
arktest.assertEQ(43, obj2.x)

obj2.y = new function() { return 42; };
// obj2.y should still be undefined.
arktest.assertEQ(undefined, obj2.y);
arktest.assertEQ(43, obj2.x)

try {
  Object.defineProperty(obj2, 'y', {value: 42});
} catch (e) {
  arktest.assertTrue(/object is not extensible/.test(e));
}

// obj2.y should still be undefined.
arktest.assertEQ(undefined, obj2.y);
arktest.assertEQ(43, obj2.x);

obj2[1] = 42;
arktest.assertEQ(undefined, obj2[1]);

const arr = [];
arr[1] = 10;

arktest.assertTrue(Reflect.preventExtensions(arr));

arr[2] = 42;
arktest.assertEQ(10, arr[1]);

// We should still be able to change existing elements.
arr[1]= 42;
arktest.assertEQ(42, arr[1]);


// Test the the extensible flag is not inherited.
const parent = {};
parent.x = 42;
arktest.assertTrue(Reflect.preventExtensions(parent));

const child = Object.create(parent);

// We should be able to add new properties to the child object.
child.y = 42;

// This should have no influence on the parent class.
parent.y = 29;


// Test that attributes on functions are also handled correctly.
function foo() {
  return 42;
}

arktest.assertTrue(Reflect.preventExtensions(foo));

foo.x = 29;
arktest.assertEQ(undefined, foo.x);

// when Object.isExtensible(o) === false
// assignment should return right hand side value
let o = {};
arktest.assertTrue(Reflect.preventExtensions(o));
const v = o.v = 50;
arktest.assertEQ(undefined, o.v);
arktest.assertEQ(50, v);

// test same behavior as above, but for integer properties
const n = o[0] = 100;
arktest.assertEQ(undefined, o[0]);
arktest.assertEQ(100, n);

// Fast properties should remain fast
obj = { x: 42, y: 'foo' };
arktest.assertTrue(ArkTools.hasFastProperties(obj));
arktest.assertTrue(Reflect.preventExtensions(obj));
arktest.assertFalse(Object.isExtensible(obj));
arktest.assertFalse(Object.isSealed(obj));
arktest.assertTrue(ArkTools.hasFastProperties(obj));

// Non-extensible objects should share maps where possible
obj = { prop1: 1, prop2: 2 };
obj2 = { prop1: 3, prop2: 4 };
arktest.assertTrue(ArkTools.haveSameMap(obj, obj2));
arktest.assertTrue(Reflect.preventExtensions(obj));
arktest.assertTrue(Reflect.preventExtensions(obj2));
arktest.assertFalse(Object.isExtensible(obj));
arktest.assertFalse(Object.isExtensible(obj2));
arktest.assertFalse(Object.isSealed(obj));
arktest.assertFalse(Object.isSealed(obj2));
arktest.assertTrue(ArkTools.haveSameMap(obj, obj2));

// Non-extensible objects should share maps even when they have elements
obj = { prop1: 1, prop2: 2, 75: 'foo' };
obj2 = { prop1: 3, prop2: 4, 150: 'bar' };
arktest.assertTrue(ArkTools.haveSameMap(obj, obj2));
arktest.assertTrue(Reflect.preventExtensions(obj));
arktest.assertTrue(Reflect.preventExtensions(obj2));
arktest.assertFalse(Object.isExtensible(obj));
arktest.assertFalse(Object.isExtensible(obj2));
arktest.assertFalse(Object.isSealed(obj));
arktest.assertFalse(Object.isSealed(obj2));
arktest.assertTrue(ArkTools.haveSameMap(obj, obj2));
