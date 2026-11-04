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

(function testBasicFunctionality() {
   let target = {
     target_one: 1,
     property: 'value'
   };

   let handler = {handler:1};

   let proxy = new Proxy(target, handler);
   arktest.assertEQ('value', proxy.property);
   arktest.assertEQ(undefined, proxy.nothing);
   arktest.assertEQ(undefined, proxy.handler);

   handler.get = function() { return 'value 2' };
   arktest.assertEQ('value 2', proxy.property);
   arktest.assertEQ('value 2', proxy.nothing);
   arktest.assertEQ('value 2', proxy.handler);

   const handler2 = new Proxy({get: function() { return 'value 3' }},{});
   const proxy2 = new Proxy(target, handler2);
   arktest.assertEQ('value 3', proxy2.property);
   arktest.assertEQ('value 3', proxy2.nothing);
   arktest.assertEQ('value 3', proxy2.handler);
})();

(function testThrowOnGettingTrap() {
  let handler = new Proxy({}, {get: function(){ throw Error() }});
  let proxy = new Proxy({}, handler);
  arktest.expectThrow('proxy.property', ((e: Error): boolean => e instanceof Error));
})();

(function testThrowOnTrapNotCallable() {
  let handler = new Proxy({}, {get: 'not_callable' });
  let proxy = new Proxy({}, handler);
  arktest.expectThrow('proxy.property', ((e: Error): boolean => e instanceof Error));
})();

(function testFallback() {
  let target = {property:'value'};
  let proxy = new Proxy(target, {});
  arktest.assertEQ('value', proxy.property);
  arktest.assertEQ(undefined, proxy.property2);
})();

(function testFallbackUndefinedTrap() {
  let handler = new Proxy({}, {get: function(){ return undefined }});
  let target = {property:'value'};
  let proxy = new Proxy(target, handler);
  arktest.assertEQ('value', proxy.property);
  arktest.assertEQ(undefined, proxy.property2);
})();

(function testFailingInvariant() {
  let target = {};
  let handler = { get: function(r, p){ if (p != 'key4') { return 'value' }}}
  let proxy = new Proxy(target, handler);
  arktest.assertEQ('value', proxy.property);
  arktest.assertEQ('value', proxy.key);
  arktest.assertEQ('value', proxy.key2);
  arktest.assertEQ('value', proxy.key3);

  // Define a non-configurable, non-writeable property on the target for
  // which the handler will return a different value.
  Object.defineProperty(target, 'key', {
    configurable: false,
    writable: false,
    value: 'different value'
  });
  arktest.assertEQ('value', proxy.property);
  arktest.expectThrow(function(){ proxy.key }, ((e: Error): boolean => e instanceof TypeError));
  arktest.assertEQ('value', proxy.key2);
  arktest.assertEQ('value', proxy.key3);

  // Define a non-configurable getter on the target for which the handler
  // will return a value, according to the spec we do not throw.
  Object.defineProperty(target, 'key2', {
    configurable: false,
    get: function() { return 'different value' }
  });
  arktest.assertEQ('value', proxy.property);
  arktest.expectThrow(function(){ proxy.key }, ((e: Error): boolean => e instanceof TypeError));
  arktest.assertEQ('value', proxy.key2);
  arktest.assertEQ('value', proxy.key3);

  // Define a non-configurable setter without a corresponding getter on the
  // target for which the handler will return a value.
  Object.defineProperty(target, 'key3', {
    configurable: false,
    set: function() { }
  });
  arktest.assertEQ('value', proxy.property);
  arktest.expectThrow(function(){ proxy.key }, ((e: Error): boolean => e instanceof TypeError));
  arktest.assertEQ('value', proxy.key2);
  arktest.expectThrow(function(){ proxy.key3 }, ((e: Error): boolean => e instanceof TypeError));

  // Define a non-configurable setter without a corresponding getter on the
  // target for which the handler will return undefined.
  Object.defineProperty(target, 'key4', {
    configurable: false,
    set: function() { }
  });
  arktest.assertEQ(undefined, proxy.key4);
})();

(function testGetInternalIterators() {
  const log = [];
  const array = [1,2,3,4,5]
  const origIt = array[Symbol.iterator]();
  const it = new Proxy(origIt, {
    get(t, name) {
      log.push(`[[Get]](iterator, ${String(name)})`);
      return Reflect.get(t, name);
    },
    set(t, name, val) {
      log.push(`[[Set]](iterator, ${String(name)}, ${String(val)})`);
      return Reflect.set(t, name, val);
    }
  });

  arktest.expectThrow(function() {
    for (let v of it) { log.push(v); }
  }, ((e: Error): boolean => e instanceof TypeError));
  arktest.assertEQ([
    '[[Get]](iterator, Symbol(Symbol.iterator))',
    '[[Get]](iterator, next)'
  ], log);
})();

(function testGetterWithSideEffect() {
  let obj = {
    key: 0
  }
  arktest.assertEQ(obj.key, 0);
  let p = new Proxy(obj, {});
  let q = new Proxy(p, {
    get(target, name) {
      if (name != 'key') { return Reflect.get(target, name); }
      target.key++;
      return target.key;
    }
  });

  arktest.assertEQ(0, p.key);
  // Assert the trap is not called twice.
  arktest.assertEQ(1, q.key);
})();

(function testReceiverWithTrap() {
  let obj = {};
  let p = new Proxy(obj, {
    get(target, name, receiver) {
      if (name != 'key') { return Reflect.get(target, name); }

      arktest.assertEQ(target, obj);
      arktest.assertEQ(receiver, p);
      return 42;
    }
  });
  arktest.assertEQ(42, p.key);
})();

(function testReceiverWithoutTrap() {
  let obj = {
    get prop() {
      arktest.assertEQ(this, p);
      return 42;
    }
  };
  let p = new Proxy(obj, {});
  arktest.assertEQ(42, p.prop);
})();

(function testGetPropertyDetailsBailout() {
  let obj = {
  }
  let p = new Proxy(obj, {
    getOwnPropertyDescriptor() {
      throw new Error('Error from proxy getOwnPropertyDescriptor trap');
    }
  });
  let q = new Proxy(p, {
    get(target, name) {
      return 42;
    }
  });
  arktest.expectThrow(function(){ q.prop }, (e: Error): boolean =>
    e instanceof Error && e.message == 'Error from proxy getOwnPropertyDescriptor trap');
})();

(function testGetPropertyDetailsBailout2() {
  let obj = {};
  Object.defineProperty(obj, 'prop', {
    value: 53,
    configurable: false
  });
  let p = new Proxy(obj, {});
  let q = new Proxy(p, {
    get(target, name) {
      return 42;
    }
  });
  arktest.expectThrow(function(){ q.prop }, (e: Error): boolean =>
    e instanceof TypeError && e.message ==
    '\'get\' on proxy: property \'prop\' is a read-only and non-configurable data' +
    ' property on the proxy target but the proxy did not return its actual' +
    ' value (expected \'53\' but got \'42\')');
})();

(function test32BitIndex() {
  const index = (1 << 31) + 1;
  let obj = {};
  obj[index] = 42;
  let p = new Proxy(obj, {});
  for (let i = 0; i < 3; ++i) {
    arktest.assertEQ(42, p[index]);
  }
})();
