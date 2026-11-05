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

///////////////////////////////////////////////////////////////////////////////

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0194: Parameter declaration should have an explicit type annotation."
---*/

function testStringify(expected, object) {
  // Test fast case that bails out to slow case.
  arktest.assertEQ(expected, JSON.stringify(object));
  // Test slow case.
  arktest.assertEQ(expected, JSON.stringify(object, (key, value) => value));
  // Test gap.
  arktest.assertEQ(JSON.stringify(object, null, '='),
               JSON.stringify(object, (key, value) => value, '='));
}


// Test serializing a proxy, a function proxy, and objects that contain them.

const handler1 = {
  get: function(target, name) {
    return name.toUpperCase();
  },
  ownKeys: function() {
    return ['a', 'b', 'c'];
  },
  getOwnPropertyDescriptor: function() {
    return { enumerable: true, configurable: true };
  }
}

const proxy1 = new Proxy({}, handler1);
testStringify('{"a":"A","b":"B","c":"C"}', proxy1);

const proxyFun = new Proxy(() => {}, handler1);
arktest.assertTrue(typeof(proxyFun) === 'function');
testStringify(undefined, proxyFun);
testStringify('[1,null]', [1, proxyFun]);

handler1.apply = function() { return 666; };
testStringify(undefined, proxyFun);
testStringify('[1,null]', [1, proxyFun]);

const parent1a = { b: proxy1 };
testStringify('{"b":{"a":"A","b":"B","c":"C"}}', parent1a);
testStringify('{"b":{"a":"A","b":"B","c":"C"}}', parent1a);

const parent1b = { a: 123, b: proxy1, c: true };
testStringify('{"a":123,"b":{"a":"A","b":"B","c":"C"},"c":true}', parent1b);

const parent1c = [123, proxy1, true];
testStringify('[123,{"a":"A","b":"B","c":"C"},true]', parent1c);


// Proxy with side effect.

const handler2 = {
  get: function(target, name) {
    delete parent2.c;
    return name.toUpperCase();
  },
  ownKeys: function() {
    return ['a', 'b', 'c'];
  },
  getOwnPropertyDescriptor: function() {
    return { enumerable: true, configurable: true };
  }
}

const proxy2 = new Proxy({}, handler2);
let parent2 = { a: 'delete', b: proxy2, c: 'remove' };
const expected2 = '{"a":"delete","b":{"a":"A","b":"B","c":"C"}}';
arktest.assertEQ(expected2, JSON.stringify(parent2));
parent2.c = 'remove';  // Revert side effect.
arktest.assertEQ(expected2, JSON.stringify(parent2, undefined, 0));


// Proxy with a get function that uses the receiver argument.

const handler3 = {
  get: function(target, name, receiver) {
    if (name == 'valueOf' || name === Symbol.toPrimitive) {
      return function() { return 'proxy' };
    };
    if (typeof name !== 'symbol') {
      return name + '(' + receiver + ')';
    }
  },
  ownKeys: function() {
    return ['a', 'b', 'c'];
  },
  getOwnPropertyDescriptor: function() {
    return { enumerable: true, configurable: true };
  }
}

const proxy3 = new Proxy({}, handler3);
const parent3 = { x: 123, y: proxy3 }
testStringify('{"x":123,"y":{"a":"a(proxy)","b":"b(proxy)","c":"c(proxy)"}}',
              parent3);


// Empty proxy.

const handler4 = {
  get: function(target, name) {
    return 0;
  },
  has: function() {
    return true;
  },
  getOwnPropertyDescriptor: function(target, name) {
    return { enumerable: false };
  }
}

const proxy4 = new Proxy({}, handler4);
testStringify('{}', proxy4);
testStringify('{"a":{}}', { a: proxy4 });


// Proxy that provides a toJSON function that uses this.

const handler5 = {
  get: function(target, name) {
    if (name == 'z') {
      return 97000;
    }
    return function(key) { return key.charCodeAt(0) + this.z; };
  },
  ownKeys: function(target) {
    return ['toJSON', 'z'];
  },
  has: function() {
    return true;
  },
  getOwnPropertyDescriptor: function(target, name) {
    return { enumerable: true };
  }
}

const proxy5 = new Proxy({}, handler5);
testStringify('{"a":97097}', { a: proxy5 });


// Proxy that provides a toJSON function that returns undefined.

const handler6 = {
  get: function(target, name) {
    return function(key) { return undefined; };
  },
  ownKeys: function(target) {
    return ['toJSON'];
  },
  has: function() {
    return true;
  },
  getOwnPropertyDescriptor: function(target, name) {
    return { enumerable: true };
  }
}

const proxy6 = new Proxy({}, handler6);
testStringify('[1,null,true]', [1, proxy6, true]);
testStringify('{"a":1,"c":true}', {a: 1, b: proxy6, c: true});


// Object containing a proxy that changes the parent's properties.

const handler7 = {
  get: function(target, name) {
    delete parent7.a;
    delete parent7.c;
    parent7.e = '5';
    return name.toUpperCase();
  },
  ownKeys: function() {
    return ['a', 'b', 'c'];
  },
  getOwnPropertyDescriptor: function() {
    return { enumerable: true, configurable: true };
  }
}

const proxy7 = new Proxy({}, handler7);
let parent7 = { a: '1', b: proxy7, c: '3', d: '4' };
arktest.assertEQ('{"a":"1","b":{"a":"A","b":"B","c":"C"},"d":"4"}',
             JSON.stringify(parent7));
arktest.assertEQ('{"b":{"a":"A","b":"B","c":"C"},"d":"4","e":"5"}',
             JSON.stringify(parent7));


// (Proxy handler to log trap calls)

let log = [];
const logger = {};
const handler = new Proxy({}, logger);

logger.get = function(t, trap, r) {
  return function() {
    log.push([trap, ...arguments]);
    return Reflect[trap](...arguments);
  }
};


// Object is a callable proxy

log.length = 0;
let target = () => 42;
let proxy = new Proxy(target, handler);
arktest.assertTrue(typeof proxy === 'function');

arktest.assertEQ(undefined, JSON.stringify(proxy));
arktest.assertEQ(1, log.length)
log.forEach((_, arrayIndex) => {
  let i = arrayIndex.toString();
  arktest.assertEQ(target, log[i][1]);
});

arktest.assertEQ(['get', target, 'toJSON', proxy], log[0]);


// Object is a non-callable non-arraylike proxy

log.length = 0;
let target = {foo: 42}
let proxy = new Proxy(target, handler);
arktest.assertFalse(Array.isArray(proxy));

arktest.assertEQ('{"foo":42}', JSON.stringify(proxy));
arktest.assertEQ(4, log.length)
log.forEach((_, arrayIndex) => {
  let i = arrayIndex.toString();
  arktest.assertEQ(target, log[i][1]);
});

arktest.assertEQ(
    ['get', target, 'toJSON', proxy], log[0]);
arktest.assertEQ(
    ['ownKeys', target], log[1]);  // EnumerableOwnNames
arktest.assertEQ(
    ['getOwnPropertyDescriptor', target, 'foo'], log[2]);  // EnumerableOwnNames
arktest.assertEQ(
    ['get', target, 'foo', proxy], log[3]);


// Object is an arraylike proxy

log.length = 0;
let target = [42];
let proxy = new Proxy(target, handler);
arktest.assertTrue(Array.isArray(proxy));

arktest.assertEQ('[42]', JSON.stringify(proxy));
arktest.assertEQ(3, log.length)
log.forEach((_, arrayIndex) => {
  let i = arrayIndex.toString();
  arktest.assertEQ(target, log[i][1]);
});

arktest.assertEQ(['get', target, 'toJSON', proxy], log[0]);
arktest.assertEQ(['get', target, 'length', proxy], log[1]);
arktest.assertEQ(['get', target, '0', proxy], log[2]);


// Replacer is a callable proxy

log.length = 0;
let object = {0: 'foo', 1: 666};
let target = (key, val) => key == '1' ? val + 42 : val;
let proxy = new Proxy(target, handler);
arktest.assertTrue(typeof proxy === 'function');

arktest.assertEQ('{"0":"foo","1":708}', JSON.stringify(object, proxy));
arktest.assertEQ(3, log.length)
log.forEach((_, arrayIndex) => {
  let i = arrayIndex.toString();
  arktest.assertEQ(target, log[i][1]);
});

arktest.assertEQ(4, log[0].length)
arktest.assertEQ('apply', log[0][0]);
arktest.assertEQ('', log[0][3][0]);
arktest.assertEQ({0: 'foo', 1: 666}, log[0][3][1]);
arktest.assertEQ(4, log[1].length)
arktest.assertEQ('apply', log[1][0]);
arktest.assertEQ(['0', 'foo'], log[1][3]);
arktest.assertEQ(4, log[2].length)
arktest.assertEQ('apply', log[2][0]);
arktest.assertEQ(['1', 666], log[2][3]);


// Replacer is an arraylike proxy

log.length = 0;
let object = {0: 'foo', 1: 666};
let target = [0];
let proxy = new Proxy(target, handler);
arktest.assertTrue(Array.isArray(proxy));

arktest.assertEQ('{"0":"foo"}', JSON.stringify(object, proxy));
arktest.assertEQ(2, log.length)
log.forEach((_, arrayIndex) => {
  let i = arrayIndex.toString();
  arktest.assertEQ(target, log[i][1]);
});

arktest.assertEQ(['get', target, 'length', proxy], log[0]);
arktest.assertEQ(['get', target, '0', proxy], log[1]);


// Replacer is an arraylike proxy and object is an array

log.length = 0;
let object = ['foo', 42];
let target = [0];
let proxy = new Proxy(target, handler);
arktest.assertTrue(Array.isArray(proxy));

arktest.assertEQ('["foo",42]', JSON.stringify(object, proxy));
arktest.assertEQ(2, log.length);
log.forEach((_, arrayIndex) => {
  let i = arrayIndex.toString();
  arktest.assertEQ(target, log[i][1]);
});

arktest.assertEQ(['get', target, 'length', proxy], log[0]);
arktest.assertEQ(['get', target, '0', proxy], log[1]);


// Replacer is an arraylike proxy with a non-trivial length

let getTrap = function(t, key) {
  if (key === 'length') {
    return {[Symbol.toPrimitive]() {return 42}};
  }
  if (key === '41') {
    return 'foo';
  }
  if (key === '42') { return 'bar'; }
};
let target = [];
let proxy = new Proxy(target, {get: getTrap});
arktest.assertTrue(Array.isArray(proxy));
let object = {foo: true, bar: 666};
arktest.assertEQ('{"foo":true}', JSON.stringify(object, proxy));


// Replacer is an arraylike proxy with a bogus length

let getTrap = function(t, key) {
  if (key === 'length') {
    return Symbol();
  }
  if (key === '41') {
    return 'foo';
  }
  if (key === '42') {
    return 'bar';
  }
};
let target = [];
let proxy = new Proxy(target, {get: getTrap});
arktest.assertTrue(Array.isArray(proxy));
let object = {foo: true, bar: 666};
arktest.expectThrow(() => JSON.stringify(object, proxy), ((e: Error): boolean => e instanceof TypeError));


// Replacer returns a non-callable non-arraylike proxy

log.length = 0;
let object = ['foo', 42];
let target = {baz: 5};
let proxy = new Proxy(target, handler);
let replacer = (key, val) => key === '1' ? proxy : val;

arktest.assertEQ('["foo",{"baz":5}]', JSON.stringify(object, replacer));
arktest.assertEQ(3, log.length);
log.forEach((_, arrayIndex) => {
  let i = arrayIndex.toString();
  arktest.assertEQ(target, log[i][1]);
});

arktest.assertEQ(['ownKeys', target], log[0]);
arktest.assertEQ(['getOwnPropertyDescriptor', target, 'baz'], log[1]);


// Replacer returns an arraylike proxy

log.length = 0;
let object = ['foo', 42];
let target = ['bar'];
let proxy = new Proxy(target, handler);
let replacer = (key, val) => key === '1' ? proxy : val;

arktest.assertEQ('["foo",["bar"]]', JSON.stringify(object, replacer));
arktest.assertEQ(2, log.length);
log.forEach((_, arrayIndex) => {
  let i = arrayIndex.toString();
  arktest.assertEQ(target, log[i][1]);
});

arktest.assertEQ(['get', target, 'length', proxy], log[0]);
arktest.assertEQ(['get', target, '0', proxy], log[1]);


// Replacer returns an arraylike proxy with a non-trivial length

let getTrap = function(t, key) {
  if (key === 'length') {
    return {[Symbol.toPrimitive]() {return 3}};
  }
  if (key === '2') {
    return 'baz';
  }
  if (key === '3') {
    return 'bar';
  }
};
let target = [];
let proxy = new Proxy(target, {get: getTrap});
let replacer = (key, val) => key === 'goo' ? proxy : val;
let object = {foo: true, goo: false};
arktest.assertEQ('{"foo":true,"goo":[null,null,"baz"]}',
    JSON.stringify(object, replacer));


// Replacer returns an arraylike proxy with a bogus length

let getTrap = function(t, key) {
  if (key === 'length') {
    return Symbol();
  }
  if (key === '2') {
    return 'baz';
  }
  if (key === '3') { return 'bar'; }
};
let target = [];
let proxy = new Proxy(target, {get: getTrap});
let replacer = (key, val) => key === 'goo' ? proxy : val;
let object = {foo: true, goo: false};
arktest.expectThrow(() => JSON.stringify(object, replacer), ((e: Error): boolean => e instanceof TypeError));


// Replacer returns a callable proxy

log.length = 0;
let target = () => 666;
let proxy = new Proxy(target, handler);
let replacer = (key, val) => key === '1' ? proxy : val;

arktest.assertEQ('["foo",null]', JSON.stringify(['foo', 42], replacer));
arktest.assertEQ(0, log.length);

arktest.assertEQ('{"0":"foo"}', JSON.stringify({0: 'foo', 1: 42}, replacer));
arktest.assertEQ(0, log.length);



///////////////////////////////////////////////////////////////////////////////
// JSON.parse


// Reviver is a callable proxy

log.length = 0;
let target = () => 42;
let proxy = new Proxy(target, handler);
arktest.assertTrue(typeof proxy === 'function');

arktest.assertEQ(42, JSON.parse('[true, false]', proxy));
arktest.assertEQ(3, log.length);
log.forEach((_, arrayIndex) => {
  let i = arrayIndex.toString();
  arktest.assertEQ(target, log[i][1]);
});

arktest.assertEQ(4, log[0].length);
arktest.assertEQ('apply', log[0][0]);
arktest.assertEQ(['0', true, {source:'true'}], log[0][3]);
arktest.assertEQ(4, log[1].length);
arktest.assertEQ('apply', log[1][0]);
arktest.assertEQ(['1', false, {source:'false'}], log[1][3]);
arktest.assertEQ(4, log[2].length);
arktest.assertEQ('apply', log[2][0]);
arktest.assertEQ(['', [42, 42], {}], log[2][3]);


// Reviver plants a non-arraylike proxy into a yet-to-be-visited property

log.length = 0;
let target = {baz: 42};
let proxy = new Proxy(target, handler);
let reviver = function(p, v) {
  if (p === 'baz') {
    return 5;
  }
  if (p === 'foo') {
    this.bar = proxy;
  }
  return v;
}

arktest.assertEQ({foo: 0, bar: proxy}, JSON.parse('{"foo":0,"bar":1}', reviver));
arktest.assertEQ(4, log.length);
log.forEach((_, arrayIndex) => {
  let i = arrayIndex.toString();
  arktest.assertEQ(target, log[i][1]);
});

arktest.assertEQ(['ownKeys', target], log[0]);
arktest.assertEQ(['getOwnPropertyDescriptor', target, 'baz'], log[1]);
arktest.assertEQ(['get', target, 'baz', proxy], log[2]);
arktest.assertEQ(['defineProperty', target, 'baz',
    {value: 5, configurable: true, writable: true, enumerable: true}], log[3]);


// Reviver plants an arraylike proxy into a yet-to-be-visited property

log.length = 0;
let target = [42];
let proxy = new Proxy(target, handler);
arktest.assertTrue(Array.isArray(proxy));
let reviver = function(p, v) {
  if (p === '0') {
    return undefined;
  }
  if (p === 'foo') { this.bar = proxy; }
  return v;
}

const result = JSON.parse('{"foo":0,"bar":1}', reviver);
arktest.assertEQ({foo: 0, bar: proxy}, result);
arktest.assertEQ(result.bar, proxy);
arktest.assertEQ(3, log.length);
log.forEach((_, arrayIndex) => {
  let i = arrayIndex.toString();
  arktest.assertEQ(target, log[i][1]);
});

arktest.assertEQ(['get', target, 'length', proxy], log[0]);
arktest.assertEQ(['get', target, '0', proxy], log[1]);
arktest.assertEQ(['deleteProperty', target, '0'], log[2]);

proxy = new Proxy([], {
  get: function(target, property) {
    if (property == 'length') {
      return 7;
    }
    return 0;
  },
});
arktest.assertEQ('[[0,0,0,0,0,0,0]]', JSON.stringify([proxy]));

proxy = new Proxy([], {
  get: function(target, property) {
    if (property == 'length') { return 1E40; }
    return 0;
  },
});
arktest.expectThrow(() => JSON.stringify([proxy]), ((e: Error): boolean => e instanceof RangeError));

log = [];
proxy = new Proxy({}, {
  ownKeys: function() {
    log.push('ownKeys');
    return ['0', 'a', 'b'];
  },
  get: function(target, property) {
    log.push('get ' + property);
    return property.toUpperCase();
  },
  getOwnPropertyDescriptor: function(target, property) {
    log.push('descriptor ' + property);
    return {enumerable: true, configurable: true};
  },
  isExtensible: assertUnreachable,
  has: assertUnreachable,
  getPrototypeOf: assertUnreachable,
  setPrototypeOf: assertUnreachable,
  preventExtensions: assertUnreachable,
  setPrototypeOf: assertUnreachable,
  defineProperty: assertUnreachable,
  set: assertUnreachable,
  deleteProperty: assertUnreachable,
  apply: assertUnreachable,
  construct: assertUnreachable,
});

arktest.assertEQ('[{"0":"0","a":"A","b":"B"}]', JSON.stringify([proxy]));
arktest.assertEQ(['get toJSON',
              'ownKeys',
              'descriptor 0',
              'descriptor a',
              'descriptor b',
              'get 0',
              'get a',
              'get b'], log);
