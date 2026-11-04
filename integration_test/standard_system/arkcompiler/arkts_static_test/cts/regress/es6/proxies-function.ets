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
expected_out_1: >-
  Semantic error ESE0174: Cannot infer type for handler because class composite
  needs an explicit target type
---*/

const handler = {
  get : function(r, n) { return n == 'length' ? 2 : undefined }
}


// Calling (call, Function.prototype.call, Function.prototype.apply,
//          Function.prototype.bind).

const globalObject = this
let receiver

function testCall(isStrict, callTrap) {
  arktest.assertEQ(42, callTrap(undefined, undefined, [5, 37]))

  let handler = {
    get: function(r, k) {
      return k == 'length' ? 2 : Function.prototype[k]
    },
    apply: callTrap
  }
  let f = new Proxy(()=>{}, handler)
  let o = {f: f}
  globalObject.f = f

  receiver = 333
  arktest.assertEQ(42, f(11, 31))
  receiver = 333
  arktest.assertEQ(42, o.f(10, 32))
  arktest.assertEQ(o, receiver)
  receiver = 333
  arktest.assertEQ(42, o['f'](9, 33))
  arktest.assertEQ(o, receiver)
  receiver = 333
  arktest.assertEQ(42, (1, o).f(8, 34))
  arktest.assertEQ(o, receiver)
  receiver = 333
  arktest.assertEQ(42, (1, o)['f'](7, 35))
  arktest.assertEQ(o, receiver)
  receiver = 333
  arktest.assertEQ(42, f.call(o, 32, 10))
  arktest.assertEQ(o, receiver)
  receiver = 333
  arktest.assertEQ(42, f.call(undefined, 33, 9))
  receiver = 333
  arktest.assertEQ(42, f.call(null, 33, 9))
  receiver = 333
  arktest.assertEQ(44, f.call(2, 21, 23))
  arktest.assertEQ(2, receiver.valueOf())
  receiver = 333
  arktest.assertEQ(42, Function.prototype.call.call(f, o, 20, 22))
  arktest.assertEQ(o, receiver)
  receiver = 333
  arktest.assertEQ(43, Function.prototype.call.call(f, null, 20, 23))
  arktest.assertEQ(44, Function.prototype.call.call(f, 2, 21, 23))
  arktest.assertEQ(2, receiver.valueOf())
  receiver = 333
  arktest.assertEQ(32, f.apply(o, [16, 16]))
  arktest.assertEQ(o, receiver)
  receiver = 333
  arktest.assertEQ(32, Function.prototype.apply.call(f, o, [17, 15]))
  arktest.assertEQ(o, receiver)
  receiver = 333
  arktest.assertEQ(42, ArkTools.call(f, o, 11, 31));
  arktest.assertEQ(o, receiver)
  receiver = 333
  arktest.assertEQ(42, ArkTools.call(f, null, 11, 31));
  receiver = 333

  const ff = Function.prototype.bind.call(f, o, 12)
  arktest.assertTrue(ff.length <= 1)  // TODO(rossberg): Not spec'ed yet, be lax.
  receiver = 333
  arktest.assertEQ(42, ff(30))
  arktest.assertEQ(o, receiver)
  receiver = 333
  arktest.assertEQ(33, Function.prototype.call.call(ff, {}, 21))
  arktest.assertEQ(o, receiver)
  receiver = 333
  arktest.assertEQ(32, Function.prototype.apply.call(ff, {}, [20]))
  arktest.assertEQ(o, receiver)
  receiver = 333
  arktest.assertEQ(23, ArkTools.call(ff, {}, 11));
  arktest.assertEQ(o, receiver)
  receiver = 333
  arktest.assertEQ(23, ArkTools.call(ff, {}, 11, 3));
  arktest.assertEQ(o, receiver)
  receiver = 333

  const fff = Function.prototype.bind.call(ff, o, 30)
  arktest.assertEQ(0, fff.length)
  receiver = 333
  arktest.assertEQ(42, fff())
  arktest.assertEQ(o, receiver)
  receiver = 333
  arktest.assertEQ(42, Function.prototype.call.call(fff, {}))
  arktest.assertEQ(o, receiver)
  receiver = 333
  arktest.assertEQ(42, Function.prototype.apply.call(fff, {}))
  arktest.assertEQ(o, receiver)
  receiver = 333
  arktest.assertEQ(42, ArkTools.call(fff, {}));
  arktest.assertEQ(o, receiver)
  receiver = 333
  arktest.assertEQ(42, ArkTools.call(fff, {}, 11, 3))
  arktest.assertEQ(o, receiver)
  receiver = 333

  let f = new Proxy(()=>{}, {apply: callTrap})
  receiver = 333
  arktest.assertEQ(42, f(11, 31))
  let o = {f: f}
  receiver = 333
  arktest.assertEQ(42, o.f(10, 32))
  arktest.assertEQ(o, receiver)
  receiver = 333
  arktest.assertEQ(42, o['f'](9, 33))
  arktest.assertEQ(o, receiver)
  receiver = 333
  arktest.assertEQ(42, (1, o).f(8, 34))
  arktest.assertEQ(o, receiver)
  receiver = 333
  arktest.assertEQ(42, (1, o)['f'](7, 35))
  arktest.assertEQ(o, receiver)
  receiver = 333
  arktest.assertEQ(42, Function.prototype.call.call(f, o, 20, 22))
  arktest.assertEQ(o, receiver)
  receiver = 333
  arktest.assertEQ(32, Function.prototype.apply.call(f, o, [17, 15]))
  arktest.assertEQ(o, receiver)
  receiver = 333
  arktest.assertEQ(23, ArkTools.call(f, o, 11, 12))
  arktest.assertEQ(o, receiver)
  receiver = 333
}

testCall(false, function(_, that, [x, y]) {
  receiver = that
  return x + y
})

testCall(true, function(_, that, args) {
  'use strict'
  receiver = that
  return args[0] + args[1]
})

testCall(false, function() {
  receiver = arguments[1]
  return arguments[2][0] + arguments[2][1]
})

testCall(false, new Proxy(function(_, that, [x, y]) {
    receiver = that
    return x + y
  }, handler))

testCall(true, new Proxy(function(_, that, args) {
    'use strict'
    receiver = that
    return args[0] + args[1]
  }, handler))

testCall(false, Object.freeze(new Proxy(function(_, that, [x, y]) {
    receiver = that
    return x + y
  }, handler)))



// Using intrinsics as call traps.

function testCallIntrinsic(type, callTrap) {
  let f = new Proxy(()=>{}, {apply: (_, that, args) => callTrap(...args)})
  let x = f()
  arktest.assertTrue(typeof x == type)
}

testCallIntrinsic('boolean', Boolean)
testCallIntrinsic('number', Number)
testCallIntrinsic('string', String)
testCallIntrinsic('object', Object)
testCallIntrinsic('function', Function)



// Throwing from call trap.

function testCallThrow(callTrap) {
  let f = new Proxy(()=>{}, {apply: callTrap})
  arktest.expectThrow(() => f(11), 'myexn')
  arktest.expectThrow(() => ({x: f}).x(11), 'myexn')
  arktest.expectThrow(() => ({x: f})['x'](11), 'myexn')
  arktest.expectThrow(() => Function.prototype.call.call(f, {}, 2), 'myexn')
  arktest.expectThrow(() => Function.prototype.apply.call(f, {}, [1]), 'myexn')
  arktest.expectThrow(() => ArkTools.call(f, {}), 'myexn')
  arktest.expectThrow(() => ArkTools.call(f, {}, 1, 2), 'myexn')

  let f = Object.freeze(new Proxy(()=>{}, {apply: callTrap}))
  arktest.expectThrow(() => f(11), 'myexn')
  arktest.expectThrow(() => ({x: f}).x(11), 'myexn')
  arktest.expectThrow(() => ({x: f})['x'](11), 'myexn')
  arktest.expectThrow(() => Function.prototype.call.call(f, {}, 2), 'myexn')
  arktest.expectThrow(() => Function.prototype.apply.call(f, {}, [1]), 'myexn')
  arktest.expectThrow(() => ArkTools.call(f, {}), 'myexn')
  arktest.expectThrow(() => ArkTools.call(f, {}, 1, 2), 'myexn')
}

testCallThrow(function() { throw 'myexn' })
testCallThrow(new Proxy(() => {throw 'myexn'}, {}))
testCallThrow(Object.freeze(new Proxy(() => {throw 'myexn'}, {})))



// Construction (new).

const prototype = {myprop: 0}
let receiver

const handlerWithPrototype = {
  get: function(r, n) {
    if (n == 'length') {
      return 2;
    }
    arktest.assertEQ('prototype', n);
    return prototype;
  }
}

const handlerSansPrototype = {
  get: function(r, n) {
    if (n == 'length') { return 2; }
    arktest.assertEQ('prototype', n);
    return undefined;
  }
}

function returnUndef(_, args, newt) {
  'use strict';
  newt.sum = args[0] + args[1];
}

function returnThis(x, y) {
  'use strict';
  receiver = this;
  this.sum = x + y;
  return this;
}

function returnNew(_, args, newt) {
  'use strict';
  return {sum: args[0] + args[1]};
}

function returnNewWithProto(_, args, newt) {
  'use strict';
  const result = Object.create(prototype);
  result.sum = args[0] + args[1];
  return result;
}

function testConstruct(proto, constructTrap) {
  testConstruct2(proto, constructTrap, handlerWithPrototype)
  testConstruct2(proto, constructTrap, handlerSansPrototype)
}

function testConstruct2(proto, constructTrap, handler) {
  let f = new Proxy(function(){}, {construct: constructTrap})
  let o = new f(11, 31)
  arktest.assertEQ(42, o.sum)
  arktest.assertEQ(proto, Object.getPrototypeOf(o))

  let f = Object.freeze(new Proxy(function(){}, {construct: constructTrap}))
  let o = new f(11, 32)
  arktest.assertEQ(43, o.sum)
  arktest.assertEQ(proto, Object.getPrototypeOf(o))
}

testConstruct(Object.prototype, returnNew)
testConstruct(prototype, returnNewWithProto)

testConstruct(Object.prototype, new Proxy(returnNew, {}))
testConstruct(prototype, new Proxy(returnNewWithProto, {}))

testConstruct(Object.prototype, Object.freeze(new Proxy(returnNew, {})))
testConstruct(prototype, Object.freeze(new Proxy(returnNewWithProto, {})))



// Throwing from the construct trap.

function testConstructThrow(trap) {
  let f = new Proxy(function(){}, {construct: trap});
  arktest.expectThrow(() => new f(11), 'myexn')
  Object.freeze(f)
  arktest.expectThrow(() => new f(11), 'myexn')
}

testConstructThrow(function() { throw 'myexn' })
testConstructThrow(new Proxy(function() { throw 'myexn' }, {}))
testConstructThrow(Object.freeze(new Proxy(function() { throw 'myexn' }, {})))



// Using function proxies as getters and setters.

let value
let receiver

function testAccessorCall(getterCallTrap, setterCallTrap) {
  const pgetter = new Proxy(()=>{}, {apply: getterCallTrap})
  const psetter = new Proxy(()=>{}, {apply: setterCallTrap})

  let o = {}
  const oo = Object.create(o)
  Object.defineProperty(o, 'a', {get: pgetter, set: psetter})
  Object.defineProperty(o, 'b', {get: pgetter})
  Object.defineProperty(o, 'c', {set: psetter})
  Object.defineProperty(o, '3', {get: pgetter, set: psetter})
  Object.defineProperty(oo, 'a', {value: 43})

  receiver = ''
  arktest.assertEQ(42, o.a)
  arktest.assertEQ(o, receiver)
  receiver = ''
  arktest.assertEQ(42, o.b)
  arktest.assertEQ(o, receiver)
  receiver = ''
  arktest.assertEQ(undefined, o.c)
  arktest.assertEQ('', receiver)
  receiver = ''
  arktest.assertEQ(42, o['a'])
  arktest.assertEQ(o, receiver)
  receiver = ''
  arktest.assertEQ(42, o[3])
  arktest.assertEQ(o, receiver)

  receiver = ''
  arktest.assertEQ(43, oo.a)
  arktest.assertEQ('', receiver)
  receiver = ''
  arktest.assertEQ(42, oo.b)
  arktest.assertEQ(oo, receiver)
  receiver = ''
  arktest.assertEQ(undefined, oo.c)
  arktest.assertEQ('', receiver)
  receiver = ''
  arktest.assertEQ(43, oo['a'])
  arktest.assertEQ('', receiver)
  receiver = ''
  arktest.assertEQ(42, oo[3])
  arktest.assertEQ(oo, receiver)

  receiver = ''
  arktest.assertEQ(50, o.a = 50)
  arktest.assertEQ(o, receiver)
  arktest.assertEQ(50, value)
  receiver = ''
  arktest.assertEQ(51, o.b = 51)
  arktest.assertEQ('', receiver)
  arktest.assertEQ(50, value)  // no setter
  arktest.expectThrow(function() { 'use strict'; o.b = 51 }, ((e: Error): boolean => e instanceof TypeError))
  receiver = ''
  arktest.assertEQ(52, o.c = 52)
  arktest.assertEQ(o, receiver)
  arktest.assertEQ(52, value)
  receiver = ''
  arktest.assertEQ(53, o['a'] = 53)
  arktest.assertEQ(o, receiver)
  arktest.assertEQ(53, value)
  receiver = ''
  arktest.assertEQ(54, o[3] = 54)
  arktest.assertEQ(o, receiver)
  arktest.assertEQ(54, value)

  value = 0
  receiver = ''
  arktest.assertEQ(60, oo.a = 60)
  arktest.assertEQ('', receiver)
  arktest.assertEQ(0, value)  // oo has own 'a'
  arktest.assertEQ(61, oo.b = 61)
  arktest.assertEQ('', receiver)
  arktest.assertEQ(0, value)  // no setter
  arktest.expectThrow(function() { 'use strict'; oo.b = 61 }, ((e: Error): boolean => e instanceof TypeError))
  receiver = ''
  arktest.assertEQ(62, oo.c = 62)
  arktest.assertEQ(oo, receiver)
  arktest.assertEQ(62, value)
  receiver = ''
  arktest.assertEQ(63, oo['c'] = 63)
  arktest.assertEQ(oo, receiver)
  arktest.assertEQ(63, value)
  receiver = ''
  arktest.assertEQ(64, oo[3] = 64)
  arktest.assertEQ(oo, receiver)
  arktest.assertEQ(64, value)
}

testAccessorCall(
  function(_, that) { receiver = that; return 42 },
  function(_, that, [x]) { receiver = that; value = x }
)

testAccessorCall(
  function(_, that) { 'use strict'; receiver = that; return 42 },
  function(_, that, args) { 'use strict'; receiver = that; value = args[0] }
)

testAccessorCall(
  new Proxy(function(_, that) { receiver = that; return 42 }, {}),
  new Proxy(function(_, that, [x]) { receiver = that; value = x }, {})
)

testAccessorCall(
  Object.freeze(
    new Proxy(function(_, that) { receiver = that; return 42 }, {})),
  Object.freeze(
    new Proxy(function(_, that, [x]) { receiver = that; value = x }, {}))
)


// Passing a proxy function to higher-order library functions.

function testHigherOrder(f) {
  arktest.assertEQ(6, [6, 2].map(f)[0])
  arktest.assertEQ(4, [5, 2].reduce(f, 4))
  arktest.assertTrue([1, 2].some(f))
  arktest.assertEQ('a.b.c', 'a.b.c'.replace('.', f))
}

testHigherOrder(function(x) { return x })
testHigherOrder(function(x) { 'use strict'; return x })
testHigherOrder(new Proxy(function(x) { return x }, {}))
testHigherOrder(Object.freeze(new Proxy(function(x) { return x }, {})))



// TODO(rossberg): Ultimately, I want to have the following test function
// involving proxies), that I leave that for later...

const realms = [Realm.create(), Realm.create()];
Realm.shared = {};

Realm.eval(realms[0], 'function f(_, that) { return that; };');
Realm.eval(realms[0], 'Realm.shared.f = f;');
Realm.eval(realms[0], 'Realm.shared.fg = this;');
Realm.eval(realms[1], 'function g(_, that) { return that; };');
Realm.eval(realms[1], 'Realm.shared.g = g;');
Realm.eval(realms[1], 'Realm.shared.gg = this;');

const fp = new Proxy(()=>{}, {apply: Realm.shared.f});
const gp = new Proxy(()=>{}, {apply: Realm.shared.g});

for (let i = 0; i < 10; i++) {
  arktest.assertEQ(undefined, fp());
  arktest.assertEQ(undefined, gp());

  with (this) {
    arktest.assertEQ(this, fp());
    arktest.assertEQ(this, gp());
  }

  with ({}) {
    arktest.assertEQ(undefined, fp());
    arktest.assertEQ(undefined, gp());
  }
}
