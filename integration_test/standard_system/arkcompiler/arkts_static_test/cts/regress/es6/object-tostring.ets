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

const global = this;

const funs = {
  Object:   [ Object ],
  Function: [ Function ],
  Array:    [ Array ],
  String:   [ String ],
  Boolean:  [ Boolean ],
  Number:   [ Number ],
  Date:     [ Date ],
  RegExp:   [ RegExp ],
  Error:    [ Error, TypeError, RangeError, SyntaxError, ReferenceError,
              EvalError, URIError ]
};
for (let f in funs) {
  for (let i in funs[f]) {

    arktest.assertEQ('[object ' + f + ']',
      Object.prototype.toString.call(new funs[f][i]),
      funs[f][i]);
    arktest.assertEQ('[object Function]',
      Object.prototype.toString.call(funs[f][i]),
      funs[f][i]);
  }
}

function testToStringTag(className) {
  // Using builtin toStringTags
  let obj = {};
  obj[Symbol.toStringTag] = className;
  arktest.assertEQ('[object ' + className + ']',
               Object.prototype.toString.call(obj));

  // Getter throws
  obj = {};
  Object.defineProperty(obj, Symbol.toStringTag, {
    get: function() { throw className; }
  });
  arktest.expectThrow(function() {
    Object.prototype.toString.call(obj);
  }, className);

  // Getter does not throw
  obj = {};
  Object.defineProperty(obj, Symbol.toStringTag, {
    get: function() { return className; }
  });
  arktest.assertEQ('[object ' + className + ']',
               Object.prototype.toString.call(obj));

  // Custom, non-builtin toStringTags
  obj = {};
  obj[Symbol.toStringTag] = 'X' + className;
  arktest.assertEQ('[object X' + className + ']',
               Object.prototype.toString.call(obj));

  // With getter
  obj = {};
  Object.defineProperty(obj, Symbol.toStringTag, {
    get: function() { return 'X' + className; }
  });
  arktest.assertEQ('[object X' + className + ']',
               Object.prototype.toString.call(obj));

  // Undefined toStringTag should return [object className]
  let obj = className === 'Arguments' ?
      (function() { return arguments; })() : new global[className];
  obj[Symbol.toStringTag] = undefined;
  arktest.assertEQ('[object ' + className + ']',
               Object.prototype.toString.call(obj));

  // With getter
  let obj = className === 'Arguments' ?
      (function() { return arguments; })() : new global[className];
  Object.defineProperty(obj, Symbol.toStringTag, {
    get: function() { return undefined; }
  });
  arktest.assertEQ('[object ' + className + ']',
               Object.prototype.toString.call(obj));
}

[
  'Arguments',
  'Array',
  'Boolean',
  'Date',
  'Error',
  'Function',
  'Number',
  'RegExp',
  'String'
].forEach(testToStringTag);

function testToStringTagNonString(value) {
  let obj = {};
  obj[Symbol.toStringTag] = value;
  arktest.assertEQ('[object Object]', Object.prototype.toString.call(obj));

  // With getter
  obj = {};
  Object.defineProperty(obj, Symbol.toStringTag, {
    get: function() { return value; }
  });
  arktest.assertEQ('[object Object]', Object.prototype.toString.call(obj));
}

[
  null,
  function() {},
  [],
  {},
  /regexp/,
  42,
  Symbol('sym'),
  new Date(),
  (function() { return arguments; })(),
  true,
  new Error('oops'),
  Object('str')
].forEach(testToStringTagNonString);

function testObjectToStringPropertyDesc() {
  const desc = Object.getOwnPropertyDescriptor(Object.prototype, 'toString');
  arktest.assertTrue(desc.writable);
  arktest.assertFalse(desc.enumerable);
  arktest.assertTrue(desc.configurable);
}
testObjectToStringPropertyDesc();

function testObjectToStringOnNonStringValue(obj) {
  Object.defineProperty(obj, Symbol.toStringTag, { value: 1 });
  arktest.assertEQ('[object Object]', ({}).toString.call(obj));
}
testObjectToStringOnNonStringValue({});


// Proxies

function assertTag(tag, obj) {
  arktest.assertEQ('[object ' + tag + ']', Object.prototype.toString.call(obj));
}

assertTag('Object', new Proxy({}, {}));
assertTag('Array', new Proxy([], {}));
assertTag('Function', new Proxy(() => 42, {}));
assertTag('Foo', new Proxy(() => 42, {get() {return 'Foo'}}));
assertTag('Function', new Proxy(() => 42, {get() {return 666}}));

let revocable = Proxy.revocable([], {});
revocable.revoke();
arktest.expectThrow(
  () => Object.prototype.toString.call(revocable.proxy),
  ((e: Error): boolean => e instanceof TypeError)
);

const handler = {};
revocable = Proxy.revocable([], handler);
// The first get() call, i.e., toString() revokes the proxy
handler.get = () => revocable.revoke();
arktest.assertEQ('[object Array]', Object.prototype.toString.call(revocable.proxy));
arktest.expectThrow(
  () => Object.prototype.toString.call(revocable.proxy),
  ((e: Error): boolean => e instanceof TypeError)
);

revocable = Proxy.revocable([], handler);
handler.get = () => {revocable.revoke(); return 'value';};
arktest.assertEQ('[object value]', Object.prototype.toString.call(revocable.proxy));
arktest.expectThrow(
  () => Object.prototype.toString.call(revocable.proxy),
  ((e: Error): boolean => e instanceof TypeError)
);


revocable = Proxy.revocable(function() {}, handler);
handler.get = () => revocable.revoke();
arktest.assertEQ('[object Function]', Object.prototype.toString.call(revocable.proxy));
arktest.expectThrow(
  () => Object.prototype.toString.call(revocable.proxy),
  ((e: Error): boolean => e instanceof TypeError)
);

function* gen() { yield 1; }

assertTag('GeneratorFunction', gen);
Object.defineProperty(gen, Symbol.toStringTag, {writable: true});
gen[Symbol.toStringTag] = 'different string';
assertTag('different string', gen);
gen[Symbol.toStringTag] = 1;
assertTag('Function', gen);

function overwriteToStringTagWithNonStringValue(tag, obj) {
  assertTag(tag, obj);

  Object.defineProperty(obj, Symbol.toStringTag, {
    configurable: true,
    value: 'different string'
  });
  assertTag('different string', obj);

  testObjectToStringOnNonStringValue(obj);
}

overwriteToStringTagWithNonStringValue('global', global);
overwriteToStringTagWithNonStringValue('Generator', gen());

const arrayBuffer = new ArrayBuffer();
overwriteToStringTagWithNonStringValue('ArrayBuffer', arrayBuffer);
overwriteToStringTagWithNonStringValue('DataView', new DataView(arrayBuffer));

overwriteToStringTagWithNonStringValue('Int8Array', new Int8Array());
overwriteToStringTagWithNonStringValue('Uint8Array', new Uint8Array());
overwriteToStringTagWithNonStringValue('Uint8ClampedArray',
  new Uint8ClampedArray());
overwriteToStringTagWithNonStringValue('Int16Array', new Int16Array());
overwriteToStringTagWithNonStringValue('Uint16Array', new Uint16Array());
overwriteToStringTagWithNonStringValue('Int32Array', new Int32Array());
overwriteToStringTagWithNonStringValue('Uint32Array', new Uint32Array());
overwriteToStringTagWithNonStringValue('Float32Array', new Float32Array());
overwriteToStringTagWithNonStringValue('Float64Array', new Float64Array());

const set = new Set();
const map = new Map();

overwriteToStringTagWithNonStringValue('Set', set);
overwriteToStringTagWithNonStringValue('Map', map);

overwriteToStringTagWithNonStringValue('Set Iterator', set[Symbol.iterator]());
overwriteToStringTagWithNonStringValue('Map Iterator', map[Symbol.iterator]());

overwriteToStringTagWithNonStringValue('WeakSet', new WeakSet());
overwriteToStringTagWithNonStringValue('WeakMap', new WeakMap());

overwriteToStringTagWithNonStringValue('Promise', new Promise(function() {}));
