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

let target = {
  'target_one': 1
};
target[0] = 42;
target.__proto__ = {
  'target_two': 2
};
const handler = {
  has: function(target, name) {
    return name == 'present' || name == '0';
  }
}

let proxy = new Proxy(target, handler);

// Test simple cases.
arktest.assertTrue('present' in proxy);
arktest.assertFalse('nonpresent' in proxy);

// Test element cases.
arktest.assertTrue(0 in proxy);
arktest.assertFalse(1 in proxy);
arktest.assertTrue('0' in proxy);
arktest.assertFalse('1' in proxy);

const symbol0 = {
  [Symbol.toPrimitive](hint) {
    return 0;
  }
};
const symbol1 = {
  [Symbol.toPrimitive](hint) {
    return 1;
  }
};
arktest.assertTrue(symbol0 in proxy);
arktest.assertFalse(symbol1 in proxy);

// Test interesting algorithm steps:

// Step 7: Fall through to target if trap is undefined.
handler.has = undefined;
arktest.assertTrue('target_one' in proxy);
arktest.assertTrue('target_two' in proxy);
arktest.assertFalse('in_your_dreams' in proxy);

// Step 8: Result is converted to boolean.
let result = 1;
handler.has = function(t, n) { return result; }
arktest.assertTrue('foo' in proxy);
result = {};
arktest.assertTrue('foo' in proxy);
result = undefined;
arktest.assertFalse('foo' in proxy);
result = 'string';
arktest.assertTrue('foo' in proxy);

// Step 9b i. Trap result must confirm presence of non-configurable properties
// of the target.
Object.defineProperty(target, 'nonconf', {value: 1, configurable: false});
result = false;
arktest.expectThrow('\'nonconf\' in proxy', ((e: Error): boolean => e instanceof TypeError));

// Step 9b iii. Trap result must confirm presence of all own properties of
// non-extensible targets.
Object.preventExtensions(target);
arktest.expectThrow('\'nonconf\' in proxy', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('\'target_one\' in proxy', ((e: Error): boolean => e instanceof TypeError));
arktest.assertFalse('target_two' in proxy);
arktest.assertFalse('in_your_dreams' in proxy);

// Regression test for crbug.com/570120 (stray JSObject::cast).
(function TestHasPropertyFastPath() {
  let proxy = new Proxy({}, {});
  const object = Object.create(proxy);
  object.hasOwnProperty(0);
})();

(function FalseTargetPropExists() {
  const target2 = {
    attr: 1
  };
  const p = new Proxy(target2, {
    has: function(t, prop) {
      return false;
    }
  });

  arktest.assertFalse('attr' in p);
})();

(function TargetHasAccessorProperty() {
  let target = {};
  Object.defineProperty(target, 'prop', {
    get: function() {
      arktest.assertEQ(this, target);
      return 42;
    },
    configurable: true
  })
  let proxy = new Proxy(target, {
    has: function(t, prop) {
      return false;
    },
  });
  arktest.assertFalse('prop' in proxy);
})();

(function TargetHasNonConfigurableProperty() {
  let target = {};
  Object.defineProperty(target, 'prop', {
    value: 42,
    configurable: false,
    writable: true
  })
  let proxy = new Proxy(target, {
    has: function(t, prop) {
      return false;
    },
  });
  arktest.expectThrow(function() { 'prop' in proxy; }, ((e: Error): boolean => e instanceof TypeError));
})();
