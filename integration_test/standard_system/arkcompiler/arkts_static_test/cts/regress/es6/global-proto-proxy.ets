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
expected_out_1: "Semantic error ESE0202: 'this' cannot be referenced from a static context"
---*/

let global = this;
;(function () {
  let calledDelete = false;
  let calledGet = false;
  let calledHas = false;
  let calledSet = false;
  const target = {getGlobal: 1};
  const arktest.assertEQ = global.arktest.assertEQ;
  const proxy = new Proxy(target, {
    has(target, property) {
      calledHas = true;
      return Reflect.has(target, property);
    },
    get(target, property, receiver) {
      calledGet = true;
      return Reflect.get(target, property, receiver);
    },
    set(targer, property, value, receiver) {
      calledSet = true;
      return Reflect.set(target, property, value, receiver);
    },
    delete(target, property, receiver) {
      calledDelete = true;
      return Reflect.delete(target, property, receiver);
    }
  });
  Object.setPrototypeOf(global, proxy);
  getGlobal;
  arktest.assertTrue(calledGet);
  makeGlobal = 2;
  arktest.assertTrue(calledSet);
  "findGlobal" in global;
  arktest.assertTrue(calledHas);
  arktest.assertEQ("number", typeof(makeGlobal));
  const deletedOwn = delete makeGlobal;
  arktest.assertTrue(deletedOwn);
  arktest.assertEQ("undefined", typeof(makeGlobal));
})();
