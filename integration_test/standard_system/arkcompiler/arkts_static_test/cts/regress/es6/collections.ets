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

let key = Symbol('collection');

// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are
// met:
//
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above
//       copyright notice, this list of conditions and the following
//       disclaimer in the documentation and/or other materials provided
//       with the distribution.
//     * Neither the name of upstream project Inc. nor the names of its
//       contributors may be used to endorse or promote products derived
//       from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.



function assertSize(expected, collection) {
  if (collection instanceof Map || collection instanceof Set) {
    arktest.assertEQ(expected, collection.size);
  }
}


// Test valid getter and setter calls on Sets and WeakSets
function testValidSetCalls(m) {
  arktest.expectNoThrow(function () { m.add({}) });
  arktest.expectNoThrow(function () { m.has({}) });
  arktest.expectNoThrow(function () { m.delete({}) });
}
testValidSetCalls(new Set);
testValidSetCalls(new WeakSet);


// Test valid getter and setter calls on Maps and WeakMaps
function testValidMapCalls(m) {
  arktest.expectNoThrow(function () { m.get({}) });
  arktest.expectNoThrow(function () { m.set({}) });
  arktest.expectNoThrow(function () { m.has({}) });
  arktest.expectNoThrow(function () { m.delete({}) });
  arktest.expectNoThrow(function () { m.get(undefined) });
  arktest.expectNoThrow(function () { m.get(null) });
  arktest.expectNoThrow(function () { m.get(0) });
  arktest.expectNoThrow(function () { m.get('a-key') });
  arktest.expectNoThrow(function () { m.get(Symbol()) });
  arktest.expectNoThrow(function () { m.has(undefined) });
  arktest.expectNoThrow(function () { m.has(null) });
  arktest.expectNoThrow(function () { m.has(0) });
  arktest.expectNoThrow(function () { m.has('a-key') });
  arktest.expectNoThrow(function () { m.has(Symbol()) });
  arktest.expectNoThrow(function () { m.delete(undefined) });
  arktest.expectNoThrow(function () { m.delete(null) });
  arktest.expectNoThrow(function () { m.delete(0) });
  arktest.expectNoThrow(function () { m.delete('a-key') });
  arktest.expectNoThrow(function () { m.delete(Symbol()) });
}
testValidMapCalls(new Map);
testValidMapCalls(new WeakMap);


// Test invalid getter and setter calls for WeakMap only
function testInvalidCalls(m) {
  arktest.expectThrow(function () { m.set(undefined, 0) }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function () { m.set(null, 0) }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function () { m.set(0, 0) }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function () { m.set('a-key', 0) }, ((e: Error): boolean => e instanceof TypeError));
}
testInvalidCalls(new WeakMap);


// Test expected behavior for Sets and WeakSets
function testSet(set, key) {
  arktest.assertFalse(set.has(key));
  arktest.assertFalse(set.delete(key));
  if (typeof key === 'object' && !(set instanceof WeakSet)) {
    arktest.assertEQ(set, set.add(key));
    arktest.assertTrue(set.has(key));
    arktest.assertTrue(set.delete(key));
  }
  arktest.assertFalse(set.has(key));
  arktest.assertFalse(set.delete(key));
  arktest.assertFalse(set.has(key));
}
function testSetBehavior(set) {
  // Fill
  for (let i = 0; i < 20; i++) {
    testSet(set, {});
    testSet(set, i);
    testSet(set, i / 100);
    testSet(set, 'key-' + i);
    testSet(set, Symbol(i));
  }

  let keys = [
    -0, +0, 1, 1/3, 10, +Infinity, -Infinity, NaN, true, false, null, undefined,
    'x', Symbol(), {}, function(){}
  ];
  for (let i = 0; i < keys.length; i++) {
    testSet(set, keys[i]);
  }
}
testSetBehavior(new Set);
testSetBehavior(new WeakSet);


// Test expected mapping behavior for Maps and WeakMaps
function testMapping(map, key, value) {
  arktest.assertFalse(map.has(key));
  arktest.assertEQ(undefined, map.get(key));
  arktest.assertFalse(map.delete(key));
  if (typeof key === 'object' && !(map instanceof WeakMap)) {
    arktest.assertEQ(map, map.set(key, value));
    arktest.assertEQ(value, map.get(key));
    arktest.assertTrue(map.has(key));
    arktest.assertTrue(map.delete(key));
  }
  arktest.assertFalse(map.has(key));
  arktest.assertEQ(undefined, map.get(key));
  arktest.assertFalse(map.delete(key));
  arktest.assertFalse(map.has(key));
  arktest.assertEQ(undefined, map.get(key));
}
function testMapBehavior(m) {
  // Fill
  testMapping(m, {}, 23);
  testMapping(m, {}, 'the-value');
  testMapping(m, {}, {});
  for (let i = 0; i < 20; i++) {
    testMapping(m, i, {});
    testMapping(m, i / 10, {});
    testMapping(m, 'key-' + i, {});
    testMapping(m, Symbol(i), {});
  }

  let keys = [
    -0, +0, 1, 1/3, 10, +Infinity, -Infinity, NaN, true, false, null, undefined,
    'x', Symbol(), {}, function(){}
  ];
  for (let i = 0; i < keys.length; i++) {
    testMapping(m, keys[i], 23);
    testMapping(m, keys[i], 'the-value');
    testMapping(m, keys[i], {});
  }
}
testMapBehavior(new Map);
testMapBehavior(new WeakMap);


// Test expected querying behavior of Maps and WeakMaps
function testQuery(m) {
  let key = {};
  const values = [ 'x', 0, +Infinity, -Infinity, true, false, null, undefined ];
  for (let i = 0; i < values.length; i++) {
    testMapping(m, key, values[i]);
  }
}
testQuery(new Map);
testQuery(new WeakMap);


// Test expected deletion behavior of Maps and WeakMaps
function testDelete(m) {
  let key = {};
  testMapping(m, key, 'to-be-deleted');
  arktest.assertFalse(m.delete(key));
  arktest.assertFalse(m.delete({}));
  arktest.assertEQ(m.get(key), undefined);
}
testDelete(new Map);
testDelete(new WeakMap);


// Test GC of Maps and WeakMaps with entry
function testGC1(m) {
  let key = {};
  m.set(key, 'not-collected');
  ArkTools.gc();
  arktest.assertEQ('not-collected', m.get(key));
}
testGC1(new Map);
testGC1(new WeakMap);


// Test GC of Maps and WeakMaps with chained entries
function testGC2(m) {
  let head = {};
  for (let key = head, i = 0; i < 10; i++, key = m.get(key)) {
    m.set(key, {});
  }
  ArkTools.gc();
  let count = 0;
  for (let key = head; key != undefined; key = m.get(key)) {
    count++;
  }
  arktest.assertEQ(11, count);
}
testGC2(new Map);
testGC2(new WeakMap);


// Test arbitrary properties on Maps and WeakMaps
function testArbitrary(m) {
  function testProperty(map, property, value) {
    map[property] = value;
    arktest.assertEQ(value, map[property]);
  }
  for (let i = 0; i < 20; i++) {
    testProperty(m, i, 'val' + i);
    testProperty(m, 'foo' + i, 'bar' + i);
  }
  testMapping(m, {}, 'foobar');
}
testArbitrary(new Map);
testArbitrary(new WeakMap);


// Test direct constructor call
arktest.expectThrow(function() { Set(); }, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() { Map(); }, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() { WeakMap(); }, ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow(function() { WeakSet(); }, ((e: Error): boolean => e instanceof TypeError));


// Test whether NaN values as keys are treated correctly.
let s = new Set;
arktest.assertFalse(s.has(NaN));
arktest.assertFalse(s.has(NaN + 1));
arktest.assertFalse(s.has(23));
s.add(NaN);
arktest.assertTrue(s.has(NaN));
arktest.assertTrue(s.has(NaN + 1));
arktest.assertFalse(s.has(23));
let m = new Map;
arktest.assertFalse(m.has(NaN));
arktest.assertFalse(m.has(NaN + 1));
arktest.assertFalse(m.has(23));
m.set(NaN, 'a-value');
arktest.assertTrue(m.has(NaN));
arktest.assertTrue(m.has(NaN + 1));
arktest.assertFalse(m.has(23));


// Test some common JavaScript idioms for Sets
let s = new Set;
arktest.assertTrue(s instanceof Set);
arktest.assertTrue(Set.prototype.add instanceof Function)
arktest.assertTrue(Set.prototype.has instanceof Function)
arktest.assertTrue(Set.prototype.delete instanceof Function)
arktest.assertTrue(Set.prototype.clear instanceof Function)


// Test some common JavaScript idioms for Maps
let m = new Map;
arktest.assertTrue(m instanceof Map);
arktest.assertTrue(Map.prototype.set instanceof Function)
arktest.assertTrue(Map.prototype.get instanceof Function)
arktest.assertTrue(Map.prototype.has instanceof Function)
arktest.assertTrue(Map.prototype.delete instanceof Function)
arktest.assertTrue(Map.prototype.clear instanceof Function)


// Test some common JavaScript idioms for WeakMaps
let m = new WeakMap;
arktest.assertTrue(m instanceof WeakMap);
arktest.assertTrue(WeakMap.prototype.set instanceof Function)
arktest.assertTrue(WeakMap.prototype.get instanceof Function)
arktest.assertTrue(WeakMap.prototype.has instanceof Function)
arktest.assertTrue(WeakMap.prototype.delete instanceof Function)


// Test some common JavaScript idioms for WeakSets
let s = new WeakSet;
arktest.assertTrue(s instanceof WeakSet);
arktest.assertTrue(WeakSet.prototype.add instanceof Function)
arktest.assertTrue(WeakSet.prototype.has instanceof Function)
arktest.assertTrue(WeakSet.prototype.delete instanceof Function)


// Test name of constructor.
arktest.assertEQ('Set', Set.name);
arktest.assertEQ('Map', Map.name);
arktest.assertEQ('WeakMap', WeakMap.name);
arktest.assertEQ('WeakSet', WeakSet.name);


// Test prototype property of Set, Map, WeakMap and WeakSet.
function testPrototype(c) {
  arktest.assertTrue(c.prototype instanceof Object);
  arktest.assertEQ({
    value: c.prototype,
    writable: false,
    enumerable: false,
    configurable: false
  }, Object.getOwnPropertyDescriptor(c, 'prototype'));
}
testPrototype(Set);
testPrototype(Map);
testPrototype(WeakMap);
testPrototype(WeakSet);


// Test the Set, Map, WeakMap and WeakSet global properties themselves.
function testDescriptor(global, c) {
  arktest.assertEQ({
    value: c,
    writable: true,
    enumerable: false,
    configurable: true
  }, Object.getOwnPropertyDescriptor(global, c.name));
}
testDescriptor(this, Set);
testDescriptor(this, Map);
testDescriptor(this, WeakMap);
testDescriptor(this, WeakSet);


// Regression test for WeakMap prototype.
arktest.assertTrue(WeakMap.prototype.constructor === WeakMap)
arktest.assertTrue(Object.getPrototypeOf(WeakMap.prototype) === Object.prototype)


// Regression test for issue 1617: The prototype of the WeakMap constructor
// needs to be unique (i.e. different from the one of the Object constructor).
arktest.assertFalse(WeakMap.prototype === Object.prototype);
let o = Object.create({});
arktest.assertFalse('get' in o);
arktest.assertFalse('set' in o);
arktest.assertEQ(undefined, o.get);
arktest.assertEQ(undefined, o.set);
let o = Object.create({}, { myValue: {
  value: 10,
  enumerable: false,
  configurable: true,
  writable: true
}});
arktest.assertEQ(10, o.myValue);


// Regression test for issue 1884: Invoking any of the methods for Harmony
// maps, sets, or weak maps, with a wrong type of receiver should be throwing
// a proper TypeError.
const alwaysBogus = [ undefined, null, true, 'x', 23, {} ];
const bogusReceiversTestSet = [
  { proto: Set.prototype,
    funcs: [ 'add', 'has', 'delete' ],
    receivers: alwaysBogus.concat([ new Map, new WeakMap, new WeakSet ]),
  },
  { proto: Map.prototype,
    funcs: [ 'get', 'set', 'has', 'delete' ],
    receivers: alwaysBogus.concat([ new Set, new WeakMap, new WeakSet ]),
  },
  { proto: WeakMap.prototype,
    funcs: [ 'get', 'set', 'has', 'delete' ],
    receivers: alwaysBogus.concat([ new Set, new Map, new WeakSet ]),
  },
  { proto: WeakSet.prototype,
    funcs: [ 'add', 'has', 'delete' ],
    receivers: alwaysBogus.concat([ new Set, new Map, new WeakMap ]),
  },
];
function testBogusReceivers(testSet) {
  for (let i = 0; i < testSet.length; i++) {
    let proto = testSet[i].proto;
    const funcs = testSet[i].funcs;
    const receivers = testSet[i].receivers;
    for (let j = 0; j < funcs.length; j++) {
      let func = proto[funcs[j]];
      for (let k = 0; k < receivers.length; k++) {
        arktest.expectThrow(
          function () { func.call(receivers[k], {}) },
          ((e: Error): boolean => e instanceof TypeError)
        );
      }
    }
  }
}
testBogusReceivers(bogusReceiversTestSet);


// Stress Test
// There is a proposed stress-test available at the es-discuss mailing list
// which cannot be reasonably automated.  Check it out by hand if you like:
// https://mail.mozilla.org/pipermail/es-discuss/2011-May/014096.html


// Set and Map size getters
const setSizeDescriptor = Object.getOwnPropertyDescriptor(Set.prototype, 'size');
arktest.assertEQ(undefined, setSizeDescriptor.value);
arktest.assertEQ(undefined, setSizeDescriptor.set);
arktest.assertTrue(setSizeDescriptor.get instanceof Function);
arktest.assertEQ(undefined, setSizeDescriptor.get.prototype);
arktest.assertFalse(setSizeDescriptor.enumerable);
arktest.assertTrue(setSizeDescriptor.configurable);
arktest.assertEQ('get size', setSizeDescriptor.get.name);

let s = new Set();
arktest.assertFalse(s.hasOwnProperty('size'));
for (let i = 0; i < 10; i++) {
  arktest.assertEQ(i, s.size);
  s.add(i);
}
for (let i = 9; i >= 0; i--) {
  s.delete(i);
  arktest.assertEQ(i, s.size);
}


const mapSizeDescriptor = Object.getOwnPropertyDescriptor(Map.prototype, 'size');
arktest.assertEQ(undefined, mapSizeDescriptor.value);
arktest.assertEQ(undefined, mapSizeDescriptor.set);
arktest.assertTrue(mapSizeDescriptor.get instanceof Function);
arktest.assertEQ(undefined, mapSizeDescriptor.get.prototype);
arktest.assertFalse(mapSizeDescriptor.enumerable);
arktest.assertTrue(mapSizeDescriptor.configurable);
arktest.assertEQ('get size', mapSizeDescriptor.get.name);

let m = new Map();
arktest.assertFalse(m.hasOwnProperty('size'));
for (let i = 0; i < 10; i++) {
  arktest.assertEQ(i, m.size);
  m.set(i, i);
}
for (let i = 9; i >= 0; i--) {
  m.delete(i);
  arktest.assertEQ(i, m.size);
}


// Test Set clear
(function() {
  let s = new Set();
  s.add(42);
  arktest.assertTrue(s.has(42));
  arktest.assertEQ(1, s.size);
  s.clear();
  arktest.assertFalse(s.has(42));
  arktest.assertEQ(0, s.size);
})();


// Test Map clear
(function() {
  let m = new Map();
  m.set(42, true);
  arktest.assertTrue(m.has(42));
  arktest.assertEQ(1, m.size);
  m.clear();
  arktest.assertFalse(m.has(42));
  arktest.assertEQ(0, m.size);
})();


(function TestMinusZeroSet() {
  let s = new Set();
  s.add(-0);
  arktest.assertEQ(0, s.values().next().value);
  s.add(0);
  arktest.assertEQ(1, s.size);
  arktest.assertTrue(s.has(0));
  arktest.assertTrue(s.has(-0));
})();


(function TestMinusZeroMap() {
  let m = new Map();
  m.set(-0, 'minus');
  arktest.assertEQ(0, m.keys().next().value);
  m.set(0, 'plus');
  arktest.assertEQ(1, m.size);
  arktest.assertTrue(m.has(0));
  arktest.assertTrue(m.has(-0));
  arktest.assertEQ('plus', m.get(0));
  arktest.assertEQ('plus', m.get(-0));
})();


(function TestSetForEachInvalidTypes() {
  arktest.expectThrow(function() {
    Set.prototype.set.forEach.call({});
  }, ((e: Error): boolean => e instanceof TypeError));

  let set = new Set();
  arktest.expectThrow(function() {
    set.forEach({});
  }, ((e: Error): boolean => e instanceof TypeError));
})();


(function TestSetForEach() {
  let set = new Set();
  set.add('a');
  set.add('b');
  set.add('c');

  let buffer = '';
  let receiver = {};
  set.forEach(function(v, k, s) {
    arktest.assertEQ(v, k);
    arktest.assertEQ(set, s);
    arktest.assertEQ(this, receiver);
    buffer += v;
    if (v === 'a') {
      set.delete('b');
      set.add('d');
      set.add('e');
      set.add('f');
    } else if (v === 'c') {
      set.add('b');
      set.delete('e');
    }
  }, receiver);

  arktest.assertEQ('acdfb', buffer);
})();


(function TestSetForEachAddAtEnd() {
  let set = new Set();
  set.add('a');
  set.add('b');

  let buffer = '';
  set.forEach(function(v) {
    buffer += v;
    if (v === 'b') {
      set.add('c');
    }
  });

  arktest.assertEQ('abc', buffer);
})();


(function TestSetForEachDeleteNext() {
  let set = new Set();
  set.add('a');
  set.add('b');
  set.add('c');

  let buffer = '';
  set.forEach(function(v) {
    buffer += v;
    if (v === 'b') {
      set.delete('c');
    }
  });

  arktest.assertEQ('ab', buffer);
})();


(function TestSetForEachDeleteVisitedAndAddAgain() {
  let set = new Set();
  set.add('a');
  set.add('b');
  set.add('c');

  let buffer = '';
  set.forEach(function(v) {
    buffer += v;
    if (v === 'b') {
      set.delete('a');
    } else if (v === 'c') {
      set.add('a');
    }
  });

  arktest.assertEQ('abca', buffer);
})();


(function TestSetForEachClear() {
  let set = new Set();
  set.add('a');
  set.add('b');
  set.add('c');

  let buffer = '';
  set.forEach(function(v) {
    buffer += v;
    if (v === 'a') {
      set.clear();
      set.add('d');
      set.add('e');
    }
  });

  arktest.assertEQ('ade', buffer);
})();


(function TestSetForEachNested() {
  let set = new Set();
  set.add('a');
  set.add('b');
  set.add('c');

  let buffer = '';
  set.forEach(function(v) {
    buffer += v;
    set.forEach(function(v) {
      buffer += v;
      if (v === 'a') {
        set.delete('b');
      }
    });
  });

  arktest.assertEQ('aaccac', buffer);
})();


(function TestSetForEachEarlyExit() {
  let set = new Set();
  set.add('a');
  set.add('b');
  set.add('c');

  let buffer = '';
  let ex = {};
  try {
    set.forEach(function(v) {
      buffer += v;
      throw ex;
    });
  } catch (e) {
    arktest.assertEQ(ex, e);
  }
  arktest.assertEQ('a', buffer);
})();


(function TestSetForEachGC() {
  let set = new Set();
  for (let i = 0; i < 100; i++) {
    set.add(i);
  }

  let accumulated = 0;
  set.forEach(function(v) {
    accumulated += v;
    if (v % 10 === 0) {
      ArkTools.gc();
    }
  });
  arktest.assertEQ(4950, accumulated);
})();


(function TestSetForEachReceiverAsObject() {
  let set = new Set(['1', '2']);

  // Create a new object in each function call when receiver is a
  // primitive value. See ECMA-262, Annex C.
  let a = [];
  set.forEach(function() { a.push(this) }, '');
  arktest.assertTrue(a[0] !== a[1]);

  // Do not create a new object otherwise.
  a = [];
  set.forEach(function() { a.push(this); }, {});
  arktest.assertEQ(a[0], a[1]);
})();


(function TestSetForEachReceiverAsObjectInStrictMode() {
  let set = new Set(['1', '2']);

  // In strict mode primitive values should not be coerced to an object.
  let a = [];
  set.forEach(function() { 'use strict'; a.push(this); }, '');
  arktest.assertTrue(a[0] === '' && a[0] === a[1]);
})();


(function TestMapForEachInvalidTypes() {
  arktest.expectThrow(function() {
    Map.prototype.map.forEach.call({});
  }, ((e: Error): boolean => e instanceof TypeError));

  let map = new Map();
  arktest.expectThrow(function() {
    map.forEach({});
  }, ((e: Error): boolean => e instanceof TypeError));
})();


(function TestMapForEach() {
  let map = new Map();
  map.set(0, 'a');
  map.set(1, 'b');
  map.set(2, 'c');

  let buffer = [];
  let receiver = {};
  map.forEach(function(v, k, m) {
    arktest.assertEQ(map, m);
    arktest.assertEQ(this, receiver);
    buffer.push(k, v);
    if (k === 0) {
      map.delete(1);
      map.set(3, 'd');
      map.set(4, 'e');
      map.set(5, 'f');
    } else if (k === 2) {
      map.set(1, 'B');
      map.delete(4);
    }
  }, receiver);

  arktest.assertEQ([0, 'a', 2, 'c', 3, 'd', 5, 'f', 1, 'B'], buffer);
})();


(function TestMapForEachAddAtEnd() {
  let map = new Map();
  map.set(0, 'a');
  map.set(1, 'b');

  let buffer = [];
  map.forEach(function(v, k) {
    buffer.push(k, v);
    if (k === 1) {
      map.set(2, 'c');
    }
  });

  arktest.assertEQ([0, 'a', 1, 'b', 2, 'c'], buffer);
})();


(function TestMapForEachDeleteNext() {
  let map = new Map();
  map.set(0, 'a');
  map.set(1, 'b');
  map.set(2, 'c');

  let buffer = [];
  map.forEach(function(v, k) {
    buffer.push(k, v);
    if (k === 1) {
      map.delete(2);
    }
  });

  arktest.assertEQ([0, 'a', 1, 'b'], buffer);
})();


(function TestSetForEachDeleteVisitedAndAddAgain() {
  let map = new Map();
  map.set(0, 'a');
  map.set(1, 'b');
  map.set(2, 'c');

  let buffer = [];
  map.forEach(function(v, k) {
    buffer.push(k, v);
    if (k === 1) {
      map.delete(0);
    } else if (k === 2) {
      map.set(0, 'a');
    }
  });

  arktest.assertEQ([0, 'a', 1, 'b', 2, 'c', 0, 'a'], buffer);
})();


(function TestMapForEachClear() {
  let map = new Map();
  map.set(0, 'a');
  map.set(1, 'b');
  map.set(2, 'c');

  let buffer = [];
  map.forEach(function(v, k) {
    buffer.push(k, v);
    if (k === 0) {
      map.clear();
      map.set(3, 'd');
      map.set(4, 'e');
    }
  });

  arktest.assertEQ([0, 'a', 3, 'd', 4, 'e'], buffer);
})();


(function TestMapForEachNested() {
  let map = new Map();
  map.set(0, 'a');
  map.set(1, 'b');
  map.set(2, 'c');

  let buffer = [];
  map.forEach(function(v, k) {
    buffer.push(k, v);
    map.forEach(function(v, k) {
      buffer.push(k, v);
      if (k === 0) {
        map.delete(1);
      }
    });
  });

  arktest.assertEQ([0, 'a', 0, 'a', 2, 'c', 2, 'c', 0, 'a', 2, 'c'], buffer);
})();


(function TestMapForEachEarlyExit() {
  let map = new Map();
  map.set(0, 'a');
  map.set(1, 'b');
  map.set(2, 'c');

  let buffer = [];
  let ex = {};
  try {
    map.forEach(function(v, k) {
      buffer.push(k, v);
      throw ex;
    });
  } catch (e) {
    arktest.assertEQ(ex, e);
  }
  arktest.assertEQ([0, 'a'], buffer);
})();


(function TestMapForEachGC() {
  let map = new Map();
  for (let i = 0; i < 100; i++) {
    map.set(i, i);
  }

  let accumulated = 0;
  map.forEach(function(v) {
    accumulated += v;
    if (v % 10 === 0) {
      ArkTools.gc();
    }
  });
  arktest.assertEQ(4950, accumulated);
})();


(function TestMapForEachAllRemovedTransition() {
  let map = new Map;
  map.set(0, 0);

  let buffer = [];
  map.forEach(function(v) {
    buffer.push(v);
    if (v === 0) {
      for (let i = 1; i < 4; i++) {
        map.set(i, i);
      }
    }

    if (v === 3) {
      for (let i = 0; i < 4; i++) {
        map.delete(i);
      }
      for (let i = 4; i < 8; i++) {
        map.set(i, i);
      }
    }
  });

  arktest.assertEQ([0, 1, 2, 3, 4, 5, 6, 7], buffer);
})();


(function TestMapForEachClearTransition() {
  let map = new Map;
  map.set(0, 0);

  let i = 0;
  let buffer = [];
  map.forEach(function(v) {
    buffer.push(v);
    if (++i < 5) {
      for (let j = 0; j < 5; j++) {
        map.clear();
        map.set(i, i);
      }
    }
  });

  arktest.assertEQ([0, 1, 2, 3, 4], buffer);
})();


(function TestMapForEachNestedNonTrivialTransition() {
  let map = new Map;
  map.set(0, 0);
  map.set(1, 1);
  map.set(2, 2);
  map.set(3, 3);
  map.delete(0);

  let i = 0;
  let buffer = [];
  map.forEach(function(v) {
    if (++i > 10) { return; }

    buffer.push(v);

    if (v == 3) {
      map.delete(1);
      for (let j = 4; j < 10; j++) {
        map.set(j, j);
      }
      for (let j = 4; j < 10; j += 2) {
        map.delete(j);
      }
      map.delete(2);

      for (let j = 10; j < 20; j++) {
        map.set(j, j);
      }
      for (let j = 10; j < 20; j += 2) {
        map.delete(j);
      }

      map.delete(3);
    }
  });

  arktest.assertEQ([1, 2, 3, 5, 7, 9, 11, 13, 15, 17], buffer);
})();


(function TestMapForEachAllRemovedTransitionNoClear() {
  let map = new Map;
  map.set(0, 0);

  let buffer = [];
  map.forEach(function(v) {
    buffer.push(v);
    if (v === 0) {
      for (let i = 1; i < 8; i++) {
        map.set(i, i);
      }
    }

    if (v === 4) {
      for (let i = 0; i < 8; i++) {
        map.delete(i);
      }
    }
  });

  arktest.assertEQ([0, 1, 2, 3, 4], buffer);
})();


(function TestMapForEachNoMoreElementsAfterTransition() {
  let map = new Map;
  map.set(0, 0);

  let buffer = [];
  map.forEach(function(v) {
    buffer.push(v);
    if (v === 0) {
      for (let i = 1; i < 16; i++) {
        map.set(i, i);
      }
    }

    if (v === 4) {
      for (let i = 5; i < 16; i++) {
        map.delete(i);
      }
    }
  });

  arktest.assertEQ([0, 1, 2, 3, 4], buffer);
})();


(function TestMapForEachReceiverAsObject() {
  let map = new Map();
  map.set('key1', 'value1');
  map.set('key2', 'value2');

  // Create a new object in each function call when receiver is a
  // primitive value. See ECMA-262, Annex C.
  let a = [];
  map.forEach(function() { a.push(this) }, '');
  arktest.assertTrue(a[0] !== a[1]);

  // Do not create a new object otherwise.
  a = [];
  map.forEach(function() { a.push(this); }, {});
  arktest.assertEQ(a[0], a[1]);
})();


(function TestMapForEachReceiverAsObjectInStrictMode() {
  let map = new Map();
  map.set('key1', 'value1');
  map.set('key2', 'value2');

  // In strict mode primitive values should not be coerced to an object.
  let a = [];
  map.forEach(function() { 'use strict'; a.push(this); }, '');
  arktest.assertTrue(a[0] === '' && a[0] === a[1]);
})();


// Allows testing iterator-based constructors easily.
const oneAndTwo = new Map();
const k0 = {key: 0};
const k1 = {key: 1};
const k2 = {key: 2};
oneAndTwo.set(k1, 1);
oneAndTwo.set(k2, 2);

testConstructorOrderOfAdderIterator(Map, 'set');
testConstructorOrderOfAdderIterator(Set, 'add');
testConstructorOrderOfAdderIterator(WeakMap, 'set');
testConstructorOrderOfAdderIterator(WeakSet, 'add');
