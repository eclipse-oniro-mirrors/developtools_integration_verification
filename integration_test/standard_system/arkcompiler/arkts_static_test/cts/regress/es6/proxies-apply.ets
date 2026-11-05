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

(function testNonCallable() {
  let proxy = new Proxy({},{});
  arktest.expectThrow(function(){ proxy() }, ((e: Error): boolean => e instanceof TypeError));

  let proxy2 = new Proxy(proxy, {});
  arktest.expectThrow(function(){ proxy2() }, ((e: Error): boolean => e instanceof TypeError));
})();

(function testCallProxyFallbackNoArguments() {
  let called = false;
  let target = function() {
    called = true;
  }
  let proxy = new Proxy(target, {});
  arktest.assertFalse(called);
  proxy();
  arktest.assertTrue(called);

  called = false;
  let proxy2 = new Proxy(proxy, {});
  arktest.assertFalse(called);
  proxy2();
  arktest.assertTrue(called);
})();

(function testCallProxyFallback1Argument() {
  let called = false;
  let target = function(a) {
    called = true;
    arktest.assertEQ('1', a);
  }
  let proxy = new Proxy(target, {});
  arktest.assertFalse(called);
  proxy('1');
  arktest.assertTrue(called);
})();

(function testCallProxyFallback2Arguments() {
  let called = false;
  let target = function(a, b) {
    called = true;
    arktest.assertEQ('1', a);
    arktest.assertEQ('2', b);
  }
  let proxy = new Proxy(target, {});
  arktest.assertFalse(called);
  proxy('1', '2');
  arktest.assertTrue(called);
})();

(function testCallProxyFallbackChangedReceiver() {
  const applyReceiver = {receiver:true};
  let seenReceiver = undefined;
  let target = function() {
    seenReceiver = this;
  }
  let proxy = new Proxy(target, {});
  arktest.assertEQ(undefined, seenReceiver);
  Reflect.apply(proxy, applyReceiver, [1,2,3,4]);
  arktest.assertEQ(applyReceiver, seenReceiver);
})();

(function testCallProxyTrap() {
  let calledTarget = false;
  let calledHandler = false;
  let target = function(a, b) {
    calledTarget = true;
    arktest.assertEQ(1, a);
    arktest.assertEQ(2, b);
  }
  let handler = {
    apply: function(target, thisArg, args) {
      target.apply(thisArg, args);
      calledHandler = true;
    }
  }
  let proxy = new Proxy(target, handler);
  arktest.assertFalse(calledTarget);
  arktest.assertFalse(calledHandler);
  Reflect.apply(proxy, {rec:1}, [1,2]);
  arktest.assertTrue(calledTarget);
  arktest.assertTrue(calledHandler);
})();

(function testCallProxyTrapArrayArg() {
  let calledTarget = false;
  let calledHandler = false;
  let target = function(a, b) {
    calledTarget = true;
    arktest.assertEQ([1, 2], a);
    arktest.assertEQ(3, b);
  }
  let handler = {
    apply: function(target, thisArg, args) {
      target.apply(thisArg, args);
      calledHandler = true;
    }
  }
  let proxy = new Proxy(target, handler);
  arktest.assertFalse(calledTarget);
  arktest.assertFalse(calledHandler);
  proxy([1,2], 3);
  arktest.assertTrue(calledTarget);
  arktest.assertTrue(calledHandler);
})();

(function testCallProxyTrapObjectArg() {
  let calledTarget = false;
  let calledHandler = false;
  let target = function(o) {
    calledTarget = true;
    arktest.assertEQ({a: 1, b: 2}, o);
  }
  let handler = {
    apply: function(target, thisArg, args) {
      target.apply(thisArg, args);
      calledHandler = true;
    }
  }
  let proxy = new Proxy(target, handler);
  arktest.assertFalse(calledTarget);
  arktest.assertFalse(calledHandler);
  proxy({a: 1, b: 2});
  arktest.assertTrue(calledTarget);
  arktest.assertTrue(calledHandler);
})();

(function testCallProxyTrapGeneratorArg() {
  function* gen() {
    yield 1;
    yield 2;
    yield 3;
  }
  let calledTarget = false;
  let calledHandler = false;
  let target = function(g) {
    calledTarget = true;
    arktest.assertEQ([1,2,3], [...g]);
  }
  let handler = {
    apply: function(target, thisArg, args) {
      target.apply(thisArg, args);
      calledHandler = true;
    }
  }
  let proxy = new Proxy(target, handler);
  arktest.assertFalse(calledTarget);
  arktest.assertFalse(calledHandler);
  proxy(gen());
  arktest.assertTrue(calledTarget);
  arktest.assertTrue(calledHandler);
})();

(function testProxyTrapContext() {
  let _target;
  let _args;
  let _handler;
  let _context;
  let target = function(a, b) { return a + b; };
  let handler = {
    apply: function(t, c, args) {
        _handler = this;
        _target = t;
        _context = c;
        _args = args;
    }
  };
  let proxy = new Proxy(target, handler);

  const context = {};

  proxy.call(context, 1, 2);

  arktest.assertEQ(_handler, handler);
  arktest.assertEQ(_target, target);
  arktest.assertEQ(_context, context);
  arktest.assertEQ(_args.length, 2);
  arktest.assertEQ(_args[0], 1);
  arktest.assertEQ(_args[1], 2);
})();

(function testCallProxyNonCallableTrap() {
  let calledTarget = false;
  let target = function() {
    calledTarget = true;
  };
  let handler = {
    apply: 'non callable trap'
  };

  let proxy = new Proxy(target, handler);
  arktest.expectThrow(function(){ proxy() }, ((e: Error): boolean => e instanceof TypeError));

  arktest.assertFalse(calledTarget);
})();

(function testCallProxyNullTrap() {
  let _args;
  let target = function(a, b) {
    _args = [a, b];
    return a + b;
  };
  let handler = {
    apply: null
  };

  let proxy = new Proxy(target, handler);
  const result = proxy(1, 2);

  arktest.assertEQ(result, 3);
  arktest.assertEQ(_args.length, 2);
  arktest.assertEQ(_args[0], 1);
  arktest.assertEQ(_args[1], 2);
})();

(function testCallProxyNonCallableTarget() {
  const values = [NaN, 1.5, 100, /RegExp/, 'string', {}, [], Symbol(),
                new Map(), new Set(), new WeakMap(), new WeakSet()];
  values.forEach(target => {
    target = Object(target);
    let proxy = new Proxy(target, { apply() { arktest.assertTrue(false); } });
    arktest.expectThrow(() => { proxy(); }, ((e: Error): boolean => e instanceof TypeError));
    arktest.expectThrow(() => { ({ proxy }).proxy(); }, ((e: Error): boolean => e instanceof TypeError));
    arktest.expectThrow(() => { Reflect.apply(proxy, null, []); }, ((e: Error): boolean => e instanceof TypeError));
    arktest.expectThrow(
      () => { Reflect.apply(proxy, { proxy }, []); },
      ((e: Error): boolean => e instanceof TypeError)
    );
    arktest.expectThrow(() => {
          Function.prototype.call.apply(proxy, [null]);
        }, ((e: Error): boolean => e instanceof TypeError));
    arktest.expectThrow(() => {
          Function.prototype.apply.apply(proxy, [null, []]);
        }, ((e: Error): boolean => e instanceof TypeError));

    const proxyToProxy = new Proxy(proxy, { apply() { arktest.assertTrue(false); } });
    arktest.expectThrow(() => { proxyToProxy(); }, ((e: Error): boolean => e instanceof TypeError));
    arktest.expectThrow(() => { ({ proxyToProxy }).proxyToProxy(); }, ((e: Error): boolean => e instanceof TypeError));
    arktest.expectThrow(
      () => { Reflect.apply(proxyToProxy, null, []); },
      ((e: Error): boolean => e instanceof TypeError)
    );
    arktest.expectThrow(() => { Reflect.apply(proxyToProxy, { proxy }, []); },
                 TypeError);
    arktest.expectThrow(() => {
          Function.prototype.call.apply(proxyToProxy, [null]);
        }, ((e: Error): boolean => e instanceof TypeError));
    arktest.expectThrow(() => {
          Function.prototype.apply.apply(proxyToProxy, [null, []]);
        }, ((e: Error): boolean => e instanceof TypeError));
  });
})();
