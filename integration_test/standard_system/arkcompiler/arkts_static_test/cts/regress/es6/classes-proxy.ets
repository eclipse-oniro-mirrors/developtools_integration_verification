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
expected_out_1: "Semantic error ESE0371: Cannot find type 'Proxy'."
---*/

function createConstructableProxy(handler: Object): Object {
  return new Proxy(function(){}, handler);
}

(function() {
  let prototype = { x: 1 };
  let log = [];

  let proxy = createConstructableProxy({
    get(k) {
      log.push('get trap');
      return prototype;
    }});

  let o = Reflect.construct(Number, [100], proxy);
  arktest.assertEQ(['get trap'], log);
  arktest.assertTrue(Object.getPrototypeOf(o) === prototype);
  arktest.assertEQ(100, Number.prototype.valueOf.call(o));
})();

(function() {
  let prototype = { x: 1 };
  let log = [];

  let proxy = createConstructableProxy({
    get(k) {
      log.push('get trap');
      return 10;
    }});

  let o = Reflect.construct(Number, [100], proxy);
  arktest.assertEQ(['get trap'], log);
  arktest.assertTrue(Object.getPrototypeOf(o) === Number.prototype);
  arktest.assertEQ(100, Number.prototype.valueOf.call(o));
})();

(function() {
  let prototype = { x: 1 };
  let log = [];

  let proxy = createConstructableProxy({
    get(k) {
      log.push('get trap');
      return prototype;
    }});

  let o = Reflect.construct(Function, ['return 1000'], proxy);
  arktest.assertEQ(['get trap'], log);
  arktest.assertTrue(Object.getPrototypeOf(o) === prototype);
  arktest.assertEQ(1000, o());
})();

(function() {
  let prototype = { x: 1 };
  let log = [];

  let proxy = createConstructableProxy({
    get(k) {
      log.push('get trap');
      return prototype;
    }});

  let o = Reflect.construct(Array, [1, 2, 3], proxy);
  arktest.assertEQ(['get trap'], log);
  arktest.assertTrue(Object.getPrototypeOf(o) === prototype);
  arktest.assertEQ([1, 2, 3], o);
})();
