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
expected_out_1: >-
  Semantic error ESE0174: Cannot infer type for target because class composite
  needs an explicit target type
---*/

const target = {
  'target_one': 1
};
target.__proto__ = {
  'target_proto_two': 2
};
const handler = {
  ownKeys: function(target) {
    return ['foo', 'bar'];
  }
}

const proxy = new Proxy(target, handler);

// Simple case.
arktest.assertEQ(['foo', 'bar'], Reflect.ownKeys(proxy));

// Test interesting steps of the algorithm:

// Step 6: Fall through to target.[[OwnPropertyKeys]] if the trap is undefined.
handler.ownKeys = undefined;
arktest.assertEQ(['target_one'], Reflect.ownKeys(proxy));

// Step 7: Throwing traps don't crash.
handler.ownKeys = function(target) { throw 1; };
arktest.expectThrow('Reflect.ownKeys(proxy)');

// Step 8: CreateListFromArrayLike error cases:
// Returning a non-Object throws.
let keys = 1;
handler.ownKeys = function(target) { return keys; };
arktest.expectThrow('Reflect.ownKeys(proxy)', ((e: Error): boolean => e instanceof TypeError));
keys = 'string';
arktest.expectThrow('Reflect.ownKeys(proxy)', ((e: Error): boolean => e instanceof TypeError));
keys = Symbol('foo');
arktest.expectThrow('Reflect.ownKeys(proxy)', ((e: Error): boolean => e instanceof TypeError));
keys = null;
arktest.expectThrow('Reflect.ownKeys(proxy)', ((e: Error): boolean => e instanceof TypeError));

// "length" property is honored.
keys = { 0: 'a', 1: 'b', 2: 'c' };
keys.length = 0;
arktest.assertEQ([], Reflect.ownKeys(proxy));
keys.length = 1;
arktest.assertEQ(['a'], Reflect.ownKeys(proxy));
keys.length = 3;
arktest.assertEQ(['a', 'b', 'c'], Reflect.ownKeys(proxy));
// The spec wants to allow lengths up to 2^53, but we can't allocate arrays
// of that size, so we throw even for smaller values.
keys.length = Math.pow(2, 33);
arktest.expectThrow('Reflect.ownKeys(proxy)', ((e: Error): boolean => e instanceof RangeError));

// Check that we don't allow duplicated keys.
keys  = ['a', 'a', 'a']
arktest.expectThrow('Reflect.ownKeys(proxy)', ((e: Error): boolean => e instanceof TypeError));

// Non-Name results throw.
keys = [1];
arktest.expectThrow('Reflect.ownKeys(proxy)', ((e: Error): boolean => e instanceof TypeError));
keys = [{}];
arktest.expectThrow('Reflect.ownKeys(proxy)', ((e: Error): boolean => e instanceof TypeError));
keys = [{toString: function() { return 'foo'; }}];
arktest.expectThrow('Reflect.ownKeys(proxy)', ((e: Error): boolean => e instanceof TypeError));
keys = [null];
arktest.expectThrow('Reflect.ownKeys(proxy)', ((e: Error): boolean => e instanceof TypeError));

// Step 17a: The trap result must include all non-configurable keys.
Object.defineProperty(target, 'nonconf', {value: 1, configurable: false});
keys = ['foo'];
arktest.expectThrow('Reflect.ownKeys(proxy)', ((e: Error): boolean => e instanceof TypeError));
keys = ['nonconf'];
arktest.assertEQ(keys, Reflect.ownKeys(proxy));

// Check that we don't allow duplicated keys.
keys  = ['nonconf', 'nonconf', 'nonconf']
arktest.expectThrow('Reflect.ownKeys(proxy)', ((e: Error): boolean => e instanceof TypeError));

// Step 19a: The trap result must all keys of a non-extensible target.
Object.preventExtensions(target);
arktest.expectThrow('Reflect.ownKeys(proxy)', ((e: Error): boolean => e instanceof TypeError));
keys = ['nonconf', 'target_one'];
arktest.assertEQ(keys, Reflect.ownKeys(proxy));

// Step 20: The trap result must not add keys to a non-extensible target.
keys = ['nonconf', 'target_one', 'fantasy'];
arktest.expectThrow('Reflect.ownKeys(proxy)', ((e: Error): boolean => e instanceof TypeError));

// Check that we don't allow duplicated keys.
keys  = ['nonconf', 'target_one', 'nonconf', 'nonconf', 'target_one',]
arktest.expectThrow('Reflect.ownKeys(proxy)', ((e: Error): boolean => e instanceof TypeError));
