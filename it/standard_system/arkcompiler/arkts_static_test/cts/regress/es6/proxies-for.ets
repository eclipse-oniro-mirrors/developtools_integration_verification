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

// Helper.

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0194: Parameter declaration should have an explicit type annotation."
---*/

function testWithProxies(test, x, y, z) {
  test(function(h){ return new Proxy({}, h) }, x, y, z)
}


// Iterate over a proxy.

function testForIn(properties, handler) {
  testWithProxies(testForIn2, properties, handler)
}

function testForIn2(create, properties, handler) {
  let p = create(handler)
  let found = []
  for (let x in p) { found.push(x) }
  arktest.assertEQ(properties, found)
}

testForIn(['0', 'a'], {
  ownKeys() { return ['0', 'a'] },
  has(target, property) { return true },
  getOwnPropertyDescriptor() { return { enumerable: true, configurable: true }}
})

testForIn(['null', 'a'], {
  ownKeys() { return this.enumerate() },
  enumerate() { return ['null', 'a'] },
  has(target, property) { return true },
  getOwnPropertyDescriptor() { return { enumerable: true, configurable: true }}
})


// Iterate over an object with a proxy prototype.

function testForInDerived(properties, handler) {
  testWithProxies(testForInDerived2, properties, handler)
}

function testForInDerived2(create, properties, handler) {
  let p = create(handler)
  let o = Object.create(p)
  o.z = 0
  let found = []
  for (let x in o) {
    found.push(x)
  }
  arktest.assertEQ(['z'].concat(properties), found)

  const oo = Object.create(o)
  oo.y = 0
  let found = []
  for (let x in oo) { found.push(x) }
  arktest.assertEQ(['y', 'z'].concat(properties), found)
}

testForInDerived(['0', 'a'], {
  ownKeys: function() { return ['0', 'a'] },
  has: function(t, k) { return k == '0' || k == 'a' },
  getOwnPropertyDescriptor() { return { enumerable: true, configurable: true }}
})

testForInDerived(['null', 'a'], {
  ownKeys: function() { return this.enumerate() },
  enumerate: function() { return ['null', 'a'] },
  has: function(t, k) { return k == 'null' || k == 'a' },
  getOwnPropertyDescriptor() { return { enumerable: true, configurable: true }}
})



// Throw exception in ownKeys trap.

function testForInThrow(handler) {
  testWithProxies(testForInThrow2, handler)
}

function testForInThrow2(create, handler) {
  let p = create(handler)
  let o = Object.create(p)
  arktest.expectThrow(function(){ for (let x in p) {} }, 'myexn')
  arktest.expectThrow(function(){ for (let x in o) {} }, 'myexn')
}

testForInThrow({
  ownKeys: function() { throw 'myexn' }
})

testForInThrow({
  ownKeys: function() { return this.enumerate() },
  enumerate: function() { throw 'myexn' }
})

testForInThrow(new Proxy({}, {
  get: function(pr, pk) {
    return function() { throw 'myexn' }
  }
}));


function keys(object) {
  let keys = [];
  for (let k in object) {
    keys.push(k);
  }
  return keys;
}

(function testKeysProxyOnProtoEmpty() {
  let p = new Proxy({}, {
    ownKeys() { return []; },
  });
  let o = [0];
  o.__proto__ = p;
  arktest.assertEQ(['0'], keys(o));

  delete o[0];
  arktest.assertEQ([], keys(o));
})();

(function testKeysProxyOnProto() {
  let handler = {ownKeys() { return ['0']; }};
  let proxy = new Proxy({}, handler);
  let object = [0];
  object.__proto__ = proxy;
  arktest.assertEQ(['0'], keys(object));

  // The Proxy doesn't set its ownKeys enumerable.
  delete object[0];
  arktest.assertEQ([], keys(object));

  // The [[Has]] trap has no influence on which are enumerable properties are
  // shown in for-in.
  handler.has = function() { return true };
  arktest.assertEQ([], keys(object));

  handler.getOwnPropertyDescriptor = function() {
    return {enumerable: true, configurable: true}
  }
  arktest.assertEQ(['0'], keys(object));
})();

(function testKeysProxyProto() {
  let target = {t1:true, t2:true};
  let handler = {};
  let proxy = new Proxy(target, handler);

  arktest.assertEQ(['t1', 't2'], keys(proxy));

  target.__proto__ = {p1:true, p2:true};
  arktest.assertEQ(['t1', 't2', 'p1', 'p2'], keys(proxy));

  handler.getPrototypeOf = function(target) {
    return {p3:true, p4:true};
  };
  // for-in walks the prototype chain for the [[Has]] / Enumerable check.
  arktest.assertEQ(['t1', 't2', 'p3', 'p4'], keys(proxy));

  // [[Has]] is not used in for-in.
  handler.has = function() { return false };
  arktest.assertEQ(['t1', 't2', 'p3', 'p4'], keys(proxy));

  // Proxy intercepts enumerability check.
  handler.getOwnPropertyDescriptor = function() {
    return {enumerable: false, configurable: true}
  }
  arktest.assertEQ([], keys(proxy));

  handler.getOwnPropertyDescriptor = function() {
    return {enumerable: true, configurable: true}
  }
  arktest.assertEQ(['t1', 't2', 'p3', 'p4'], keys(proxy));

  handler.getOwnPropertyDescriptor = function(target, key) {
    return {
      enumerable: key in target,
      configurable: true
    }
  }
  arktest.assertEQ(['t1', 't2'], keys(proxy));

  handler.getPrototypeOf = function() { throw 'error' };
  arktest.expectThrow(() => {keys(proxy)}, 'error');
})();

(function testNestedProxy() {
  let handler = {
    ownKeys() {
      return ['c'];
    },
    getOwnPropertyDescriptor() { return {configurable: true, enumerable: true } }
  }
  let proxy = new Proxy({}, handler);
  const proxy2 = new Proxy(proxy, {});
  arktest.assertEQ(['c'], keys(proxy));
  arktest.assertEQ(['c'], keys(proxy2));
})();
