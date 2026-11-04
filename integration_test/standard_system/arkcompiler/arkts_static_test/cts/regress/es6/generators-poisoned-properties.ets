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

(function testRestrictedPropertiesStrict() {
  function* generator() { 'use strict'; }
  arktest.assertFalse(generator.hasOwnProperty('arguments'));
  arktest.expectThrow(function() { return generator.arguments; }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { return generator.arguments = {}; }, ((e: Error): boolean => e instanceof TypeError));

  arktest.assertFalse(generator.hasOwnProperty('caller'));
  arktest.expectThrow(function() { return generator.caller; }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { return generator.caller = {}; }, ((e: Error): boolean => e instanceof TypeError));
})();


(function testRestrictedPropertiesSloppy() {
  function* generator() {}
  arktest.assertFalse(generator.hasOwnProperty('arguments'));
  arktest.expectThrow(function() { return generator.arguments; }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { return generator.arguments = {}; }, ((e: Error): boolean => e instanceof TypeError));

  arktest.assertFalse(generator.hasOwnProperty('caller'));
  arktest.expectThrow(function() { return generator.caller; }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { return generator.caller = {}; }, ((e: Error): boolean => e instanceof TypeError));
})();

function assertIteratorResult(value, done, result) {
  arktest.assertEQ({value: value, done: done}, result);
}


(function testIteratorResultStrict() {
  function* generator() { 'use strict'; }
  assertIteratorResult(undefined, true, generator().next());
})();


(function testIteratorResultSloppy() {
  function* generator() {}
  assertIteratorResult(undefined, true, generator().next());
})();
