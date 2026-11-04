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

(function testNonConstructable() {
  let proxy = new Proxy({},{});
  arktest.expectThrow(function(){ new proxy() }, ((e: Error): boolean => e instanceof TypeError));

  let proxy2 = new Proxy(proxy, {});
  arktest.expectThrow(function(){ proxy2() }, ((e: Error): boolean => e instanceof TypeError));
})();

(function testFailingConstructRevoked() {
  const pair = Proxy.revocable(Array, {});
  let instance = new pair.proxy();
  pair.revoke();
  arktest.expectThrow(function(){ new pair.proxy() }, ((e: Error): boolean => e instanceof TypeError));
})();

(function testFailingGetTrap() {
  let handler = {
    get() {
      throw TypeError();
    }
  }
  let proxy = new Proxy({},{});
  let proxy2 = new Proxy({}, proxy);
  arktest.expectThrow(function(){ new proxy2() }, ((e: Error): boolean => e instanceof TypeError));
})();

(function testConstructFallback() {
  let called = false;
  function target() {
    called = true;
    this.property1 = 'value1';
  };
  target.prototype = {};
  let proxy = new Proxy(target, {});

  arktest.assertFalse(called);
  let instance = new proxy();
  arktest.assertTrue(called);
  arktest.assertEQ('value1', instance.property1);
  arktest.assertEQ(target.prototype, Reflect.getPrototypeOf(instance));

  let proxy2 = new Proxy(proxy, {});
  called = false;
  let instance2 = new proxy2();
  arktest.assertTrue(called);
  arktest.assertEQ('value1', instance2.property1);
  arktest.assertEQ(target.prototype, Reflect.getPrototypeOf(instance));
})();

(function testConstructTrapDirectReturn() {
  function target(a, b) {
      this.sum = a + b;
  };
  let handler = {
      construct(t, c, args) {
          return { sum: 42 };
      }
  };
  let proxy = new Proxy(target, handler);
  arktest.assertEQ(42, (new proxy(1, 2)).sum);
})();

(function testConstructTrap() {
  function target(arg1, arg2) {
    this.arg1 = arg1;
    this.arg2 = arg2;
  }
  let seenTarget;
  let seenArguments;
  let seenNewTarget;
  let handler = {
    construct(target, args, newTarget) {
      seenTarget = target;
      seenArguments = args;
      seenNewTarget = newTarget;
      return Reflect.construct(target, args, newTarget);
    }
  }
  let proxy = new Proxy(target, handler);
  let instance = new proxy('a', 'b');
  arktest.assertEQ(target, seenTarget);
  arktest.assertEQ(['a','b'], seenArguments);
  arktest.assertEQ(proxy, seenNewTarget);
  arktest.assertEQ('a', instance.arg1);
  arktest.assertEQ('b', instance.arg2);

  let instance2 = Reflect.construct(proxy, ['a1', 'b1'], Array);
  arktest.assertEQ(target, seenTarget);
  arktest.assertEQ(['a1', 'b1'], seenArguments);
  arktest.assertEQ(Array, seenNewTarget);
  arktest.assertEQ('a1', instance2.arg1);
  arktest.assertEQ('b1', instance2.arg2);
})();

(function testConstructTrapNonConstructor() {
  function target() {
  };
  const p = new Proxy(target, {
    construct: function() {
      return 0;
    }
  });

  arktest.expectThrow(function() {
    new p();
  }, ((e: Error): boolean => e instanceof TypeError));
})();

(function testConstructCrossRealm() {
  let realm1 = Realm.create();
  let handler = {
    construct(target, args, newTarget) {
      return args;
    }
  };
  let otherProxy = Realm.eval(realm1, 'Proxy');
  const otherArrayPrototype = Realm.eval(realm1, 'Array.prototype');

  // Proxy and handler are from this realm.
  let proxy = new Proxy(Array, handler);
  let result = new proxy();
  arktest.assertEQ(Array.prototype, Reflect.getPrototypeOf(result));

  // Proxy is from this realm, handler is from realm1.
  let otherProxy = new otherProxy(Array, handler);
  const otherResult = new otherProxy();
  arktest.assertEQ(Array.prototype, Reflect.getPrototypeOf(otherResult));

  // Proxy and handler are from realm1.
  const otherProxy2 = Realm.eval(realm1, 'new Proxy('+
        'Array, { construct(target, args, new_target) { return args }} )');
  const otherResult2 = new otherProxy2();
  arktest.assertEQ(Array.prototype, Reflect.getPrototypeOf(otherResult2));
})();

(function testReflectConstructCrossReal() {
  let realm1 = Realm.create();
  const realm2 = Realm.create();
  const realm3 = Realm.create();
  const realm4 = Realm.create();

  const argsRealm1 = Realm.eval(realm1, '[]');
  const proxyRealm2 = Realm.eval(realm2, 'Proxy');
  const constructorRealm3 = Realm.eval(realm3, '(function(){})');
  const handlerRealm4 = Realm.eval(realm4,
      '({ construct(target, args, new_target) {return args} })');

  let proxy = new proxyRealm2(constructorRealm3, handlerRealm4);

  // Check that the arguments array returned by handlerRealm4 is created in the
  // realm of the Reflect.construct function.
  let result = Reflect.construct(proxy, argsRealm1);
  arktest.assertEQ(Array.prototype, Reflect.getPrototypeOf(result));

  let reflectConstructRealm1 = Realm.eval(realm1, 'Reflect.construct');
  const result2 = reflectConstructRealm1(proxy, argsRealm1);
  arktest.assertEQ(Realm.eval(realm1, 'Array.prototype'),
    Reflect.getPrototypeOf(result2));

  const result3 = reflectConstructRealm1(proxy, []);
  arktest.assertEQ(Realm.eval(realm1, 'Array.prototype'),
    Reflect.getPrototypeOf(result3));

  let reflectConstructRealm2 = Realm.eval(realm2, 'Reflect.construct');
  const result4 = reflectConstructRealm2(proxy, argsRealm1);
  arktest.assertEQ(Realm.eval(realm2, 'Array.prototype'),
    Reflect.getPrototypeOf(result4));
})();
