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

// This is adapted from mjsunit/object-get-own-property-names.js.


// Check simple cases.

/*---
tags: [compile-only, negative]
expected_out_1: >-
  "Semantic error ESE0174: Cannot infer type for obj because class composite needs an explicit target type"
---*/

let obj = { a: 1, b: 2};
let keys = Reflect.ownKeys(obj);
arktest.assertEQ(2, keys.length);
arktest.assertEQ('a', keys[0]);
arktest.assertEQ('b', keys[1]);

let obj = { a: function(){}, b: function(){} };
let keys = Reflect.ownKeys(obj);
arktest.assertEQ(2, keys.length);
arktest.assertEQ('a', keys[0]);
arktest.assertEQ('b', keys[1]);

// Check slow case
let obj = { a: 1, b: 2, c: 3 };
delete obj.b;
let keys = Reflect.ownKeys(obj)
arktest.assertEQ(2, keys.length);
arktest.assertEQ('a', keys[0]);
arktest.assertEQ('c', keys[1]);

// Check that non-enumerable properties are being returned.
let keys = Reflect.ownKeys([1, 2]);
arktest.assertEQ(3, keys.length);
arktest.assertEQ('0', keys[0]);
arktest.assertEQ('1', keys[1]);
arktest.assertEQ('string', typeof keys[0]);
arktest.assertEQ('string', typeof keys[1]);
arktest.assertEQ('length', keys[2]);

// Check that no proto properties are returned.
let obj = { foo: 'foo' };
obj.__proto__ = { bar: 'bar' };
keys = Reflect.ownKeys(obj);
arktest.assertEQ(1, keys.length);
arktest.assertEQ('foo', keys[0]);

// Check that getter properties are returned.
let obj = {};
obj.__defineGetter__('getter', function() {});
keys = Reflect.ownKeys(obj);
arktest.assertEQ(1, keys.length);
arktest.assertEQ('getter', keys[0]);

// Check that implementation does not access Array.prototype.
let savedConcat = Array.prototype.concat;
Array.prototype.concat = function() { return []; }
keys = Reflect.ownKeys({0: 'foo', bar: 'baz'});
arktest.assertEQ(2, keys.length);
arktest.assertEQ('0', keys[0]);
arktest.assertEQ('bar', keys[1]);
arktest.assertEQ(Array.prototype, keys.__proto__);
Array.prototype.concat = savedConcat;

arktest.expectThrow(function() { Reflect.ownKeys(4) }, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() { Reflect.ownKeys('foo') }, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() { Reflect.ownKeys(true) }, ((e: Error): boolean => e instanceof TypeError));

arktest.assertEQ(Reflect.ownKeys(Object(4)), []);
arktest.assertEQ(Reflect.ownKeys(Object('foo')), ['0', '1', '2', 'length']);
arktest.assertEQ(Reflect.ownKeys(Object(true)), []);
