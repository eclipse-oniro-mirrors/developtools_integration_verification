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

let key = Symbol.iterator;



function test(f) {
  ArkTools.prepareFunctionForOptimization(f);
  f();
  f();
  ArkTools.optimizeFunctionOnNextCall(f);
  f();
}

test(function TestSetIterator() {
  let s = new Set;
  let iter = s.values();

  const setIteratorPrototype = iter.__proto__;
  arktest.assertFalse(setIteratorPrototype.hasOwnProperty('constructor'));
  arktest.assertEQ(setIteratorPrototype.__proto__.__proto__, Object.prototype);

  let propertyNames = Object.getOwnPropertyNames(setIteratorPrototype);
  arktest.assertEQ(['next'], propertyNames);

  arktest.assertEQ(new Set().values().__proto__, setIteratorPrototype);
  arktest.assertEQ(new Set().entries().__proto__, setIteratorPrototype);

  arktest.assertEQ('[object Set Iterator]',
      Object.prototype.toString.call(iter));
  arktest.assertEQ('Set Iterator', setIteratorPrototype[Symbol.toStringTag]);
  let desc = Object.getOwnPropertyDescriptor(
      setIteratorPrototype, Symbol.toStringTag);
  arktest.assertTrue(desc.configurable);
  arktest.assertFalse(desc.writable);
  arktest.assertEQ('Set Iterator', desc.value);
});


test(function TestSetIteratorValues() {
  let s = new Set;
  s.add(1);
  s.add(2);
  s.add(3);
  let iter = s.values();

  arktest.assertEQ({value: 1, done: false}, iter.next());
  arktest.assertEQ({value: 2, done: false}, iter.next());
  arktest.assertEQ({value: 3, done: false}, iter.next());
  arktest.assertEQ({value: undefined, done: true}, iter.next());
  arktest.assertEQ({value: undefined, done: true}, iter.next());
});


test(function TestSetIteratorKeys() {
  arktest.assertEQ(Set.prototype.keys, Set.prototype.values);
});


test(function TestSetIteratorEntries() {
  let s = new Set;
  s.add(1);
  s.add(2);
  s.add(3);
  let iter = s.entries();

  arktest.assertEQ({value: [1, 1], done: false}, iter.next());
  arktest.assertEQ({value: [2, 2], done: false}, iter.next());
  arktest.assertEQ({value: [3, 3], done: false}, iter.next());
  arktest.assertEQ({value: undefined, done: true}, iter.next());
  arktest.assertEQ({value: undefined, done: true}, iter.next());
});


test(function TestSetIteratorMutations() {
  let s = new Set;
  s.add(1);
  let iter = s.values();
  arktest.assertEQ({value: 1, done: false}, iter.next());
  s.add(2);
  s.add(3);
  s.add(4);
  s.add(5);
  arktest.assertEQ({value: 2, done: false}, iter.next());
  s.delete(3);
  arktest.assertEQ({value: 4, done: false}, iter.next());
  s.delete(5);
  arktest.assertEQ({value: undefined, done: true}, iter.next());
  s.add(4);
  arktest.assertEQ({value: undefined, done: true}, iter.next());
});


test(function TestSetIteratorMutations2() {
  let s = new Set;
  s.add(1);
  s.add(2);
  let i = s.values();
  arktest.assertEQ({value: 1, done: false}, i.next());
  s.delete(2);
  s.delete(1);
  s.add(2);
  arktest.assertEQ({value: 2, done: false}, i.next());
  arktest.assertEQ({value: undefined, done: true}, i.next());
});


test(function TestSetIteratorMutations3() {
  let s = new Set;
  s.add(1);
  s.add(2);
  let i = s.values();
  arktest.assertEQ({value: 1, done: false}, i.next());
  s.delete(2);
  s.delete(1);
  for (let x = 2; x < 500; ++x) {
    s.add(x);
  }
  for (let x = 2; x < 500; ++x) {
    s.delete(x);
  }
  for (let x = 2; x < 1000; ++x) {
    s.add(x);
  }
  arktest.assertEQ({value: 2, done: false}, i.next());
  for (let x = 1001; x < 2000; ++x) {
    s.add(x);
  }
  s.delete(3);
  for (let x = 6; x < 2000; ++x) { s.delete(x); }
  arktest.assertEQ({value: 4, done: false}, i.next());
  s.delete(5);
  arktest.assertEQ({value: undefined, done: true}, i.next());
  s.add(4);
  arktest.assertEQ({value: undefined, done: true}, i.next());
});


test(function TestSetInvalidReceiver() {
  arktest.expectThrow(function() {
    Set.prototype.values.call({});
  }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() {
    Set.prototype.entries.call({});
  }, ((e: Error): boolean => e instanceof TypeError));
});


test(function TestSetIteratorInvalidReceiver() {
  let iter = new Set().values();
  arktest.expectThrow(function() {
    iter.next.call({});
  });
});


test(function TestSetIteratorSymbol() {
  arktest.assertEQ(Set.prototype[Symbol.iterator], Set.prototype.values);
  arktest.assertTrue(Set.prototype.hasOwnProperty(Symbol.iterator));
  arktest.assertFalse(Set.prototype.propertyIsEnumerable(Symbol.iterator));

  let iter = new Set().values();
  arktest.assertEQ(iter, iter[Symbol.iterator]());
  arktest.assertEQ(iter[Symbol.iterator].name, '[Symbol.iterator]');
});


test(function TestMapIterator() {
  let m = new Map;
  let iter = m.values();

  const mapIteratorPrototype = iter.__proto__;
  arktest.assertFalse(mapIteratorPrototype.hasOwnProperty('constructor'));
  arktest.assertEQ(mapIteratorPrototype.__proto__.__proto__, Object.prototype);

  let propertyNames = Object.getOwnPropertyNames(mapIteratorPrototype);
  arktest.assertEQ(['next'], propertyNames);

  arktest.assertEQ(new Map().values().__proto__, mapIteratorPrototype);
  arktest.assertEQ(new Map().keys().__proto__, mapIteratorPrototype);
  arktest.assertEQ(new Map().entries().__proto__, mapIteratorPrototype);

  arktest.assertEQ('[object Map Iterator]',
      Object.prototype.toString.call(iter));
  arktest.assertEQ('Map Iterator', mapIteratorPrototype[Symbol.toStringTag]);
  let desc = Object.getOwnPropertyDescriptor(
      mapIteratorPrototype, Symbol.toStringTag);
  arktest.assertTrue(desc.configurable);
  arktest.assertFalse(desc.writable);
  arktest.assertEQ('Map Iterator', desc.value);
});


test(function TestMapIteratorValues() {
  let m = new Map;
  m.set(1, 11);
  m.set(2, 22);
  m.set(3, 33);
  let iter = m.values();

  arktest.assertEQ({value: 11, done: false}, iter.next());
  arktest.assertEQ({value: 22, done: false}, iter.next());
  arktest.assertEQ({value: 33, done: false}, iter.next());
  arktest.assertEQ({value: undefined, done: true}, iter.next());
  arktest.assertEQ({value: undefined, done: true}, iter.next());
});


test(function TestMapIteratorKeys() {
  let m = new Map;
  m.set(1, 11);
  m.set(2, 22);
  m.set(3, 33);
  let iter = m.keys();

  arktest.assertEQ({value: 1, done: false}, iter.next());
  arktest.assertEQ({value: 2, done: false}, iter.next());
  arktest.assertEQ({value: 3, done: false}, iter.next());
  arktest.assertEQ({value: undefined, done: true}, iter.next());
  arktest.assertEQ({value: undefined, done: true}, iter.next());
});


test(function TestMapIteratorEntries() {
  let m = new Map;
  m.set(1, 11);
  m.set(2, 22);
  m.set(3, 33);
  let iter = m.entries();

  arktest.assertEQ({value: [1, 11], done: false}, iter.next());
  arktest.assertEQ({value: [2, 22], done: false}, iter.next());
  arktest.assertEQ({value: [3, 33], done: false}, iter.next());
  arktest.assertEQ({value: undefined, done: true}, iter.next());
  arktest.assertEQ({value: undefined, done: true}, iter.next());
});


test(function TestMapInvalidReceiver() {
  arktest.expectThrow(function() {
    Map.prototype.values.call({});
  }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() {
    Map.prototype.keys.call({});
  }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() {
    Map.prototype.entries.call({});
  }, ((e: Error): boolean => e instanceof TypeError));
});


test(function TestMapIteratorInvalidReceiver() {
  let iter = new Map().values();
  arktest.expectThrow(function() {
    iter.next.call({});
  }, ((e: Error): boolean => e instanceof TypeError));
});


test(function TestMapIteratorSymbol() {
  arktest.assertEQ(Map.prototype[Symbol.iterator], Map.prototype.entries);
  arktest.assertTrue(Map.prototype.hasOwnProperty(Symbol.iterator));
  arktest.assertFalse(Map.prototype.propertyIsEnumerable(Symbol.iterator));

  let iter = new Map().values();
  arktest.assertEQ(iter, iter[Symbol.iterator]());
  arktest.assertEQ(iter[Symbol.iterator].name, '[Symbol.iterator]');
});
