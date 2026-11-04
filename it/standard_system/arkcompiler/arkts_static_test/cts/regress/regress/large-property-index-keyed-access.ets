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


// crbug.com/1026974

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0320: Function expressions are not supported, use arrow functions instead"
---*/

(function() {
  function store(obj, key) {
    obj[key] = 10;
  }
  ArkTools.prepareFunctionForOptimization(store);
  for (let i = 0; i < 3; i++) {
    let obj = {}
    store(obj, 1152921506754330624);
  }
})();
(function() {
  function store(obj, key) {
    obj[key] = 10;
  }
  ArkTools.prepareFunctionForOptimization(store);
  for (let i = 0; i < 3; i++) {
    let obj2 = new Int32Array(0);
    store(obj2, 1152921506754330624);
    store(obj2, '1152921506754330624');
  }
})();

// crbug.com/1026729
(function() {
  let key = 0xFFFFFFFF;
  let object = {};
  arktest.assertFalse(object.hasOwnProperty(key));
  let proxy = new Proxy({}, {});
  arktest.assertFalse(proxy.hasOwnProperty(key));
})();

// crbug.com/1026909
(function() {
  function load(obj, key) {
    return obj[key];
  }
  ArkTools.prepareFunctionForOptimization(load);
  const array = new Float64Array();
  arktest.assertEQ(undefined, load(array, 'monomorphic'));
  arktest.assertEQ(undefined, load(array, '4294967296'));
})();

// crbug.com/1026856
(function() {
  let key = 0xFFFFFFFF;
  let receiver = new Int32Array();
  const value = {};
  const target = {};
  Reflect.set(target, key, value, receiver);
})();

// crbug.com/1028213
(function() {
  function load(obj, key) {
    return obj[key];
  }
  ArkTools.prepareFunctionForOptimization(load);
  let obj = function() {};
  obj.__proto__ = new Int8Array(1);
  let key = Object(4294967297);
  for (let i = 0; i < 3; i++) {
    load(obj, key);
  }
})();
(function() {
  function load(obj, key) {
    return obj[key];
  }
  ArkTools.prepareFunctionForOptimization(load);
  let obj = Object('abc');
  obj.__proto__ = new Int8Array(1);
  let key = Object(4294967297);
  for (let i = 0; i < 3; i++) {
    load(obj, key);
  }
})();

// crbug.com/1027461#c12
(function() {
  let arr = new Int32Array(2);
  Object.defineProperty(arr, 'foo', {get:function() { this.valueOf = 1; }});
  arr[9007199254740991] = 1;
  Object.values(arr);

  let obj = [1, 2, 3];
  Object.defineProperty(obj, 2, {get:function() { this.valueOf = 1; }});
  obj[9007199254740991] = 1;
  Object.values(obj);
})();

// crbug.com/1027461#c18
(function() {
  const v7 = Object(1);
  v7[4294967297] = 1;
  const vEight = Object.assign({}, v7);
})();

// crbug.com/1029369
(function () {
  let obj = {};
  function addProperty(o, k) {
    Object.defineProperty(o, k, {});
    if (!o.hasOwnProperty(k)) { throw 'Bug!'; }
  }
  addProperty(obj, '1');  // Force dictionary-mode elements.
  addProperty(obj, 4294967295);
})();

// crbug.com/1029338
(function() {
  const v11 = {};
  v11.__defineGetter__(4294967295, function () {});
  __v_12 = Object.entries(v11);
})();

// crbug.com/1031175
(function() {
  let key = 4294967295;
  let obj = {
    boom() {
      super[key]++;
    },
    bang() {
      super['4294967295']++;
    }
  }
  obj.boom();
  obj.bang();
})();
