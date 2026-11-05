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
  Semantic error ESE0174: Cannot infer type for handler because class composite
  needs an explicit target type
---*/

let handler = {};
const target = {a:1};
const proxy = new Proxy(target, handler);

arktest.assertTrue(target.hasOwnProperty('a'));
arktest.assertTrue(proxy.hasOwnProperty('a'));
arktest.assertFalse(target.hasOwnProperty('b'));
arktest.assertFalse(proxy.hasOwnProperty('b'));


handler.has = function() { arktest.assertTrue(false) }
handler.getOwnPropertyDescriptor = function () {}

arktest.assertTrue(target.hasOwnProperty('a'));
arktest.assertFalse(proxy.hasOwnProperty('a'));
arktest.assertFalse(target.hasOwnProperty('b'));
arktest.assertFalse(proxy.hasOwnProperty('b'));


handler.getOwnPropertyDescriptor = function() { return {configurable: true} }

arktest.assertTrue(target.hasOwnProperty('a'));
arktest.assertTrue(proxy.hasOwnProperty('a'));
arktest.assertFalse(target.hasOwnProperty('b'));
arktest.assertTrue(proxy.hasOwnProperty('b'));


handler.getOwnPropertyDescriptor = function() { throw Error(); }

arktest.assertTrue(target.hasOwnProperty('a'));
arktest.expectThrow(function(){ proxy.hasOwnProperty('a') }, ((e: Error): boolean => e instanceof Error));
arktest.assertFalse(target.hasOwnProperty('b'));
arktest.expectThrow(function(){ proxy.hasOwnProperty('b') }, ((e: Error): boolean => e instanceof Error));
