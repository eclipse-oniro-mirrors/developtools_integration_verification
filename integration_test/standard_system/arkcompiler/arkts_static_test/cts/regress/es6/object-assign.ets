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

// Based on Mozilla Object.assign() tests


/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0194: Parameter declaration should have an explicit type annotation."
---*/

function checkDataProperty(object, propertyKey, value, writable, enumerable, configurable) {
  const desc = Object.getOwnPropertyDescriptor(object, propertyKey);
  arktest.assertFalse(desc === undefined);
  arktest.assertTrue('value' in desc);
  arktest.assertEQ(desc.value, value);
  arktest.assertEQ(desc.writable, writable);
  arktest.assertEQ(desc.enumerable, enumerable);
  arktest.assertEQ(desc.configurable, configurable);
}

// 19.1.2.1 Object.assign ( target, ...sources )
arktest.assertEQ(Object.assign.length, 2);

// Basic functionality works with multiple sources
(function basicMultipleSources() {
  let a = {};
  let b = { bProp: 1 };
  const c = { cProp: 2 };
  Object.assign(a, b, c);
  arktest.assertEQ(a, {
    bProp: 1,
    cProp: 2
  });
})();

// Basic functionality works with symbols
(function basicSymbols() {
  let a = {};
  let b = { bProp: 1 };
  const aSymbol = Symbol('aSymbol');
  b[aSymbol] = 2;
  Object.assign(a, b);
  arktest.assertEQ(1, a.bProp);
  arktest.assertEQ(2, a[aSymbol]);
})();

// Dies if target is null or undefined
arktest.expectThrow(function() { return Object.assign(null, null); }, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() { return Object.assign(null, {}); }, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() { return Object.assign(undefined); }, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() { return Object.assign(); }, ((e: Error): boolean => e instanceof TypeError));

// Calls ToObject for target
arktest.assertTrue(Object.assign(true, {}) instanceof Boolean);
arktest.assertTrue(Object.assign(1, {}) instanceof Number);
arktest.assertTrue(Object.assign('string', {}) instanceof String);
const o = {};
arktest.assertEQ(Object.assign(o, {}), o);

// Only [[Enumerable]] properties are assigned to target
(function onlyEnumerablePropertiesAssigned() {
  let source = Object.defineProperties({}, {
    a: {value: 1, enumerable: true},
    b: {value: 2, enumerable: false},
  });
  let target = Object.assign({}, source);
  arktest.assertTrue('a' in target);
  arktest.assertFalse('b' in target);
})();

// Properties are retrieved through Get()
// Properties are assigned through Put()
(function testPropertiesAssignedThroughPut() {
  let setterCalled = false;
  Object.assign({set a(v) { setterCalled = v }}, {a: true});
  arktest.assertTrue(setterCalled);
})();

// Properties are retrieved through Get()
// Properties are assigned through Put(): Existing property attributes are not altered
(function propertiesAssignedExistingNotAltered() {
  let source = {a: 1, b: 2, c: 3};
  let target = {a: 0, b: 0, c: 0};
  Object.defineProperty(target, 'a', {enumerable: false});
  Object.defineProperty(target, 'b', {configurable: false});
  Object.defineProperty(target, 'c', {enumerable: false, configurable: false});
  Object.assign(target, source);
  checkDataProperty(target, 'a', 1, true, false, true);
  checkDataProperty(target, 'b', 2, true, true, false);
  checkDataProperty(target, 'c', 3, true, false, false);
})();

// Properties are retrieved through Get()
// Properties are assigned through Put(): Throws TypeError if non-writable
(function propertiesAssignedTypeErrorNonWritable() {
  let source = {a: 1};
  let target = {a: 0};
  Object.defineProperty(target, 'a', {writable: false});
  arktest.expectThrow(
    function() { return Object.assign(target, source); },
    ((e: Error): boolean => e instanceof TypeError)
  );
  checkDataProperty(target, 'a', 0, false, true, true);
})();

// Properties are retrieved through Get()
// Put() creates standard properties; Property attributes from source are
// ignored
(function createsStandardProperties() {
  let source = {a: 1, b: 2, c: 3, get d() { return 4 }};
  Object.defineProperty(source, 'b', {writable: false});
  Object.defineProperty(source, 'c', {configurable: false});
  let target = Object.assign({}, source);
  checkDataProperty(target, 'a', 1, true, true, true);
  checkDataProperty(target, 'b', 2, true, true, true);
  checkDataProperty(target, 'c', 3, true, true, true);
  checkDataProperty(target, 'd', 4, true, true, true);
})();

// Properties created during traversal are not copied
(function propertiesCreatedDuringTraversalNotCopied() {
  let source = {get a() { this.b = 2 }};
  let target = Object.assign({}, source);
  arktest.assertTrue('a' in target);
  arktest.assertFalse('b' in target);
})();

// String and Symbol valued properties are copied
(function testStringAndSymbolPropertiesCopied() {
  const keyA = 'str-prop';
  let source = {'str-prop': 1};
  let target = Object.assign({}, source);
  checkDataProperty(target, keyA, 1, true, true, true);
})();

(function add_to_source() {
  let target = {set k1(v) { source.k3 = 100; }};
  let source = {k1:10};
  Object.defineProperty(source, 'k2',
      {value: 20, enumerable: false, configurable: true});
  Object.assign(target, source);
  arktest.assertEQ(undefined, target.k2);
  arktest.assertEQ(undefined, target.k3);
})();

(function reconfigure_enumerable_source() {
  let target = {set k1(v) {
    Object.defineProperty(source, 'k2', {value: 20, enumerable: true});
  }};
  let source = {k1:10};
  Object.defineProperty(source, 'k2',
      {value: 20, enumerable: false, configurable: true});
  Object.assign(target, source);
  arktest.assertEQ(20, target.k2);
})();

(function propagate_assign_failure() {
  let target = {set k1(v) { throw 'fail' }};
  let source = {k1:10};
  arktest.expectThrow(()=>Object.assign(target, source));
})();

(function propagate_read_failure() {
  let target = {};
  let source = {get k1() { throw 'fail' }};
  arktest.expectThrow(()=>Object.assign(target, source));
})();

(function strings_and_symbol_order1() {
  // first order
  let log = [];

  let sym1 = Symbol('x');
  let sym2 = Symbol('y');
  let source = {
      get [sym1](){ log.push('get sym1'); },
      get a() { log.push('get a'); },
      get b() { log.push('get b'); },
      get c() { log.push('get c'); },
      get [sym2](){ log.push('get sym2'); },
  };

  Object.assign({}, source);

  arktest.assertEQ(log, ['get a', 'get b', 'get c', 'get sym1', 'get sym2']);
})();

(function strings_and_symbol_order2() {
  // first order
  let log = [];

  let sym1 = Symbol('x');
  let sym2 = Symbol('y');
  let source = {
      get [sym1](){ log.push('get sym1'); },
      get a() { log.push('get a'); },
      get [sym2](){ log.push('get sym2'); },
      get b() { log.push('get b'); },
      get c() { log.push('get c'); },
  };

  Object.assign({}, source);

  arktest.assertEQ(log, ['get a', 'get b', 'get c', 'get sym1', 'get sym2']);
})();


(function strings_and_symbol_order3() {
  // first order
  let log = [];

  let sym1 = Symbol('x');
  let sym2 = Symbol('y');
  let source = {
      get a() { log.push('get a'); },
      get [sym1](){ log.push('get sym1'); },
      get b() { log.push('get b'); },
      get [sym2](){ log.push('get sym2'); },
      get c() { log.push('get c'); },
  };

  Object.assign({}, source);

  arktest.assertEQ(log, ['get a', 'get b', 'get c', 'get sym1', 'get sym2']);
})();

(function proxy() {
  const fastSource = { key1: 'value1', key2: 'value2'};
  const slowSource = {__proto__:null};
  for (let i = 0; i < 2000; i++) {
    slowSource['key' + i] = i;
  }

  const emptyHandler = {};
  let target = {};
  let proxy = new Proxy(target, emptyHandler);
  arktest.assertEQ(Object.keys(target), []);
  let result = Object.assign(proxy, fastSource);
  ArkTools.heapObjectVerify(result);
  arktest.assertEQ(Object.keys(result), Object.keys(target));
  arktest.assertEQ(Object.keys(result), Object.keys(fastSource));
  arktest.assertEQ(Object.values(result), Object.values(fastSource));

  target = {};
  proxy = new Proxy(target, emptyHandler);
  arktest.assertEQ(Object.keys(target), []);
  result = Object.assign(proxy, slowSource);
  ArkTools.heapObjectVerify(result);
  arktest.assertEQ(Object.keys(result).length, Object.keys(target).length);
  arktest.assertEQ(Object.keys(result).length, Object.keys(slowSource).length);
})();

(function global_object() {
  let source = {
    global1: 'global1',
    get global2() { return 'global2' },
  };
  let result = Object.assign(globalThis, source);
  ArkTools.heapObjectVerify(result);
  arktest.assertTrue(result === globalThis);
  arktest.assertTrue(result.global1 === source.global1);
  arktest.assertTrue(result.global2 === source.global2);

  let target = {};
  result = Object.assign(target, globalThis);
  ArkTools.heapObjectVerify(result);
  arktest.assertTrue(result === target);
  arktest.assertTrue(result.global1 === source.global1);
  arktest.assertTrue(result.global2 === source.global2);

  for (let i = 0; i < 2000; i++) {
    source['property' + i] = i;
  }
  result = Object.assign(globalThis, source);
  ArkTools.heapObjectVerify(result);
  arktest.assertTrue(result === globalThis);
  for (let i = 0; i < 2000; i++) {
    const key = 'property' + i;
    arktest.assertEQ(result[key], i);
  }

})();
