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

'use strict';

const global = this;

const sym = Symbol('gaga');

const objects = [
  {},
  [],
  function() {},
  function() {
    return arguments;
  }(),
  function() {
    'use strict';
    return arguments;
  }(),
  Object(1),
  Object(true),
  Object('bla'),
  new Date,
  new RegExp,
  new Set,
  new Map,
  new WeakMap,
  new WeakSet,
  new ArrayBuffer(10),
  new Int32Array(5),
  Object,
  Function,
  Date,
  RegExp,
  global
];

function prepare(target) {
  target['bla'] = true;
  target[4] = 42;
  target[sym] = 'foo';
  target['noconf'] = 43;
  Object.defineProperty(target, 'noconf',
      { configurable: false });
  Object.defineProperty(target, 'nowrite',
      { writable: false, configurable: true, value: 44 });
  Object.defineProperty(target, 'getter',
      { get: function () {return this.bla}, configurable: true });
  Object.defineProperty(target, 'setter',
      { set: function (x) {this.gaga = x}, configurable: true });
  Object.defineProperty(target, 'setter2',
      { set: function (x) {}, configurable: true });
}


(function testReflectGetArity() {
  arktest.assertEQ(2, Reflect.get.length);
})();


(function testReflectGetOnNonObject() {
  arktest.expectThrow(function() { Reflect.get(); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.get(42, 'bla'); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.get(null, 'bla'); }, ((e: Error): boolean => e instanceof TypeError));
})();


(function testReflectGetKeyConversion() {
  let target = {bla: 42};
  let a = { [Symbol.toPrimitive]: function() { return 'bla' } };
  let b = { [Symbol.toPrimitive]: function() { throw 'gaga' } };
  arktest.assertEQ(42, Reflect.get(target, a));
  arktest.expectThrow(function() { Reflect.get(target, b); }, 'gaga');
})();


(function testReflectGetOnObject() {
  let receiver = {bla: false};
  for (let target of objects) {
    prepare(target);
    arktest.assertEQ(true, Reflect.get(target, 'bla'));
    arktest.assertEQ(true, Reflect.get(target, 'bla', target));
    arktest.assertEQ(true, Reflect.get(target, 'bla', receiver));
    arktest.assertEQ(42, Reflect.get(target, 4));
    arktest.assertEQ(42, Reflect.get(target, 4, target));
    arktest.assertEQ(42, Reflect.get(target, 4, receiver));
    arktest.assertEQ(42, Reflect.get(target, '4'));
    arktest.assertEQ(42, Reflect.get(target, '4', target));
    arktest.assertEQ(42, Reflect.get(target, '4', receiver));
    arktest.assertEQ('foo', Reflect.get(target, sym));
    arktest.assertEQ('foo', Reflect.get(target, sym, target));
    arktest.assertEQ('foo', Reflect.get(target, sym, receiver));
    arktest.assertEQ(43, Reflect.get(target, 'noconf'));
    arktest.assertEQ(43, Reflect.get(target, 'noconf', target));
    arktest.assertEQ(43, Reflect.get(target, 'noconf', receiver));
    arktest.assertEQ(true, Reflect.get(target, 'getter'));
    arktest.assertEQ(true, Reflect.get(target, 'getter', target));
    arktest.assertEQ(false, Reflect.get(target, 'getter', receiver));
    arktest.assertEQ(undefined, Reflect.get(target, 'setter'));
    arktest.assertEQ(undefined, Reflect.get(target, 'setter', target));
    arktest.assertEQ(undefined, Reflect.get(target, 'setter', receiver));
    arktest.assertEQ(undefined, Reflect.get(target, 'foo'));
    arktest.assertEQ(undefined, Reflect.get(target, 'foo', target));
    arktest.assertEQ(undefined, Reflect.get(target, 'foo', receiver));
    arktest.assertEQ(undefined, Reflect.get(target, 666));
    arktest.assertEQ(undefined, Reflect.get(target, 666, target));
    arktest.assertEQ(undefined, Reflect.get(target, 666, receiver));

    let proto = target.__proto__;
    target.__proto__ = { get foo() {return this.bla} };
    arktest.assertEQ(true, Reflect.get(target, 'foo'));
    arktest.assertEQ(true, Reflect.get(target, 'foo', target));
    arktest.assertEQ(false, Reflect.get(target, 'foo', receiver));
    target.__proto__ = proto;
  }
})();


(function testReflectSetArity() {
  arktest.assertEQ(3, Reflect.set.length);
})();


(function testReflectSetOnNonObject() {
  arktest.expectThrow(function() { Reflect.set(); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.set(42, 'bla'); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.set(null, 'bla'); }, ((e: Error): boolean => e instanceof TypeError));
})();


(function testReflectSetKeyConversion() {
  let target = {};
  let a = { [Symbol.toPrimitive]: function() { return 'bla' } };
  let b = { [Symbol.toPrimitive]: function() { throw 'gaga' } };
  arktest.assertTrue(Reflect.set(target, a, 42));
  arktest.assertEQ(42, target.bla);
  arktest.expectThrow(function() { Reflect.set(target, b, 42); }, 'gaga');
})();


(function testReflectSetOnObject() {
  let receiver = {bla: false};
  const value = 34234;
  for (let target of objects) {
    prepare(target);
    arktest.assertTrue(Reflect.set(target, 'bla', value));
    arktest.assertEQ(value, target.bla);

    prepare(target);
    arktest.assertTrue(Reflect.set(target, 'bla', value, target));
    arktest.assertEQ(value, target.bla);

    prepare(target);
    arktest.assertTrue(Reflect.set(target, 'bla', value, receiver));
    arktest.assertEQ(true, target.bla);
    arktest.assertEQ(value, receiver.bla);
    receiver.bla = false;

    prepare(target);
    arktest.assertTrue(Reflect.set(target, 4, value));
    arktest.assertEQ(value, target[4]);

    prepare(target);
    arktest.assertTrue(Reflect.set(target, 4, value, target));
    arktest.assertEQ(value, target[4]);

    prepare(target);
    arktest.assertTrue(Reflect.set(target, 4, value, receiver));
    arktest.assertEQ(42, target[4]);
    arktest.assertEQ(value, receiver[4]);
    delete receiver[4];

    prepare(target);
    arktest.assertTrue(Reflect.set(target, sym, value));
    arktest.assertEQ(value, target[sym]);

    prepare(target);
    arktest.assertTrue(Reflect.set(target, sym, value, target));
    arktest.assertEQ(value, target[sym]);

    prepare(target);
    arktest.assertTrue(Reflect.set(target, sym, value, receiver));
    arktest.assertEQ('foo', target[sym]);
    arktest.assertEQ(value, receiver[sym]);
    delete receiver[sym];

    prepare(target);
    arktest.assertTrue(Reflect.set(target, 'noconf', value));
    arktest.assertEQ(value, target.noconf);

    prepare(target);
    arktest.assertTrue(Reflect.set(target, 'noconf', value, target));
    arktest.assertEQ(value, target.noconf);

    prepare(target);
    arktest.assertTrue(Reflect.set(target, 'noconf', value, receiver));
    arktest.assertEQ(43, target.noconf);
    arktest.assertEQ(value, receiver.noconf);
    delete receiver.noconf;

    arktest.assertTrue(Reflect.set(target, 'setter', value));
    arktest.assertEQ(value, target.gaga)
    delete target.gaga;

    arktest.assertTrue(Reflect.set(target, 'setter', value, target));
    arktest.assertEQ(value, target.gaga)
    delete target.gaga;

    arktest.assertTrue(Reflect.set(target, 'setter', value, receiver));
    arktest.assertFalse('gaga' in target);
    arktest.assertEQ(value, receiver.gaga);
    delete receiver.gaga;

    arktest.assertFalse(Reflect.set(target, 'nowrite', value));
    arktest.assertEQ(44, target.nowrite);

    arktest.assertFalse(Reflect.set(target, 'nowrite', value, target));
    arktest.assertEQ(44, target.nowrite);

    arktest.assertFalse(Reflect.set(target, 'nowrite', value, receiver));
    arktest.assertEQ(44, target.nowrite);
    arktest.assertFalse('nowrite' in receiver);

    // Data vs Non-Writable
    arktest.assertFalse(Reflect.set({}, 'nowrite', value, target));

    // Data vs Accessor
    arktest.assertFalse(Reflect.set({}, 'unknown', 0, {set unknown(x) {}}));
    arktest.assertFalse(Reflect.set(target, 'unknown', value, {set unknown(x) {}}));
    arktest.assertFalse(Reflect.set(target, 'bla', value, {set bla(x) {}}));
    arktest.assertFalse(Reflect.set(target, 'bla', value, {get bla() {}}));

    // Accessor vs Data
    arktest.assertTrue(Reflect.set({set bla(x) {}}), 'bla', value, target);
    arktest.assertFalse(Reflect.set({get bla() {}}, 'bla', value, target));

    // Data vs Non-Object
    arktest.assertFalse(Reflect.set({}, 'bla', value, null));
    arktest.assertFalse(Reflect.set({bla: 42}, 'bla', value, null));

    // Accessor vs Non-Object
    arktest.assertTrue(Reflect.set(target, 'setter2', value, null));
    arktest.assertFalse(Reflect.set(target, 'getter', value, null));

    let receiver2 = {};
    Object.defineProperty(receiver2, 'bla',
        {configurable: false, writable: true, value: true});
    Object.defineProperty(receiver2, 'not_in_target',
        {configurable: false, writable: true, value: true});
    arktest.assertTrue(Reflect.set(target, 'bla', value, receiver2));
    arktest.assertTrue(Reflect.set(target, 'not_in_target', value, receiver2));
  }
})();


(function testReflectSetArrayLength() {
  let y = [];
  Object.defineProperty(y, 0, {value: 42, configurable: false});
  arktest.assertFalse(Reflect.set(y, 'length', 0));
  arktest.assertTrue(Reflect.set(y, 'length', 2));
})();


(function testReflectHasArity() {
  arktest.assertEQ(2, Reflect.has.length);
})();


(function testReflectHasOnNonObject() {
  arktest.expectThrow(function() { Reflect.has(); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.has(42, 'bla'); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.has(null, 'bla'); }, ((e: Error): boolean => e instanceof TypeError));
})();


(function testReflectHasKeyConversion() {
  let target = {bla: 42};
  let a = { [Symbol.toPrimitive]: function() { return 'bla' } };
  let b = { [Symbol.toPrimitive]: function() { throw 'gaga' } };
  arktest.assertTrue(Reflect.has(target, a));
  arktest.expectThrow(function() { Reflect.has(target, b); }, 'gaga');
})();


(function testReflectHasOnObject() {
  for (let target of objects) {
    prepare(target);
    arktest.assertTrue(Reflect.has(target, 'bla'));
    arktest.assertTrue(Reflect.has(target, 4));
    arktest.assertTrue(Reflect.has(target, '4'));
    arktest.assertTrue(Reflect.has(target, sym));
    arktest.assertTrue(Reflect.has(target, 'noconf'));
    arktest.assertTrue(Reflect.has(target, 'getter'));
    arktest.assertTrue(Reflect.has(target, 'setter'));
    arktest.assertFalse(Reflect.has(target, 'foo'));
    arktest.assertFalse(Reflect.has(target, 666));

    let proto = target.__proto__;
    target.__proto__ = { get foo() {return this.bla} };
    arktest.assertEQ(true, Reflect.has(target, 'foo'));
    target.__proto__ = proto;
  }
})();


(function testReflectDefinePropertyArity() {
  arktest.assertEQ(3, Reflect.defineProperty.length);
})();


(function testReflectDefinePropertyOnNonObject() {
  arktest.expectThrow(function() { Reflect.defineProperty(); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(
    function() { Reflect.defineProperty(42, 'bla'); },
    ((e: Error): boolean => e instanceof TypeError)
  );
  arktest.expectThrow(
    function() { Reflect.defineProperty(null, 'bla'); },
    ((e: Error): boolean => e instanceof TypeError)
  );
  arktest.expectThrow(
    function() { Reflect.defineProperty({}, 'bla'); },
    ((e: Error): boolean => e instanceof TypeError)
  );
  arktest.expectThrow(function() { Reflect.defineProperty({}, 'bla', 42); },
      TypeError);
  arktest.expectThrow(function() { Reflect.defineProperty({}, 'bla', null); },
      TypeError);
})();


(function testReflectDefinePropertyKeyConversion() {
  let target = {};
  let a = { [Symbol.toPrimitive]: function() { return 'bla' } };
  let b = { [Symbol.toPrimitive]: function() { throw 'gaga' } };
  arktest.assertTrue(Reflect.defineProperty(target, a, {value: 42}));
  arktest.assertEQ(target.bla, 42);
  arktest.expectThrow(function() { Reflect.defineProperty(target, b); }, 'gaga');
})();


(function testReflectDefinePropertyArrayLength() {
  let y = [];
  Object.defineProperty(y, 0, {value: 42, configurable: false});
  arktest.assertFalse(Reflect.defineProperty(y, 'length', {value: 0}));
  arktest.assertTrue(Reflect.defineProperty(y, 'length', {value: 2}));
})();

(function testReflectDeletePropertyArity() {
  arktest.assertEQ(2, Reflect.deleteProperty.length);
})();


(function testReflectDeletePropertyOnNonObject() {
  arktest.expectThrow(function() { Reflect.deleteProperty(); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(
    function() { Reflect.deleteProperty(42, 'bla'); },
    ((e: Error): boolean => e instanceof TypeError)
  );
  arktest.expectThrow(
    function() { Reflect.deleteProperty(null, 'bla'); },
    ((e: Error): boolean => e instanceof TypeError)
  );
})();


(function testReflectDeletePropertyKeyConversion() {
  let target = {bla: 42};
  let a = { [Symbol.toPrimitive]: function() { return 'bla' } };
  let b = { [Symbol.toPrimitive]: function() { throw 'gaga' } };
  arktest.assertTrue(Reflect.deleteProperty(target, a));
  arktest.expectThrow(function() { Reflect.deleteProperty(target, b); }, 'gaga');
})();


(function testReflectDeletePropertyOnObject() {
  for (let target of objects) {
    prepare(target);
    arktest.assertTrue(Reflect.deleteProperty(target, 'bla'));
    arktest.assertEQ(undefined, Object.getOwnPropertyDescriptor(target, 'bla'));
    if (target instanceof Int32Array) {
      arktest.assertFalse(Reflect.deleteProperty(target, 4));
    } else {
      arktest.assertTrue(Reflect.deleteProperty(target, 4));
      arktest.assertEQ(undefined, Object.getOwnPropertyDescriptor(target, 4));
    }
    arktest.assertTrue(Reflect.deleteProperty(target, sym));
    arktest.assertEQ(undefined, Object.getOwnPropertyDescriptor(target, sym));
    arktest.assertFalse(Reflect.deleteProperty(target, 'noconf'));
    arktest.assertEQ(43, target.noconf);
    arktest.assertTrue(Reflect.deleteProperty(target, 'getter'));
    arktest.assertTrue(Reflect.deleteProperty(target, 'setter'));
    arktest.assertTrue(Reflect.deleteProperty(target, 'foo'));
    arktest.assertTrue(Reflect.deleteProperty(target, 666));

    let proto = target.__proto__;
    target.__proto__ = { get foo() {return this.bla} };
    arktest.assertEQ(true, Reflect.deleteProperty(target, 'foo'));
    target.__proto__ = proto;
  }
})();

(function testReflectGetPrototypeOfArity() {
  arktest.assertEQ(1, Reflect.getPrototypeOf.length);
})();


(function testReflectGetPrototypeOnNonObject() {
  arktest.expectThrow(function() { Reflect.getPrototypeOf(); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.getPrototypeOf(42); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.getPrototypeOf(null); }, ((e: Error): boolean => e instanceof TypeError));
})();


(function testReflectSetPrototypeOfArity() {
  arktest.assertEQ(2, Reflect.setPrototypeOf.length);
})();


(function testReflectSetPrototypeOfOnNonObject() {
  arktest.expectThrow(function() { Reflect.setPrototypeOf(undefined, {}); },
      TypeError);
  arktest.expectThrow(function() { Reflect.setPrototypeOf(42, {}); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(
    function() { Reflect.setPrototypeOf(null, {}); },
    ((e: Error): boolean => e instanceof TypeError)
  );

  arktest.expectThrow(function() { Reflect.setPrototypeOf({}, undefined); },
      TypeError);
  arktest.expectThrow(function() { Reflect.setPrototypeOf({}, 42); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.assertTrue(Reflect.setPrototypeOf({}, null));
})();

(function testReflectIsExtensibleArity() {
  arktest.assertEQ(1, Reflect.isExtensible.length);
})();


(function testReflectIsExtensibleOnNonObject() {
  arktest.expectThrow(function() { Reflect.isExtensible(); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.isExtensible(42); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.isExtensible(null); }, ((e: Error): boolean => e instanceof TypeError));
})();


(function testReflectIsExtensibleOnObject() {
  // This should be the last test on [objects] as it modifies them irreversibly.
  for (let target of objects) {
    prepare(target);
    if (target instanceof Int32Array) { continue; }  // issue engine:4460
    arktest.assertTrue(Reflect.isExtensible(target));
    Object.preventExtensions(target);
    arktest.assertFalse(Reflect.isExtensible(target));
  }
})();

(function testReflectGetOwnPropertyDescriptorArity() {
  arktest.assertEQ(2, Reflect.getOwnPropertyDescriptor.length);
})();


(function testReflectGetOwnPropertyDescriptorOnNonObject() {
  arktest.expectThrow(
    function() { Reflect.getOwnPropertyDescriptor(); },
    ((e: Error): boolean => e instanceof TypeError)
  );
  arktest.expectThrow(function() { Reflect.getOwnPropertyDescriptor(42); },
      TypeError);
  arktest.expectThrow(function() { Reflect.getOwnPropertyDescriptor(null); },
      TypeError);
})();


(function testReflectGetOwnPropertyDescriptorKeyConversion() {
  let target = {bla: 42};
  let a = { [Symbol.toPrimitive]: function() { return 'bla' } };
  let b = { [Symbol.toPrimitive]: function() { throw 'gaga' } };
  arktest.assertEQ(42, Reflect.getOwnPropertyDescriptor(target, a).value);
  arktest.expectThrow(() => Reflect.getOwnPropertyDescriptor(target, b), 'gaga');
})();

(function testReflectOwnKeysArity() {
  arktest.assertEQ(1, Reflect.ownKeys.length);
})();


(function testReflectOwnKeysOnNonObject() {
  arktest.expectThrow(function() { Reflect.ownKeys(); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.ownKeys(42); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.ownKeys(null); }, ((e: Error): boolean => e instanceof TypeError));
})();


(function testReflectOwnKeysOnObject(){
  arktest.assertEQ(['z', 'y', 'x'], Reflect.ownKeys({z: 3, y: 2, x: 1}));
  arktest.assertEQ(['length'], Reflect.ownKeys([]));

  const s1 = Symbol('foo');
  const s2 = Symbol('bar');
  const obj = { [s1]: 0, 'bla': 0, 42: 0, '0': 0,
      [s2]: 0, '-1': 0, '88': 0, 'aaa': 0 };
  arktest.assertEQ(['0', '42', '88', 'bla', '-1', 'aaa', s1, s2],
      Reflect.ownKeys(obj));
  // Force dict-mode elements.
  delete obj[0];
  arktest.assertEQ(['42', '88', 'bla', '-1', 'aaa', s1, s2],
      Reflect.ownKeys(obj));
  // Force dict-mode properties.
  delete obj['bla'];
  arktest.assertEQ(['42', '88', '-1', 'aaa', s1, s2], Reflect.ownKeys(obj));
})();


(function testReflectPreventExtensionsArity() {
  arktest.assertEQ(1, Reflect.preventExtensions.length);
})();


(function testReflectPreventExtensionsOnNonObject() {
  arktest.expectThrow(function() { Reflect.preventExtensions(); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.preventExtensions(42); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { Reflect.preventExtensions(null); }, ((e: Error): boolean => e instanceof TypeError));
})();
