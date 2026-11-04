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

(function testNonConstructorStrict() {
  'use strict';
  arktest.expectThrow(function() {
    return new Math.cos(...[1,2,3]);
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(function() {
    let callNull = null;
    return new callNull(...[1,2,3]);
  }, ((e: Error): boolean => e instanceof TypeError));
})();


(function testNonConstructorSloppy() {
  arktest.expectThrow(function() {
    return new Math.cos(...[1,2,3]);
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(function() {
    let callNull = null;
    return new callNull(...[1,2,3]);
  }, ((e: Error): boolean => e instanceof TypeError));
})();


(function testConstructStrict() {
  'use strict';
  function TestClass(a, b, c) {
    this.wasCalled = true;
    this.args = [a, b, c];
  }
  TestClass.prototype.method = function() {
    return this.args;
  }

  arktest.assertTrue(new TestClass(...[1, 2, 3]) instanceof TestClass);
  arktest.assertEQ([1, 2, 3], (new TestClass(...[1, 2, 3])).method());
  arktest.assertEQ([1, 2, 3], (new TestClass(...[1, 2, 3])).args);
  arktest.assertTrue((new TestClass(...[1, 2, 3])).wasCalled);
})();


(function testConstructSloppy() {
  function TestClass(a, b, c) {
    this.wasCalled = true;
    this.args = [a, b, c];
  }
  TestClass.prototype.method = function() {
    return this.args;
  }

  arktest.assertTrue(new TestClass(...[1, 2, 3]) instanceof TestClass);
  arktest.assertEQ([1, 2, 3], (new TestClass(...[1, 2, 3])).method());
  arktest.assertEQ([1, 2, 3], (new TestClass(...[1, 2, 3])).args);
  arktest.assertTrue((new TestClass(...[1, 2, 3])).wasCalled);
})();
