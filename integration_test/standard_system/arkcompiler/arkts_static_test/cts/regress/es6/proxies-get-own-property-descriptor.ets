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

const target = {};
const configurableDesc = {
  value: 123,
  configurable: true,
  writable: true,
  enumerable: false,
};
Object.defineProperty(target, 'configurable', configurableDesc);
const nonconfigurableDesc = {
  value: 234,
  configurable: false,
  writable: false,
  enumerable: true
}
Object.defineProperty(target, 'nonconfigurable', nonconfigurableDesc);

const proxiedDesc = {
  value: 345,
  configurable: true
};

const handler = {
  'getOwnPropertyDescriptor': function(target, name) {
    if (name === 'proxied') {
      return proxiedDesc;
    }
    if (name === 'return_null') {
      return null;
    }
    return Object.getOwnPropertyDescriptor(target, name);
  }
};

const proxy = new Proxy(target, handler);
const proxyWithoutHandler = new Proxy(target, {});

// Checking basic functionality:

arktest.assertEQ(configurableDesc,
             Object.getOwnPropertyDescriptor(proxy, 'configurable'));
arktest.assertEQ(nonconfigurableDesc,
             Object.getOwnPropertyDescriptor(proxy, 'nonconfigurable'));
arktest.assertEQ({ value: proxiedDesc.value,
               configurable: proxiedDesc.configurable,
               enumerable: false,
               writable: false },
             Object.getOwnPropertyDescriptor(proxy, 'proxied'));
arktest.assertEQ(configurableDesc,
             Object.getOwnPropertyDescriptor(proxyWithoutHandler,
                                             'configurable'));
arktest.assertEQ(nonconfigurableDesc,
             Object.getOwnPropertyDescriptor(proxyWithoutHandler,
                                             'nonconfigurable'));

arktest.expectThrow('Object.getOwnPropertyDescriptor(proxy, "return_null")');

handler.getOwnPropertyDescriptor = undefined;
arktest.assertEQ(configurableDesc,
             Object.getOwnPropertyDescriptor(proxy, 'configurable'));

// Checking invariants mentioned explicitly by the ES spec:

// (Inv-1) "A property cannot be reported as non-existent, if it exists as a
// non-configurable own property of the target object."
handler.getOwnPropertyDescriptor = function(target, name) { return undefined; };
arktest.expectThrow('Object.getOwnPropertyDescriptor(proxy, "nonconfigurable")');
arktest.assertEQ(undefined, Object.getOwnPropertyDescriptor(proxy, 'configurable'));

// (Inv-2) "A property cannot be reported as non-configurable, if it does not
// exist as an own property of the target object or if it exists as a
// configurable own property of the target object."
handler.getOwnPropertyDescriptor = function(target, name) {
  return {value: 234, configurable: false, enumerable: true};
};
arktest.expectThrow('Object.getOwnPropertyDescriptor(proxy, "nonexistent")');
arktest.expectThrow('Object.getOwnPropertyDescriptor(proxy, "configurable")');
arktest.assertEQ(
    false,
    Object.getOwnPropertyDescriptor(proxy, 'nonconfigurable').configurable);

// (Inv-3) "A property cannot be reported as non-existent, if it exists as an
// own property of the target object and the target object is not extensible."
Object.seal(target);
handler.getOwnPropertyDescriptor = function(target, name) { return undefined; };
arktest.expectThrow('Object.getOwnPropertyDescriptor(proxy, "configurable")');
arktest.expectThrow('Object.getOwnPropertyDescriptor(proxy, "nonconfigurable")');
arktest.assertEQ(undefined, Object.getOwnPropertyDescriptor(proxy, 'nonexistent'));

// (Inv-4) "A property cannot be reported as existent, if it does not exist as
// an own property of the target object and the target object is not
// extensible."
const existentDesc = {value: 'yes', writable: true};
handler.getOwnPropertyDescriptor = function() { return existentDesc; };
arktest.expectThrow('Object.getOwnPropertyDescriptor(proxy, "nonexistent")');
arktest.assertEQ(
    {value: 'yes', writable: true, enumerable: false, configurable: false},
    Object.getOwnPropertyDescriptor(proxy, 'configurable'));

// Checking individual bailout points in the implementation:

// Step 6: Trap is not callable.
handler.getOwnPropertyDescriptor = {};
arktest.expectThrow('Object.getOwnPropertyDescriptor(proxy, "configurable")');

// Step 8: Trap throws.
handler.getOwnPropertyDescriptor = function() { throw 'ball'; };
arktest.expectThrow('Object.getOwnPropertyDescriptor(proxy, "configurable")');

// Step 9: Trap result is neither undefined nor an object.
handler.getOwnPropertyDescriptor = function() { return 1; }
arktest.expectThrow('Object.getOwnPropertyDescriptor(proxy, "configurable")');

// Step 11b: See (Inv-1) above.
// Step 11e: See (Inv-3) above.

// Step 16: Incompatible PropertyDescriptor; a non-configurable property
// cannot be reported as configurable. (Inv-4) above checks more cases.
handler.getOwnPropertyDescriptor = function(target, name) {
  return {value: 456, configurable: true, writable: true}
};
arktest.expectThrow('Object.getOwnPropertyDescriptor(proxy, "nonconfigurable")');

// Step 17: See (Inv-2) above.
