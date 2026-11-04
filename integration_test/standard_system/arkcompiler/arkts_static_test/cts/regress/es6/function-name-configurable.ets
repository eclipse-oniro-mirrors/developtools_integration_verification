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
  return function f() {};
}


function getSloppyF() {
  return function f() {};
}


function test(testFunction) {
  testFunction(getStrictF());
  testFunction(getSloppyF());
}


function testDescriptor(f) {
  const descr = Object.getOwnPropertyDescriptor(f, 'name');
  arktest.assertTrue(descr.configurable);
  arktest.assertFalse(descr.enumerable);
  arktest.assertEQ('f', descr.value);
  arktest.assertFalse(descr.writable);
}
test(testDescriptor);


function testSet(f) {
  f.name = 'g';
  arktest.assertEQ('f', f.name);
}
test(testSet);


function testSetStrict(f) {
  'use strict';
  arktest.expectThrow(function() {
    f.name = 'g';
  }, ((e: Error): boolean => e instanceof TypeError));
}
test(testSetStrict);


function testReconfigureAsDataProperty(f) {
  Object.defineProperty(f, 'name', {
    value: 'g',
  });
  arktest.assertEQ('g', f.name);
  Object.defineProperty(f, 'name', {
    writable: true
  });
  f.name = 'h';
  arktest.assertEQ('h', f.name);

  f.name = 42;
  arktest.assertEQ(42, f.name);
}
test(testReconfigureAsDataProperty);


function testReconfigureAsAccessorProperty(f) {
  let name = 'g';
  Object.defineProperty(f, 'name', {
    get: function() { return name; },
    set: function(v) { name = v; }
  });
  arktest.assertEQ('g', f.name);
  f.name = 'h';
  arktest.assertEQ('h', f.name);
}
test(testReconfigureAsAccessorProperty);


function testFunctionToString(f) {
  Object.defineProperty(f, 'name', {
    value: {toString: function() { arktest.assertTrue(false, 'unexpected toString call'); }},
  });
  arktest.assertEQ('function f() {}', f.toString());
}
test(testFunctionToString);


(function testSetOnInstance() {
  // This needs to come before testDelete below
  arktest.assertTrue(Function.prototype.hasOwnProperty('name'));

  function f() {}
  delete f.name;
  arktest.assertEQ('', f.name);

  f.name = 42;
  arktest.assertEQ('', f.name);  // non writable prototype property.
  arktest.assertFalse(f.hasOwnProperty('name'));

  Object.defineProperty(Function.prototype, 'name', {writable: true});

  f.name = 123;
  arktest.assertTrue(f.hasOwnProperty('name'));
  arktest.assertEQ(123, f.name);
})();


(function testDelete() {
  function f() {}
  arktest.assertTrue(delete f.name);
  arktest.assertFalse(f.hasOwnProperty('name'));
  arktest.assertEQ('', f.name);

  arktest.assertTrue(delete Function.prototype.name);
  arktest.assertEQ(undefined, f.name);
})();
