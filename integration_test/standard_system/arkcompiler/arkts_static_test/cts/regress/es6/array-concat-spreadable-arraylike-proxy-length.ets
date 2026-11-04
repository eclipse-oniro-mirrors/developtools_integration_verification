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

// Note: concat does not currently support species so there is no difference
// between [].concat(foo) and Array.prototype.concat.apply(foo).

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0320: Function expressions are not supported, use arrow functions instead"
---*/

let getTrap = function(t, key) {
  if (key === 'length') {
    return {[Symbol.toPrimitive]() {return 3}};
  }
  if (key === '2') {
    return 'baz';
  }
  if (key === '3') {
    return 'bar';
  }
};
let target = [];
let obj = new Proxy(target, {get: getTrap, has: () => true});

arktest.assertEQ([undefined, undefined, 'baz'], [].concat(obj));
arktest.assertEQ([undefined, undefined, 'baz'], Array.prototype.concat.apply(obj))

(() => {
let getTrap = function(t, key) {
  if (key === 'length') {
    return Symbol();
  }
  if (key === '2') {
    return 'baz';
  }
  if (key === '3') { return 'bar'; }
};
let target = [];
let obj = new Proxy(target, {get: getTrap, has: () => true});

arktest.expectThrow(() => [].concat(obj), ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(() => Array.prototype.concat.apply(obj), ((e: Error): boolean => e instanceof TypeError));
})();
