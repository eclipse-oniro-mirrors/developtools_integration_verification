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
expected_out_1: "Syntax error ESY0320: Function expressions are not supported, use arrow functions instead"
---*/

function getStrictF() {
  'use strict';
  return function f(x) {};
}


function getSloppyF() {
  return function f(x) {};
}


function getStrictGenerator() {
  'use strict';
  return function* f(x) {};
}


function getSloppyGenerator() {
  return function* f(x) {};
}


function test(testFunction) {
  testFunction(getStrictF());
  testFunction(getSloppyF());
  testFunction(getStrictGenerator());
  testFunction(getSloppyGenerator());
}


function testDescriptor(f) {
  const descr = Object.getOwnPropertyDescriptor(f, 'length');
  arktest.assertTrue(descr.configurable);
  arktest.assertFalse(descr.enumerable);
  arktest.assertEQ(1, descr.value);
  arktest.assertFalse(descr.writable);
}
test(testDescriptor);


function testSet(f) {
  f.length = 2;
  arktest.assertEQ(1, f.length);
}
test(testSet);


function testSetStrict(f) {
  'use strict';
  arktest.expectThrow(function() {
    f.length = 2;
  }, ((e: Error): boolean => e instanceof TypeError));
}
test(testSetStrict);


function testReconfigureAsDataProperty(f) {
  Object.defineProperty(f, 'length', {
    value: 2,
  });
  arktest.assertEQ(2, f.length);
  Object.defineProperty(f, 'length', {
    writable: true
  });
  f.length = 3;
  arktest.assertEQ(3, f.length);

  f.length = 42;
  arktest.assertEQ(42, f.length);
}
test(testReconfigureAsDataProperty);


function testReconfigureAsAccessorProperty(f) {
  let length = 2;
  Object.defineProperty(f, 'length', {
    get: function() { return length; },
    set: function(v) { length = v; }
  });
  arktest.assertEQ(2, f.length);
  f.length = 3;
  arktest.assertEQ(3, f.length);
}
test(testReconfigureAsAccessorProperty);


(function testSetOnInstance() {
  // This needs to come before testDelete below
  arktest.assertTrue(Function.prototype.hasOwnProperty('length'));

  function f() {}
  delete f.length;
  arktest.assertEQ(0, f.length);

  f.length = 42;
  arktest.assertEQ(0, f.length);  // non writable prototype property.
  arktest.assertFalse(f.hasOwnProperty('length'));

  Object.defineProperty(Function.prototype, 'length', {writable: true});

  f.length = 123;
  arktest.assertTrue(f.hasOwnProperty('length'));
  arktest.assertEQ(123, f.length);
})();


(function testDelete() {
  function f(x) {}
  arktest.assertTrue(delete f.length);
  arktest.assertFalse(f.hasOwnProperty('length'));
  arktest.assertEQ(0, f.length);

  arktest.assertTrue(delete Function.prototype.length);
  arktest.assertEQ(undefined, f.length);
})();
