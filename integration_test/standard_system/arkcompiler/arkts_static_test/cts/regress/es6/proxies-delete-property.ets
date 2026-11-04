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
expected_out_1: "Semantic error ESE0143: Unresolved reference Symbol"
---*/

let properties =
    ['bla', '0', 1, Symbol(), {[Symbol.toPrimitive]() {return 'a'}}];
let p;

function testForwarding(handler, myDelete, shouldThrow) {
  let target = {};
  let proxy = new Proxy(target, handler);

  arktest.assertFalse(target.hasOwnProperty('doesnotexist'));
  arktest.assertTrue(myDelete(proxy, 'doesnotexist'));

  for (p of properties) {
    target[p] = 42;
    arktest.assertTrue(myDelete(proxy, p));
    arktest.assertFalse(target.hasOwnProperty(p));
  }

  for (p of properties) {
    Object.defineProperty(target, p, {value: 42, configurable: false});
    if (shouldThrow) {
      arktest.expectThrow(() => myDelete(proxy, p), ((e: Error): boolean => e instanceof TypeError));
    } else {
      arktest.assertFalse(myDelete(proxy, p));
    }
    arktest.assertTrue(target.hasOwnProperty(p));
  }
};


(function () {
  // No trap.

  let handler = {};

  testForwarding(handler,
      (o, p) => delete o[p], false);
  testForwarding(handler,
      (o, p) => Reflect.deleteProperty(o, p), false);
  testForwarding(handler,
      (o, p) => {'use strict'; return delete o[p]}, true);
  testForwarding(handler,
      (o, p) => {'use strict'; return Reflect.deleteProperty(o, p)}, false);
})();


(function () {
  // "Undefined" trap.

  let handler = { deleteProperty: null };

  testForwarding(handler,
      (o, p) => delete o[p], false);
  testForwarding(handler,
      (o, p) => Reflect.deleteProperty(o, p), false);
  testForwarding(handler,
      (o, p) => {'use strict'; return delete o[p]}, true);
  testForwarding(handler,
      (o, p) => {'use strict'; return Reflect.deleteProperty(o, p)}, false);
})();


(function () {
  // Invalid trap.

  let target = {};
  let handler = { deleteProperty: true };
  let proxy = new Proxy(target, handler);

  arktest.expectThrow(() => delete proxy[0], ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(() => Reflect.deleteProperty(proxy, 0), ((e: Error): boolean => e instanceof TypeError));
})();


function testTrappingTrueish(myDelete) {
  let handler = { deleteProperty() {return 42} };
  let target = {};
  let proxy = new Proxy(target, handler);

  // Trap returns trueish and target doesn't own property.
  for (p of properties) {
    arktest.assertTrue(myDelete(proxy, p));
  }

  // Trap returns trueish and target property is configurable.
  for (p of properties) {
    target[p] = 42;
    arktest.assertTrue(myDelete(proxy, p));
  }

  // Trap returns trueish but target property is not configurable.
  for (p of properties) {
    Object.defineProperty(target, p, {value: 42, configurable: false});
    arktest.expectThrow(() => myDelete(proxy, p), ((e: Error): boolean => e instanceof TypeError));
  }
};


testTrappingTrueish(
    (o, p) => delete o[p]);
testTrappingTrueish(
    (o, p) => Reflect.deleteProperty(o, p));
testTrappingTrueish(
    (o, p) => {'use strict'; return delete o[p]});
testTrappingTrueish(
    (o, p) => {'use strict'; return Reflect.deleteProperty(o, p)});


function testTrappingTrueish2(myDelete) {
  let handler = {
      deleteProperty(target, p) {
          Object.defineProperty(target, p, {configurable: false});
          return 42
      }
  };
  let target = {};
  let proxy = new Proxy(target, handler);

  // Trap returns trueish but target property is not configurable.  In contrast
  // to above, here the target property was configurable before the trap call.
  for (p of properties) {
    target[p] = 42;
    arktest.expectThrow(() => myDelete(proxy, p), ((e: Error): boolean => e instanceof TypeError));
  }
};


testTrappingTrueish2(
    (o, p) => delete o[p]);
testTrappingTrueish2(
    (o, p) => Reflect.deleteProperty(o, p));
testTrappingTrueish2(
    (o, p) => {'use strict'; return delete o[p]});
testTrappingTrueish2(
    (o, p) => {'use strict'; return Reflect.deleteProperty(o, p)});


function testTrappingFalsish(myDelete, shouldThrow) {
  let handler = { deleteProperty() {return ''} };
  let target = {};
  let proxy = new Proxy(target, handler);

  let properties =
      ['bla', '0', 1, Symbol(), {[Symbol.toPrimitive]() {return 'a'}}];

  // Trap returns falsish and target doesn't own property.
  for (p of properties) {
    if (shouldThrow) {
      arktest.expectThrow(() => myDelete(proxy, p), ((e: Error): boolean => e instanceof TypeError));
    } else {
      arktest.assertFalse(myDelete(proxy, p));
    }
  }

  // Trap returns falsish and target property is configurable.
  for (p of properties) {
    target[p] = 42;
    if (shouldThrow) {
      arktest.expectThrow(() => myDelete(proxy, p), ((e: Error): boolean => e instanceof TypeError));
    } else {
      arktest.assertFalse(myDelete(proxy, p));
    }
  }

  // Trap returns falsish and target property is not configurable.
  for (p of properties) {
    Object.defineProperty(target, p, {value: 42, configurable: false});
    if (shouldThrow) {
      arktest.expectThrow(() => myDelete(proxy, p), ((e: Error): boolean => e instanceof TypeError));
    } else {
      arktest.assertFalse(myDelete(proxy, p));
    }
  }
};


testTrappingFalsish(
    (o, p) => delete o[p], false);
testTrappingFalsish(
    (o, p) => Reflect.deleteProperty(o, p), false);
testTrappingFalsish(
    (o, p) => {'use strict'; return delete o[p]}, true);
testTrappingFalsish(
    (o, p) => {'use strict'; return Reflect.deleteProperty(o, p)}, false);
