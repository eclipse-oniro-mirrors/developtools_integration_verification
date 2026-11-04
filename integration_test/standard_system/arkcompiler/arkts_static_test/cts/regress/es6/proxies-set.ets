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
expected_out_1: "Syntax error ESY0194: Parameter declaration should have an explicit type annotation."
---*/

function sloppyDefaultSet(o, p, v) { return o[p] = v }
function sloppyReflectSet(o, p, v) { return Reflect.set(o, p, v) }
function strictDefaultSet(o, p, v) { 'use strict'; return o[p] = v }
function strictReflectSet(o, p, v) { 'use strict'; return Reflect.set(o, p, v) }

sloppyDefaultSet.shouldThrow = false;
sloppyReflectSet.shouldThrow = false;
strictDefaultSet.shouldThrow = true;
strictReflectSet.shouldThrow = false;

sloppyDefaultSet.returnsBool = false;
sloppyReflectSet.returnsBool = true;
strictDefaultSet.returnsBool = false;
strictReflectSet.returnsBool = true;


function assertTrueIf(flag, x) { if (flag) { arktest.assertTrue(x) }}
function assertFalseIf(flag, x) { if (flag) { arktest.assertFalse(x) }}
function assertSetFails(mySet, o, p, v) {
  if (mySet.shouldThrow) {
    arktest.expectThrow(() => mySet(o, p, v), ((e: Error): boolean => e instanceof TypeError));
  } else {
    assertFalseIf(mySet.returnsBool, mySet(o, p, v));
  }
}


function dataDescriptor(x) {
  return {value: x, writable: true, enumerable: true, configurable: true};
}


function toKey(x) {
  if (typeof x === 'symbol') { return x; }
  return String(x);
}


const properties =
    ['bla', '0', 1, Symbol(), {[Symbol.toPrimitive]() {return 'a'}}];


function testForwarding(handler, mySet) {
  arktest.assertTrue(undefined == handler.set);
  arktest.assertTrue(undefined == handler.getOwnPropertyDescriptor);
  arktest.assertTrue(undefined == handler.defineProperty);

  let target = {};
  let proxy = new Proxy(target, handler);

  // Property does not exist on target.
  for (let p of properties) {
    assertTrueIf(mySet.returnsBool, mySet(proxy, p, 42));
    arktest.assertEQ(42, target[p]);
  }

  // Property exists as writable data on target.
  for (let p of properties) {
    assertTrueIf(mySet.returnsBool, mySet(proxy, p, 0));
    arktest.assertEQ(0, target[p]);
  }

  // Property exists as non-writable data on target.
  for (let p of properties) {
    Object.defineProperty(target, p,
        {value: 42, configurable: true, writable: false});
    assertSetFails(mySet, proxy, p, 42);
    assertSetFails(mySet, proxy, p, 0);
    arktest.assertEQ(42, target[p]);
  }
};

(function () {
  // No trap.
  let handler = {};
  testForwarding(handler, sloppyDefaultSet);
  testForwarding(handler, sloppyReflectSet);
  testForwarding(handler, strictDefaultSet);
  testForwarding(handler, strictReflectSet);
})();

(function () {
  // "Undefined" trap.
  let handler = { set: null };
  testForwarding(handler, sloppyDefaultSet);
  testForwarding(handler, sloppyReflectSet);
  testForwarding(handler, strictDefaultSet);
  testForwarding(handler, strictReflectSet);
})();


function testForwarding2(mySet) {
  // Check that setting on a proxy without "set" trap correctly triggers its
  // "getOwnProperty" trap and its "defineProperty" trap.

  let target = {};
  let handler = {};
  let observations = [];
  let proxy = new Proxy(target, handler);

  handler.getOwnPropertyDescriptor = function() {
      observations.push(arguments);
      return Reflect.getOwnPropertyDescriptor(...arguments);
  }

  handler.defineProperty = function() {
      observations.push(arguments);
      return Reflect.defineProperty(...arguments);
  }

  for (let p of properties) {
    mySet(proxy, p, 42);
    arktest.assertEQ(2, observations.length)
    arktest.assertEQ([target, toKey(p)], observations[0]);
    arktest.assertEQ(target, observations[0][0]);
    arktest.assertEQ([target, toKey(p), dataDescriptor(42)], observations[1]);
    arktest.assertEQ(target, observations[1][0]);
    observations = [];

    mySet(proxy, p, 42);
    arktest.assertEQ(2, observations.length)
    arktest.assertEQ([target, toKey(p)], observations[0]);
    arktest.assertEQ(target, observations[0][0]);
    arktest.assertEQ([target, toKey(p), {value: 42}], observations[1]);
    arktest.assertEQ(target, observations[1][0]);
    observations = [];
  }
}

testForwarding2(sloppyDefaultSet);
testForwarding2(sloppyReflectSet);
testForwarding2(strictDefaultSet);
testForwarding2(strictReflectSet);


function testInvalidTrap(proxy, mySet) {
  for (let p of properties) {
    arktest.expectThrow(() => mySet(proxy, p, 42), ((e: Error): boolean => e instanceof TypeError));
  }
}

(function () {
  let target = {};
  let handler = { set: true };
  let proxy = new Proxy(target, handler);

  testInvalidTrap(proxy, sloppyDefaultSet);
  testInvalidTrap(proxy, sloppyReflectSet);
  testInvalidTrap(proxy, strictDefaultSet);
  testInvalidTrap(proxy, strictReflectSet);
})();


function testTrappingFalsish(mySet) {
  let target = {};
  let handler = { set() {return ''} };
  let proxy = new Proxy(target, handler);

  for (let p of properties) {
    assertSetFails(mySet, proxy, p, 42);
  }
}

testTrappingFalsish(sloppyDefaultSet);
testTrappingFalsish(sloppyReflectSet);
testTrappingFalsish(strictDefaultSet);
testTrappingFalsish(strictReflectSet);


function testTrappingTrueish(mySet) {
  let target = {};
  let handler = { set() {return 42} };
  let proxy = new Proxy(target, handler);

  // Trap returns trueish and property does not exist in target.
  for (let p of properties) {
    assertTrueIf(mySet.returnsBool, mySet(proxy, p, 0));
  }

  // Trap returns trueish and target property is configurable or writable data.
  for (let p of properties) {
    Object.defineProperty(target, p, {configurable: true, writable: true});
    assertTrueIf(mySet.returnsBool, mySet(proxy, p, 0));
    Object.defineProperty(target, p, {configurable: true, writable: false});
    assertTrueIf(mySet.returnsBool, mySet(proxy, p, 0));
    Object.defineProperty(target, p, {configurable: false, writable: true});
    assertTrueIf(mySet.returnsBool, mySet(proxy, p, 0));
  }
}

testTrappingTrueish(sloppyDefaultSet);
testTrappingTrueish(sloppyReflectSet);
testTrappingTrueish(strictDefaultSet);
testTrappingTrueish(strictReflectSet);


function testTrappingTrueish2(mySet) {
  let target = {};
  let handler = { set() {return 42} };
  let proxy = new Proxy(target, handler);

  // Trap returns trueish but target property is frozen data.
  for (let p of properties) {
    Object.defineProperty(target, p, {
        configurable: false, writable: false, value: 0
    });
    arktest.expectThrow(() => mySet(proxy, p, 666), ((e: Error): boolean => e instanceof TypeError));  // New value.
    assertTrueIf(mySet.returnsBool, mySet(proxy, p, 0));  // Old value.
  }
};

testTrappingTrueish2(sloppyDefaultSet);
testTrappingTrueish2(sloppyReflectSet);
testTrappingTrueish2(strictDefaultSet);
testTrappingTrueish2(strictReflectSet);


function testTrappingTrueish3(mySet) {
  let target = {};
  let handler = { set() {return 42} };
  let proxy = new Proxy(target, handler);

  // Trap returns trueish and target property is configurable accessor.
  for (let p of properties) {
    Object.defineProperty(target, p, { configurable: true, set: undefined });
    assertTrueIf(mySet.returnsBool, mySet(proxy, p, 0));
  }

  // Trap returns trueish and target property is non-configurable accessor.
  for (let p of properties) {
    Object.defineProperty(target, p, { configurable: false, set: undefined });
    arktest.expectThrow(() => mySet(proxy, p, 0));
  }
};

testTrappingTrueish3(sloppyDefaultSet);
testTrappingTrueish3(sloppyReflectSet);
testTrappingTrueish3(strictDefaultSet);
testTrappingTrueish3(strictReflectSet);


function testTrapReceiverArgument(mySet) {
  let target = {};
  let handler = {};
  let observations = [];
  let proxy = new Proxy(target, handler);
  let object = Object.create(proxy);

  handler.set = function() {
      observations.push(arguments);
      return Reflect.set(...arguments);
  }

  for (let p of properties) {
    mySet(object, p, 42);
    arktest.assertEQ(1, observations.length)
    arktest.assertEQ([target, toKey(p), 42, object], observations[0]);
    arktest.assertEQ(target, observations[0][0]);
    arktest.assertEQ(object, observations[0][3]);
    observations = [];
  }
};

testTrapReceiverArgument(sloppyDefaultSet);
testTrapReceiverArgument(sloppyReflectSet);
testTrapReceiverArgument(strictDefaultSet);
testTrapReceiverArgument(strictReflectSet);


(function TestTrapReceiverArgument2() {
  // Check that non-object receiver is passed through as well.

  let target = {};
  let handler = {};
  let observations = [];
  let proxy = new Proxy(target, handler);

  handler.set = function() {
      observations.push(arguments);
      return Reflect.set(...arguments);
  }

  for (let p of properties) {
    for (let receiver of [null, undefined, 1]) {
      Reflect.set(proxy, p, 42, receiver);
      arktest.assertEQ(1, observations.length)
      arktest.assertEQ([target, toKey(p), 42, receiver], observations[0]);
      arktest.assertEQ(target, observations[0][0]);
      arktest.assertEQ(receiver, observations[0][3]);
      observations = [];
    }
  }

  let object = Object.create(proxy);
  for (let p of properties) {
    for (let receiver of [null, undefined, 1]) {
      Reflect.set(object, p, 42, receiver);
      arktest.assertEQ(1, observations.length);
      arktest.assertEQ([target, toKey(p), 42, receiver], observations[0]);
      arktest.assertEQ(target, observations[0][0]);
      arktest.assertEQ(receiver, observations[0][3]);
      observations = [];
    }
  }
})();


function testTargetProxy(mySet) {
  const q = new Proxy({}, {});
  let proxy = new Proxy(q, {
    set: function(t, k, v) {
      return Reflect.set(t, k, v);
    }
  });

  for (let p of properties) {
    assertTrueIf(mySet.returnsBool, mySet(proxy, p, 42));
    arktest.assertEQ(42, q[p]);
  }
};

testTargetProxy(sloppyDefaultSet);
testTargetProxy(sloppyReflectSet);
testTargetProxy(strictDefaultSet);
testTargetProxy(strictReflectSet);


(function TestAccessorNoSet() {
  let target = {
  };
  Object.defineProperty(target, 'prop', {
    get: function() {
      return 42;
    },
    configurable: false
  })
  let handler = {
    set: function() { return true; }
  }
  let proxy = new Proxy(target, handler);
  arktest.expectThrow(function() { proxy.prop = 0; }, ((e: Error): boolean => e instanceof TypeError));
})();

(function TestProxyInPrototype() {
  let handler = {
    set: function(t, k, v) {
      Reflect.set(t, k, v);
    }
  };
  let obj = {};
  let proxy = new Proxy(obj, handler);
  let o = Object.create(proxy);

  for (let i = 0; i < 3; ++i) {
    o.prop = 42 + i;
    arktest.assertEQ(42 + i, obj.prop);
  }
})();

(function TestProxyInPrototypeNoTrap() {
  let handler = {
  };
  let obj = {};
  let proxy = new Proxy(obj, handler);
  let o = Object.create(proxy);

  for (let i = 0; i < 3; ++i) {
    o.prop = 42 + i;
    arktest.assertEQ(42 + i, o.prop);
    arktest.assertEQ(undefined, obj.prop);
  }
})();

// Note: this case is currently handled by runtime.
(function TestDifferentHolder() {
  let obj = {
    '1337': 100
  };
  let handler = {
    set(target, name, value, receiver) {
      if (name != '1337') { return Reflect.set(target, name, value, receiver); }

      arktest.assertEQ(target, obj);
      arktest.assertEQ(receiver, p);
      return target[name] = value;
    }
  };
  let p = new Proxy(obj, handler);
  for (let i = 0; i < 3; ++i) {
    arktest.assertEQ(42, p[1337] = 42);
  }
})();

(function test32BitIndex() {
  const index = (1 << 31) + 1;
  let obj = {};
  obj[index] = 42;
  let p = new Proxy(obj, {});
  for (let i = 0; i < 3; ++i) {
    p[index] = 100;
    arktest.assertEQ(100, obj[index]);
  }
})();
