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

// Check basic call to trap.

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0105: Variable must be initialized or it's type must be declared."
---*/

let gTarget;
let gName;
let gDesc;
const handler = {
  defineProperty: function(target, name, desc) {
    gTarget = target;
    gName = name;
    gDesc = desc;
    return true;
  }
}
let target = {}
let proxy = new Proxy(target, handler);
let desc = { value: 1, writable: true, configurable: true, enumerable: true };
Object.defineProperty(proxy, 'foo', desc);
arktest.assertEQ(target, gTarget);
arktest.assertEQ('foo', gName);
arktest.assertEQ(desc, gDesc);

// Check specific steps in the spec

// Step 4: revoked handler
const pair = Proxy.revocable(target, handler);
Object.defineProperty(proxy, 'foo2', desc);
arktest.assertEQ(target, gTarget);
arktest.assertEQ('foo2', gName);
arktest.assertEQ(desc, gDesc);
pair.revoke();
arktest.expectThrow('Object.defineProperty(pair.proxy, "bar", desc);', ((e: Error): boolean => e instanceof TypeError));

// Step 6: Trap isn't callable.
handler.defineProperty = 1;
arktest.expectThrow('Object.defineProperty(proxy, \'foo\', {value: 2})', ((e: Error): boolean => e instanceof TypeError));

// Step 7: Trap is undefined.
handler.defineProperty = undefined;
Object.defineProperty(proxy, 'prop1', desc);
arktest.assertEQ(desc, Object.getOwnPropertyDescriptor(target, 'prop1'));
const target2 = {};
const proxy2 = new Proxy(target2, {});
Object.defineProperty(proxy2, 'prop2', desc);
arktest.assertEQ(desc, Object.getOwnPropertyDescriptor(target2, 'prop2'));

// Step 9: Property name is passed to the trap as a string.
handler.defineProperty = function(t, name, d) { gName = name; return true; };
Object.defineProperty(proxy, 0, desc);
arktest.assertTrue(typeof gName === 'string');
arktest.assertEQ('0', gName);

// Step 10: Trap returns false.
handler.defineProperty = function(t, n, d) { return false; }
arktest.expectThrow('Object.defineProperty(proxy, \'foo\', desc)', ((e: Error): boolean => e instanceof TypeError));

// Step 15a: Trap returns true for adding a property to a non-extensible target.
handler.defineProperty = function(t, n, d) { return true; }
Object.preventExtensions(target);
arktest.expectThrow('Object.defineProperty(proxy, \'foo\', desc)', ((e: Error): boolean => e instanceof TypeError));

// Step 15b: Trap returns true for adding a non-configurable property.
target = {};
proxy = new Proxy(target, handler);
desc = {value: 1, writable: true, configurable: false, enumerable: true};
arktest.expectThrow('Object.defineProperty(proxy, \'foo\', desc)', ((e: Error): boolean => e instanceof TypeError));
// No exception is thrown if a non-configurable property exists on the target.
Object.defineProperty(target, 'nonconf',
                      {value: 1, writable: true, configurable: false});
Object.defineProperty(proxy, 'nonconf', {value: 2, configurable: false});

// Step 16a: Trap returns true for non-compatible property descriptor.
Object.defineProperty(target, 'foo',
                      {value: 1, writable: false, configurable: false});
arktest.expectThrow('Object.defineProperty(proxy, \'foo\', {value: 2})', ((e: Error): boolean => e instanceof TypeError));

// Step 16b: Trap returns true for overwriting a configurable property
// with a non-configurable descriptor.
target.bar = 'baz';
arktest.expectThrow('Object.defineProperty(proxy, \'bar\', {configurable: false})',
             TypeError);
