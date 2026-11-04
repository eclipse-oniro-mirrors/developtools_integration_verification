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

// We change the stack size for the ARM64 simulator because at one point this
// test enters an infinite recursion which goes through the runtime and we
// overflow the system stack before the simulator stack.



// Helper.

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0194: Parameter declaration should have an explicit type annotation."
---*/

function testWithProxies(test, x, y, z) {
  // Separate function for nicer stack traces.
  testWithObjectProxy(test, x, y, z);
  testWithFunctionProxy(test, x, y, z);
}

function testWithObjectProxy(test, x, y, z) {
  test((handler) => { return new Proxy({}, handler) }, x, y, z)

}

function testWithFunctionProxy(test, x, y, z) {
  test((handler) => { return new Proxy(() => {}, handler) }, x, y, z)
}

// ---------------------------------------------------------------------------
// Test Proxy constructor properties

(function TestProxyProperties() {
  arktest.assertEQ(2, Proxy.length);
  arktest.assertEQ(Function.__proto__, Proxy.__proto__);
  arktest.assertEQ(undefined, Proxy.prototype);
  arktest.assertEQ(undefined, Object.getOwnPropertyDescriptor(Proxy, 'arguments'));
  arktest.expectThrow(() => Proxy.arguments, ((e: Error): boolean => e instanceof TypeError));
  arktest.assertEQ(undefined, Object.getOwnPropertyDescriptor(Proxy, 'caller'));
  arktest.expectThrow(() => Proxy.caller, ((e: Error): boolean => e instanceof TypeError));
})();

// ---------------------------------------------------------------------------
// Getting property descriptors (Object.getOwnPropertyDescriptor).

let key

function testGetOwnProperty(handler) {
  testWithProxies(testGetOwnProperty2, handler)
}

function testGetOwnProperty2(create, handler) {
  let p = create(handler)
  arktest.assertEQ(42, Object.getOwnPropertyDescriptor(p, 'a').value)
  arktest.assertEQ('a', key)
  arktest.assertEQ(42, Object.getOwnPropertyDescriptor(p, 99).value)
  arktest.assertEQ('99', key)
}

testGetOwnProperty({
  getOwnPropertyDescriptor(target, k) {
    key = k
    return {value: 42, configurable: true}
  }
})

testGetOwnProperty({
  getOwnPropertyDescriptor(target, k) {
    return this.getOwnPropertyDescriptor2(k)
  },
  getOwnPropertyDescriptor2(k) {
    key = k
    return {value: 42, configurable: true}
  }
})

testGetOwnProperty({
  getOwnPropertyDescriptor(target, k) {
    key = k
    return {get value() { return 42 }, get configurable() { return true }}
  }
})

testGetOwnProperty(new Proxy({}, {
  get(target, pk, receiver) {
    return function(t, k) { key = k; return {value: 42, configurable: true} }
  }
}))


// ---------------------------------------------------------------------------
function testGetOwnPropertyThrow(handler) {
  testWithProxies(testGetOwnPropertyThrow2, handler)
}

function testGetOwnPropertyThrow2(create, handler) {
  let p = create(handler)
  arktest.expectThrow(() => Object.getOwnPropertyDescriptor(p, 'a'), 'myexn')
  arktest.expectThrow(() => Object.getOwnPropertyDescriptor(p, 77), 'myexn')
}

testGetOwnPropertyThrow({
  getOwnPropertyDescriptor: function(k) { throw 'myexn' }
})

testGetOwnPropertyThrow({
  getOwnPropertyDescriptor: function(k) {
    return this.getOwnPropertyDescriptor2(k)
  },
  getOwnPropertyDescriptor2: function(k) { throw 'myexn' }
})

testGetOwnPropertyThrow({
  getOwnPropertyDescriptor: function(k) {
    return {get value() { throw 'myexn' }}
  }
})

testGetOwnPropertyThrow(new Proxy({}, {
  get: function(pr, pk) {
    return function(k) { throw 'myexn' }
  }
}))


// ---------------------------------------------------------------------------
// Getters (dot, brackets).

let key

function testGet(handler) {
  testWithProxies(testGet2, handler)
}

function testGet2(create, handler) {
  let p = create(handler)
  arktest.assertEQ(42, p.a)
  arktest.assertEQ('a', key)
  arktest.assertEQ(42, p['b'])
  arktest.assertEQ('b', key)
  arktest.assertEQ(42, p[99])
  arktest.assertEQ('99', key)
  arktest.assertEQ(42, (function(n) { return p[n] })('c'))
  arktest.assertEQ('c', key)
  arktest.assertEQ(42, (function(n) { return p[n] })(101))
  arktest.assertEQ('101', key)

  let o = Object.create(p, {x: {value: 88}})
  arktest.assertEQ(42, o.a)
  arktest.assertEQ('a', key)
  arktest.assertEQ(42, o['b'])
  arktest.assertEQ('b', key)
  arktest.assertEQ(42, o[99])
  arktest.assertEQ('99', key)
  arktest.assertEQ(88, o.x)
  arktest.assertEQ(88, o['x'])
  arktest.assertEQ(42, (function(n) { return o[n] })('c'))
  arktest.assertEQ('c', key)
  arktest.assertEQ(42, (function(n) { return o[n] })(101))
  arktest.assertEQ('101', key)
  arktest.assertEQ(88, (function(n) { return o[n] })('x'))
}

testGet({
  get(t, k, r) { key = k; return 42 }
})

testGet({
  get(t, k, r) { return this.get2(r, k) },
  get2(r, k) { key = k; return 42 }
})

testGet(new Proxy({}, {
  get(pt, pk, pr) {
    return function(t, k, r) { key = k; return 42 }
  }
}))


// ---------------------------------------------------------------------------
function testGetCall(handler) {
  testWithProxies(testGetCall2, handler)
}

function testGetCall2(create, handler) {
  let p = create(handler)
  arktest.assertEQ(55, p.f())
  arktest.assertEQ(55, p['f']())
  arktest.assertEQ(55, p.f('unused', 'arguments'))
  arktest.assertEQ(55, p.f.call(p))
  arktest.assertEQ(55, p['f'].call(p))
  arktest.assertEQ(55, p[101].call(p))
  arktest.assertEQ(55, p.withargs(45, 5))
  arktest.assertEQ(55, p.withargs.call(p, 11, 22))
  arktest.assertEQ(55, (function(n) { return p[n]() })('f'))
  arktest.assertEQ(55, (function(n) { return p[n].call(p) })('f'))
  arktest.assertEQ(55, (function(n) { return p[n](15, 20) })('withargs'))
  arktest.assertEQ(55, (function(n) { return p[n].call(p, 13, 21) })('withargs'))
  arktest.assertEQ('6655', '66' + p)  // calls p.toString

  let o = Object.create(p, {g: {value: function(x) { return x + 88 }}})
  arktest.assertEQ(55, o.f())
  arktest.assertEQ(55, o['f']())
  arktest.assertEQ(55, o.f('unused', 'arguments'))
  arktest.assertEQ(55, o.f.call(o))
  arktest.assertEQ(55, o.f.call(p))
  arktest.assertEQ(55, o['f'].call(p))
  arktest.assertEQ(55, o[101].call(p))
  arktest.assertEQ(55, o.withargs(45, 5))
  arktest.assertEQ(55, o.withargs.call(p, 11, 22))
  arktest.assertEQ(90, o.g(2))
  arktest.assertEQ(91, o.g.call(o, 3))
  arktest.assertEQ(92, o.g.call(p, 4))
  arktest.assertEQ(55, (function(n) { return o[n]() })('f'))
  arktest.assertEQ(55, (function(n) { return o[n].call(o) })('f'))
  arktest.assertEQ(55, (function(n) { return o[n](15, 20) })('withargs'))
  arktest.assertEQ(55, (function(n) { return o[n].call(o, 13, 21) })('withargs'))
  arktest.assertEQ(93, (function(n) { return o[n](5) })('g'))
  arktest.assertEQ(94, (function(n) { return o[n].call(o, 6) })('g'))
  arktest.assertEQ(95, (function(n) { return o[n].call(p, 7) })('g'))
  arktest.assertEQ('6655', '66' + o)  // calls o.toString
}

testGetCall({
  get(t, k, r) { return () => { return 55 } }
})

testGetCall({
  get(t, k, r)  { return this.get2(t, k, r) },
  get2(t, k, r) { return () => { return 55 } }
})

testGetCall({
  get(t, k, r) {
    if (k == 'gg') {
      return () => { return 55 }
    } else if (k == 'withargs') {
      return (n, m) => { return n + m * 2 }
    } else {
      return () => { return r.gg() }
    }
  }
})

testGetCall(new Proxy({}, {
  get(pt, pk, pr) {
    return (t, k, r) => { return () => { return 55 } }
  }
}))


// ---------------------------------------------------------------------------
function testGetThrow(handler) {
  testWithProxies(testGetThrow2, handler)
}

function testGetThrow2(create, handler) {
  let p = create(handler)
  arktest.expectThrow(function(){ p.a }, 'myexn')
  arktest.expectThrow(function(){ p['b'] }, 'myexn')
  arktest.expectThrow(function(){ p[3] }, 'myexn')
  arktest.expectThrow(function(){ (function(n) { p[n] })('c') }, 'myexn')
  arktest.expectThrow(function(){ (function(n) { p[n] })(99) }, 'myexn')

  let o = Object.create(p, {x: {value: 88}, '4': {value: 89}})
  arktest.expectThrow(function(){ o.a }, 'myexn')
  arktest.expectThrow(function(){ o['b'] }, 'myexn')
  arktest.expectThrow(function(){ o[3] }, 'myexn')
  arktest.expectThrow(function(){ (function(n) { o[n] })('c') }, 'myexn')
  arktest.expectThrow(function(){ (function(n) { o[n] })(99) }, 'myexn')
}

testGetThrow({
  get(r, k) { throw 'myexn' }
})

testGetThrow({
  get(r, k) { return this.get2(r, k) },
  get2(r, k) { throw 'myexn' }
})

testGetThrow(new Proxy({}, {
  get(pr, pk) { throw 'myexn' }
}))

testGetThrow(new Proxy({}, {
  get(pr, pk) {
    return function(r, k) { throw 'myexn' }
  }
}))


// ---------------------------------------------------------------------------
// Setters.

let key
let val

testSet({
  set: function(r, k, v) { key = k; val = v; return true }
})

testSet({
  set: function(r, k, v) { return this.set2(r, k, v) },
  set2: function(r, k, v) { key = k; val = v; return true }
})

testSet(new Proxy({}, {
  get(pk, pr) {
    return (r, k, v) => { key = k; val = v; return true }
  }
}))


// ---------------------------------------------------------------------------
function testSetThrow(handler) {
  testWithProxies(testSetThrow2, handler)
}

function testSetThrow2(create, handler) {
  let p = create(handler)
  arktest.expectThrow(function(){ p.a = 42 }, 'myexn')
  arktest.expectThrow(function(){ p['b'] = 42 }, 'myexn')
  arktest.expectThrow(function(){ p[22] = 42 }, 'myexn')
  arktest.expectThrow(function(){ (function(n) { p[n] = 45 })('c') }, 'myexn')
  arktest.expectThrow(function(){ (function(n) { p[n] = 46 })(99) }, 'myexn')
}

testSetThrow({
  set: function(r, k, v) { throw 'myexn' }
})

testSetThrow({
  set: function(r, k, v) { return this.set2(r, k, v) },
  set2: function(r, k, v) { throw 'myexn' }
})

testSetThrow({
  getOwnPropertyDescriptor: function(k) { throw 'myexn' },
  defineProperty: function(k, desc) { key = k; val = desc.value }
})

testSetThrow({
  getOwnPropertyDescriptor: function(k) {
    return {configurable: true, writable: true}
  },
  defineProperty: function(k, desc) { throw 'myexn' }
})

testSetThrow({
  getOwnPropertyDescriptor: function(k) {
    return this.getOwnPropertyDescriptor2(k)
  },
  getOwnPropertyDescriptor2: function(k) { throw 'myexn' },
  defineProperty: function(k, desc) { this.defineProperty2(k, desc) },
  defineProperty2: function(k, desc) { key = k; val = desc.value }
})

testSetThrow({
  getOwnPropertyDescriptor: function(k) {
    return this.getOwnPropertyDescriptor2(k)
  },
  getOwnPropertyDescriptor2: function(k) {
    return {configurable: true, writable: true}
  },
  defineProperty: function(k, desc) { this.defineProperty2(k, desc) },
  defineProperty2: function(k, desc) { throw 'myexn' }
})

testSetThrow({
  getOwnPropertyDescriptor: function(k) { throw 'myexn' },
  defineProperty: function(k, desc) { key = k; val = desc.value }
})

testSetThrow({
  getOwnPropertyDescriptor: function(k) {
    return {
      get configurable() { return true },
      get writable() { return true }
    }
  },
  defineProperty: function(k, desc) { throw 'myexn' }
})

testSetThrow({
  getOwnPropertyDescriptor: function(k) { throw 'myexn' }
})

testSetThrow({
  getOwnPropertyDescriptor: function(k) { throw 'myexn' },
  defineProperty: function(k, desc) { key = k; val = desc.value }
})

testSetThrow(new Proxy({}, {
  get: function(pr, pk) { throw 'myexn' }
}))

testSetThrow(new Proxy({}, {
  get: function(pr, pk) {
    return function(r, k, v) { throw 'myexn' }
  }
}))

// ---------------------------------------------------------------------------

// Evil proxy-induced side-effects shouldn't crash.
testWithProxies(function(create) {
  const calls = 0
  let handler = {
    getPropertyDescriptor: function() {
      ++calls
      return (calls % 2 == 1)
        ? {get: function() { return 5 }, configurable: true}
        : {set: function() { return false }, configurable: true}
    }
  }
  let p = create(handler)
  let o = Object.create(p)
  // Make proxy prototype property read-only after CanPut check.
  try { o.x = 4 } catch (e) { arktest.assertTrue(e instanceof Error) }
})

testWithProxies(function(create) {
  let handler = {
    getPropertyDescriptor: function() {
      Object.defineProperty(o, 'x', {get: function() { return 5 }});
      return {set: function() {}}
    }
  }
  let p = create(handler)
  let o = Object.create(p)
  // Make object property read-only after CanPut check.
  try { o.x = 4 } catch (e) { arktest.assertTrue(e instanceof Error) }
})


// ---------------------------------------------------------------------------
// Property definition (Object.defineProperty and Object.defineProperties).

let key
let desc

function testDefine(handler) {
  testWithProxies(testDefine2, handler)
}

function testDefine2(create, handler) {
  let p = create(handler)
  arktest.assertEQ(p, Object.defineProperty(p, 'a', {value: 44}))
  arktest.assertEQ('a', key)
  arktest.assertEQ(1, Object.getOwnPropertyNames(desc).length)
  arktest.assertEQ(44, desc.value)

  arktest.assertEQ(p, Object.defineProperty(p, 'b', {value: 45, writable: false}))
  arktest.assertEQ('b', key)
  arktest.assertEQ(2, Object.getOwnPropertyNames(desc).length)
  arktest.assertEQ(45, desc.value)
  arktest.assertEQ(false, desc.writable)

  arktest.assertEQ(p, Object.defineProperty(p, 'c', {value: 46, enumerable: false}))
  arktest.assertEQ('c', key)
  arktest.assertEQ(2, Object.getOwnPropertyNames(desc).length)
  arktest.assertEQ(46, desc.value)
  arktest.assertEQ(false, desc.enumerable)

  arktest.assertEQ(p, Object.defineProperty(p, 101, {value: 47, enumerable: false}))
  arktest.assertEQ('101', key)
  arktest.assertEQ(2, Object.getOwnPropertyNames(desc).length)
  arktest.assertEQ(47, desc.value)
  arktest.assertEQ(false, desc.enumerable)

  const attributes = {configurable: true, mine: 66, minetoo: 23}
  arktest.assertEQ(p, Object.defineProperty(p, 'd', attributes))
  arktest.assertEQ('d', key);
  // Modifying the attributes object after the fact should have no effect.
  attributes.configurable = false
  attributes.mine = 77
  delete attributes.minetoo;
  arktest.assertEQ(1, Object.getOwnPropertyNames(desc).length)
  arktest.assertEQ(true, desc.configurable)
  arktest.assertEQ(undefined, desc.mine)
  arktest.assertEQ(undefined, desc.minetoo)

  arktest.assertEQ(p, Object.defineProperty(p, 'e', {get: function(){ return 5 }}))
  arktest.assertEQ('e', key)
  arktest.assertEQ(1, Object.getOwnPropertyNames(desc).length)
  arktest.assertEQ(5, desc.get())

  arktest.assertEQ(p, Object.defineProperty(p, 'zzz', {}))
  arktest.assertEQ('zzz', key)
  arktest.assertEQ(0, Object.getOwnPropertyNames(desc).length)

  let props = {
    '11': {},
    blub: {get: function() { return true }},
    '': {get value() { return 20 }},
    last: {value: 21, configurable: true, mine: 'eyes'}
  }
  Object.defineProperty(props, 'hidden', {value: 'hidden', enumerable: false})
  arktest.assertEQ(p, Object.defineProperties(p, props))
  arktest.assertEQ('last', key)
  arktest.assertEQ(2, Object.getOwnPropertyNames(desc).length)
  arktest.assertEQ(21, desc.value)
  arktest.assertEQ(true, desc.configurable)
  arktest.assertEQ(undefined, desc.mine)  // Arguably a bug in the spec...

  let props = {bla: {get value() { throw 'myexn' }}}
  arktest.expectThrow(function(){ Object.defineProperties(p, props) }, 'myexn')
}

testDefine({
  defineProperty(t, k, d) { key = k; desc = d; return true }
})

testDefine({
  defineProperty(t, k, d) { return this.defineProperty2(k, d) },
  defineProperty2(k, d) { key = k; desc = d; return true }
})


// ---------------------------------------------------------------------------
function testDefineThrow(handler) {
  testWithProxies(testDefineThrow2, handler)
}

function testDefineThrow2(create, handler) {
  let p = create(handler)
  arktest.expectThrow(() => Object.defineProperty(p, 'a', {value: 44}), 'myexn')
  arktest.expectThrow(() => Object.defineProperty(p, 0, {value: 44}), 'myexn')

  const d1 = create({
    get: function(r, k) { throw 'myexn' },
    getOwnPropertyNames: function() { return ['value'] }
  })
  arktest.expectThrow(function(){ Object.defineProperty(p, 'p', d1) }, 'myexn')
  const d2 = create({
    get: function(r, k) { return 77 },
    getOwnPropertyNames: function() { throw 'myexn' }
  })
  arktest.expectThrow(function(){ Object.defineProperty(p, 'p', d2) }, 'myexn')

  let props = {bla: {get value() { throw 'otherexn' }}}
  arktest.expectThrow(() => Object.defineProperties(p, props), 'otherexn')
}

testDefineThrow({
  defineProperty: function(k, d) { throw 'myexn' }
})

testDefineThrow({
  defineProperty: function(k, d) { return this.defineProperty2(k, d) },
  defineProperty2: function(k, d) { throw 'myexn' }
})

testDefineThrow(new Proxy({}, {
  get: function(pr, pk) { throw 'myexn' }
}))

testDefineThrow(new Proxy({}, {
  get: function(pr, pk) {
    return function(k, d) { throw 'myexn' }
  }
}))



// ---------------------------------------------------------------------------
// Property deletion (delete).

let key

function testDelete(handler) {
  testWithProxies(testDelete2, handler)
}

function testDelete2(create, handler) {
  let p = create(handler)
  arktest.assertEQ(true, delete p.a)
  arktest.assertEQ('a', key)
  arktest.assertEQ(true, delete p['b'])
  arktest.assertEQ('b', key)
  arktest.assertEQ(true, delete p[1])
  arktest.assertEQ('1', key)

  arktest.assertEQ(false, delete p.z1)
  arktest.assertEQ('z1', key)
  arktest.assertEQ(false, delete p['z2'])
  arktest.assertEQ('z2', key);

  (function() {
    'use strict'
    arktest.assertEQ(true, delete p.c)
    arktest.assertEQ('c', key)
    arktest.assertEQ(true, delete p['d'])
    arktest.assertEQ('d', key)
    arktest.assertEQ(true, delete p[2])
    arktest.assertEQ('2', key)

    arktest.expectThrow(function(){ delete p.z3 }, ((e: Error): boolean => e instanceof TypeError))
    arktest.assertEQ('z3', key)
    arktest.expectThrow(function(){ delete p['z4'] }, ((e: Error): boolean => e instanceof TypeError))
    arktest.assertEQ('z4', key)
  })()
}

testDelete({
  deleteProperty(target, k) { key = k; return k < 'z' }
})

testDelete({
  deleteProperty(target, k) { return this.delete2(k) },
  delete2: function(k) { key = k; return k < 'z' }
})

testDelete(new Proxy({}, {
  get(pt, pk, pr) {
    return (target, k) => { key = k; return k < 'z' }
  }
}))


// ---------------------------------------------------------------------------
function testDeleteThrow(handler) {
  testWithProxies(testDeleteThrow2, handler)
}

function testDeleteThrow2(create, handler) {
  let p = create(handler)
  arktest.expectThrow(function(){ delete p.a }, 'myexn')
  arktest.expectThrow(function(){ delete p['b'] }, 'myexn');
  arktest.expectThrow(function(){ delete p[3] }, 'myexn');

  (function() {
    'use strict'
    arktest.expectThrow(function(){ delete p.c }, 'myexn')
    arktest.expectThrow(function(){ delete p['d'] }, 'myexn')
    arktest.expectThrow(function(){ delete p[4] }, 'myexn');
  })()
}

testDeleteThrow({
  deleteProperty(t, k) { throw 'myexn' }
})

testDeleteThrow({
  deleteProperty(t, k) { return this.delete2(k) },
  delete2(k) { throw 'myexn' }
})

testDeleteThrow(new Proxy({}, {
  get(pt, pk, pr) { throw 'myexn' }
}))

testDeleteThrow(new Proxy({}, {
  get(pt, pk, pr) {
    return (k) => { throw 'myexn' }
  }
}))


// ---------------------------------------------------------------------------
// Property descriptors (Object.getOwnPropertyDescriptor).

function testDescriptor(handler) {
  testWithProxies(testDescriptor2, handler)
}

function testDescriptor2(create, handler) {
  let p = create(handler)
  const descs = [
    {configurable: true},
    {value: 34, enumerable: true, configurable: true},
    {value: 3, writable: false, mine: 'eyes', configurable: true},
    {get value() { return 20 }, get configurable() { return true }},
    {get: function() { 'get' }, set: function() { 'set' }, configurable: true}
  ]
  for (let i = 0; i < descs.length; ++i) {
    arktest.assertEQ(p, Object.defineProperty(p, i, descs[i]))
    let desc = Object.getOwnPropertyDescriptor(p, i)
    for (prop in descs[i]) {
      // TODO(rossberg): Ignore user attributes as long as the spec isn't
      // fixed suitably.
      if (prop != 'mine') { arktest.assertEQ(descs[i][prop], desc[prop]) }
    }
    arktest.assertEQ(undefined, Object.getOwnPropertyDescriptor(p, 'absent'))
  }
}

testDescriptor({
  defineProperty(t, k, d) { this['__' + k] = d; return true },
  getOwnPropertyDescriptor(t, k) { return this['__' + k] }
})

testDescriptor({
  defineProperty(t, k, d) { this['__' + k] = d; return true },
  getOwnPropertyDescriptor(t, k) {
    return this.getOwnPropertyDescriptor2(k)
  },
  getOwnPropertyDescriptor2: function(k) { return this['__' + k] }
})


// ---------------------------------------------------------------------------
function testDescriptorThrow(handler) {
  testWithProxies(testDescriptorThrow2, handler)
}

function testDescriptorThrow2(create, handler) {
  let p = create(handler)
  arktest.expectThrow(() => Object.getOwnPropertyDescriptor(p, 'a'), 'myexn')
}

testDescriptorThrow({
  getOwnPropertyDescriptor: function(k) { throw 'myexn' }
})

testDescriptorThrow({
  getOwnPropertyDescriptor: function(k) {
    return this.getOwnPropertyDescriptor2(k)
  },
  getOwnPropertyDescriptor2: function(k) { throw 'myexn' }
})



// ---------------------------------------------------------------------------
// Comparison.

function testComparison(eq) {
  testWithProxies(testComparison2, eq)
}

function testComparison2(create, eq) {
  let p1 = create({})
  let p2 = create({})

  arktest.assertTrue(eq(p1, p1))
  arktest.assertTrue(eq(p2, p2))
  arktest.assertTrue(!eq(p1, p2))
  arktest.assertTrue(!eq(p1, {}))
  arktest.assertTrue(!eq({}, p2))
  arktest.assertTrue(!eq({}, {}))
}

testComparison(function(o1, o2) { return o1 == o2 })
testComparison(function(o1, o2) { return o1 === o2 })
testComparison(function(o1, o2) { return !(o1 != o2) })
testComparison(function(o1, o2) { return !(o1 !== o2) })



// Type (typeof).

function testTypeof() {
  arktest.assertEQ('object', typeof new Proxy({},{}))
  arktest.assertTrue(typeof new Proxy({}, {}) == 'object')
  arktest.assertTrue('object' == typeof new Proxy({},{}))

  arktest.assertEQ('function', typeof new Proxy(function() {}, {}))
  arktest.assertTrue(typeof new Proxy(function() {}, {}) == 'function')
  arktest.assertTrue('function' == typeof new Proxy(function() {},{}))
}

testTypeof()



// ---------------------------------------------------------------------------
// Membership test (in).

let key

function testIn(handler) {
  testWithProxies(testIn2, handler)
}

function testIn2(create, handler) {
  let p = create(handler)
  arktest.assertTrue('a' in p)
  arktest.assertEQ('a', key)
  arktest.assertTrue(99 in p)
  arktest.assertEQ('99', key)
  arktest.assertFalse('z' in p)
  arktest.assertEQ('z', key)

  arktest.assertEQ(2, ('a' in p) ? 2 : 0)
  arktest.assertEQ(0, !('a' in p) ? 2 : 0)
  arktest.assertEQ(0, ('zzz' in p) ? 2 : 0)
  arktest.assertEQ(2, !('zzz' in p) ? 2 : 0)

  // Test compilation in conditionals.
  if ('b' in p) {
  } else {
    arktest.assertTrue(false)
  }
  arktest.assertEQ('b', key)

  if ('zz' in p) {
    arktest.assertTrue(false)
  }
  arktest.assertEQ('zz', key)

  if (!('c' in p)) {
    arktest.assertTrue(false)
  }
  arktest.assertEQ('c', key)

  if (!('zzz' in p)) {
  } else {
    arktest.assertTrue(false)
  }
  arktest.assertEQ('zzz', key)
}

testIn({
  has(t, k) { key = k; return k < 'z' }
})

testIn({
  has(t, k) { return this.has2(k) },
  has2(k) { key = k; return k < 'z' }
})

testIn(new Proxy({},{
  get(pt, pk, pr) {
    return (t, k) => { key = k; return k < 'z' }
  }
}))


// ---------------------------------------------------------------------------
function testInThrow(handler) {
  testWithProxies(testInThrow2, handler)
}

function testInThrow2(create, handler) {
  let p = create(handler)
  arktest.expectThrow(function(){ return 'a' in p }, 'myexn')
  arktest.expectThrow(function(){ return 99 in p }, 'myexn')
  arktest.expectThrow(function(){ return !('a' in p) }, 'myexn')
  arktest.expectThrow(function(){ return ('a' in p) ? 2 : 3 }, 'myexn')
  arktest.expectThrow(function(){ if ('b' in p) {} }, 'myexn')
  arktest.expectThrow(function(){ if (!('b' in p)) {} }, 'myexn')
  arktest.expectThrow(function(){ if ('zzz' in p) {} }, 'myexn')
}

testInThrow({
  has: function(k) { throw 'myexn' }
})

testInThrow({
  has: function(k) { return this.has2(k) },
  has2: function(k) { throw 'myexn' }
})

testInThrow(new Proxy({},{
  get: function(pr, pk) { throw 'myexn' }
}))

testInThrow(new Proxy({},{
  get: function(pr, pk) {
    return function(k) { throw 'myexn' }
  }
}))



// ---------------------------------------------------------------------------
// Own Properties (Object.prototype.hasOwnProperty).

let key

function testHasOwn(handler) {
  testWithProxies(testHasOwn2, handler)
}

function testHasOwn2(create, handler) {
  let p = create(handler)
  arktest.assertTrue(Object.prototype.hasOwnProperty.call(p, 'a'))
  arktest.assertEQ('a', key)
  arktest.assertTrue(Object.prototype.hasOwnProperty.call(p, 99))
  arktest.assertEQ('99', key)
  arktest.assertFalse(Object.prototype.hasOwnProperty.call(p, 'z'))
  arktest.assertEQ('z', key)
}

testHasOwn({
  getOwnPropertyDescriptor(t, k) {
    key = k; if (k < 'z') { return {configurable: true }}
  },
  has() { arktest.assertTrue(false) }
})

testHasOwn({
  getOwnPropertyDescriptor(t, k) { return this.getOwnPropertyDescriptor2(k) },
  getOwnPropertyDescriptor2(k) {
    key = k; if (k < 'z') { return {configurable: true }}
  }
})



// ---------------------------------------------------------------------------
function testHasOwnThrow(handler) {
  testWithProxies(testHasOwnThrow2, handler)
}

function testHasOwnThrow2(create, handler) {
  let p = create(handler)
  arktest.expectThrow(function(){ Object.prototype.hasOwnProperty.call(p, 'a')},
    'myexn')
  arktest.expectThrow(function(){ Object.prototype.hasOwnProperty.call(p, 99)},
    'myexn')
}

testHasOwnThrow({
  getOwnPropertyDescriptor(t, k) { throw 'myexn' }
})

testHasOwnThrow({
  getOwnPropertyDescriptor(t, k) { return this.getOwnPropertyDescriptor2(k) },
  getOwnPropertyDescriptor2(k) { throw 'myexn' }
});


// ---------------------------------------------------------------------------
// Instanceof (instanceof)

(function TestProxyInstanceof() {
  let o1 = {}
  let p1 = new Proxy({}, {})
  let p2 = new Proxy(o1, {})
  let p3 = new Proxy(p2, {})
  let o2 = Object.create(p2)

  let f0 = function() {}
  f0.prototype = o1
  let f1 = function() {}
  f1.prototype = p1
  let f2 = function() {}
  f2.prototype = p2
  let f3 = function() {}
  f3.prototype = o2

  arktest.assertTrue(o1 instanceof Object)
  arktest.assertFalse(o1 instanceof f0)
  arktest.assertFalse(o1 instanceof f1)
  arktest.assertFalse(o1 instanceof f2)
  arktest.assertFalse(o1 instanceof f3)
  arktest.assertTrue(p1 instanceof Object)
  arktest.assertFalse(p1 instanceof f0)
  arktest.assertFalse(p1 instanceof f1)
  arktest.assertFalse(p1 instanceof f2)
  arktest.assertFalse(p1 instanceof f3)
  arktest.assertTrue(p2 instanceof Object)
  arktest.assertFalse(p2 instanceof f0)
  arktest.assertFalse(p2 instanceof f1)
  arktest.assertFalse(p2 instanceof f2)
  arktest.assertFalse(p2 instanceof f3)
  arktest.assertTrue(p3 instanceof Object)
  arktest.assertFalse(p3 instanceof f0)
  arktest.assertFalse(p3 instanceof f1)
  arktest.assertFalse(p3 instanceof f2)
  arktest.assertFalse(p3 instanceof f3)
  arktest.assertTrue(o2 instanceof Object)
  arktest.assertFalse(o2 instanceof f0)
  arktest.assertFalse(o2 instanceof f1)
  arktest.assertTrue(o2 instanceof f2)
  arktest.assertFalse(o2 instanceof f3)

  let f = new Proxy(function() {}, {})
  arktest.assertTrue(f instanceof Function)
})();


(function TestInstanceofProxy() {
  const o0 = Object.create(null)
  let o1 = {}
  let o2 = Object.create(o0)
  const o3 = Object.create(o1)
  const o4 = Object.create(o2)
  const o5 = Object.create(o3)

  function handler(o) {
    return {
      get: function(r, p) {
        // We want to test prototype lookup, so ensure the proxy
        // offers OrdinaryHasInstance behavior.
        if (p === Symbol.hasInstance) {
          return undefined;
        }
        return o;
      }
    }
  }

  let f0 = new Proxy(function() {}, handler(o0))
  let f1 = new Proxy(function() {}, handler(o1))
  let f2 = new Proxy(function() {}, handler(o2))
  let f3 = new Proxy(function() {}, handler(o3))
  const f4 = new Proxy(function() {}, handler(o4))
  const f5 = new Proxy(function() {}, handler(o4))

  arktest.assertFalse(null instanceof f0)
  arktest.assertFalse(o0 instanceof f0)
  arktest.assertFalse(o0 instanceof f1)
  arktest.assertFalse(o0 instanceof f2)
  arktest.assertFalse(o0 instanceof f3)
  arktest.assertFalse(o0 instanceof f4)
  arktest.assertFalse(o0 instanceof f5)
  arktest.assertFalse(o1 instanceof f0)
  arktest.assertFalse(o1 instanceof f1)
  arktest.assertFalse(o1 instanceof f2)
  arktest.assertFalse(o1 instanceof f3)
  arktest.assertFalse(o1 instanceof f4)
  arktest.assertFalse(o1 instanceof f5)
  arktest.assertTrue(o2 instanceof f0)
  arktest.assertFalse(o2 instanceof f1)
  arktest.assertFalse(o2 instanceof f2)
  arktest.assertFalse(o2 instanceof f3)
  arktest.assertFalse(o2 instanceof f4)
  arktest.assertFalse(o2 instanceof f5)
  arktest.assertFalse(o3 instanceof f0)
  arktest.assertTrue(o3 instanceof f1)
  arktest.assertFalse(o3 instanceof f2)
  arktest.assertFalse(o3 instanceof f3)
  arktest.assertFalse(o3 instanceof f4)
  arktest.assertFalse(o3 instanceof f5)
  arktest.assertTrue(o4 instanceof f0)
  arktest.assertFalse(o4 instanceof f1)
  arktest.assertTrue(o4 instanceof f2)
  arktest.assertFalse(o4 instanceof f3)
  arktest.assertFalse(o4 instanceof f4)
  arktest.assertFalse(o4 instanceof f5)
  arktest.assertFalse(o5 instanceof f0)
  arktest.assertTrue(o5 instanceof f1)
  arktest.assertFalse(o5 instanceof f2)
  arktest.assertTrue(o5 instanceof f3)
  arktest.assertFalse(o5 instanceof f4)
  arktest.assertFalse(o5 instanceof f5)

  let f = new Proxy(function() {}, {})
  const ff = new Proxy(function() {}, handler(Function))
  arktest.assertTrue(f instanceof Function)
  arktest.assertFalse(f instanceof ff)
})();


// ---------------------------------------------------------------------------
// Prototype (Object.getPrototypeOf, Object.prototype.isPrototypeOf).

(function TestPrototype() {
  let o1 = {}
  let p1 = new Proxy({}, {})
  let p2 = new Proxy(o1, {})
  let p3 = new Proxy(p2, {})
  let o2 = Object.create(p3)

  arktest.assertEQ(Object.getPrototypeOf(o1), Object.prototype)
  arktest.assertEQ(Object.getPrototypeOf(p1), Object.prototype)
  arktest.assertEQ(Object.getPrototypeOf(p2), Object.prototype)
  arktest.assertEQ(Object.getPrototypeOf(p3), Object.prototype)
  arktest.assertEQ(Object.getPrototypeOf(o2), p3)

  arktest.assertTrue(Object.prototype.isPrototypeOf(o1))
  arktest.assertTrue(Object.prototype.isPrototypeOf(p1))
  arktest.assertTrue(Object.prototype.isPrototypeOf(p2))
  arktest.assertTrue(Object.prototype.isPrototypeOf(p3))
  arktest.assertTrue(Object.prototype.isPrototypeOf(o2))
  arktest.assertTrue(Object.prototype.isPrototypeOf.call(Object.prototype, o1))
  arktest.assertTrue(Object.prototype.isPrototypeOf.call(Object.prototype, p1))
  arktest.assertTrue(Object.prototype.isPrototypeOf.call(Object.prototype, p2))
  arktest.assertTrue(Object.prototype.isPrototypeOf.call(Object.prototype, p3))
  arktest.assertTrue(Object.prototype.isPrototypeOf.call(Object.prototype, o2))
  arktest.assertFalse(Object.prototype.isPrototypeOf.call(o1, o1))
  arktest.assertFalse(Object.prototype.isPrototypeOf.call(o1, p1))
  arktest.assertFalse(Object.prototype.isPrototypeOf.call(o1, p2))
  arktest.assertFalse(Object.prototype.isPrototypeOf.call(o1, p3))
  arktest.assertFalse(Object.prototype.isPrototypeOf.call(o1, o2))
  arktest.assertFalse(Object.prototype.isPrototypeOf.call(p1, p1))
  arktest.assertFalse(Object.prototype.isPrototypeOf.call(p1, o1))
  arktest.assertFalse(Object.prototype.isPrototypeOf.call(p1, p2))
  arktest.assertFalse(Object.prototype.isPrototypeOf.call(p1, p3))
  arktest.assertFalse(Object.prototype.isPrototypeOf.call(p1, o2))
  arktest.assertFalse(Object.prototype.isPrototypeOf.call(p2, p1))
  arktest.assertFalse(Object.prototype.isPrototypeOf.call(p2, p2))
  arktest.assertFalse(Object.prototype.isPrototypeOf.call(p2, p3))
  arktest.assertFalse(Object.prototype.isPrototypeOf.call(p2, o2))
  arktest.assertFalse(Object.prototype.isPrototypeOf.call(p3, p2))
  arktest.assertTrue(Object.prototype.isPrototypeOf.call(p3, o2))
  arktest.assertFalse(Object.prototype.isPrototypeOf.call(o2, o1))
  arktest.assertFalse(Object.prototype.isPrototypeOf.call(o2, p1))
  arktest.assertFalse(Object.prototype.isPrototypeOf.call(o2, p2))
  arktest.assertFalse(Object.prototype.isPrototypeOf.call(o2, p3))
  arktest.assertFalse(Object.prototype.isPrototypeOf.call(o2, o2))

  let f = new Proxy(function() {}, {})
  arktest.assertEQ(Object.getPrototypeOf(f), Function.prototype)
  arktest.assertTrue(Object.prototype.isPrototypeOf(f))
  arktest.assertTrue(Object.prototype.isPrototypeOf.call(Function.prototype, f))
})();


// ---------------------------------------------------------------------------
function testPropertyNamesThrow(handler) {
  testWithProxies(testPropertyNamesThrow2, handler)
}

function testPropertyNamesThrow2(create, handler) {
  let p = create(handler)
  arktest.expectThrow(function(){ Object.getOwnPropertyNames(p) }, 'myexn')
}

testPropertyNamesThrow({
  ownKeys() { throw 'myexn' }
})

testPropertyNamesThrow({
  ownKeys() { return this.getOwnPropertyNames2() },
  getOwnPropertyNames2() { throw 'myexn' }
})

// ---------------------------------------------------------------------------

function testKeys(names, handler) {
  let p = new Proxy({}, handler);
  arktest.assertEQ(names, Object.keys(p))
}

testKeys([], {
  ownKeys() { return [] }
})

testKeys([], {
  ownKeys() { return ['a', 'zz', ' ', '0', 'toString'] }
})

testKeys(['a', 'zz', ' ', '0', 'toString'], {
  ownKeys() { return ['a', 'zz', ' ', '0', 'toString'] },
  getOwnPropertyDescriptor(t, p) {
    return {configurable: true, enumerable: true}
  }
})

testKeys([], {
  ownKeys() { return this.keys2() },
  keys2() { return ['throw', 'function '] }
})

testKeys(['throw', 'function '], {
  ownKeys() { return this.keys2() },
  keys2() { return ['throw', 'function '] },
  getOwnPropertyDescriptor(t, p) {
    return {configurable: true, enumerable: true}
  }
})

testKeys(['a', '0'], {
  ownKeys() { return ['a', '23', 'zz', '', '0'] },
  getOwnPropertyDescriptor(t, k) {
    return k == '' ?
        undefined :
        { configurable: true, enumerable: k.length == 1}
  }
})

testKeys(['23', 'zz', ''], {
  ownKeys() { return this.getOwnPropertyNames2() },
  getOwnPropertyNames2() { return ['a', '23', 'zz', '', '0'] },
  getOwnPropertyDescriptor(t, k) {
    return this.getOwnPropertyDescriptor2(k)
  },
  getOwnPropertyDescriptor2(k) {
    return {configurable: true, enumerable: k.length != 1 }
  }
})

testKeys([], {
  get ownKeys() {
    return function() { return ['a', 'b', 'c'] }
  },
  getOwnPropertyDescriptor: function(k) { return {configurable: true} }
})


// ---------------------------------------------------------------------------
function testKeysThrow(handler) {
  testWithProxies(testKeysThrow2, handler)
}

function testKeysThrow2(create, handler) {
  let p = create(handler);
  arktest.expectThrow(function(){ Object.keys(p) }, 'myexn');
}

testKeysThrow({
  ownKeys() { throw 'myexn' }
})

testKeysThrow({
  ownKeys() { return this.keys2() },
  keys2() { throw 'myexn' }
})

testKeysThrow({
  ownKeys() { return ['1'] },
  getOwnPropertyDescriptor: function() { throw 'myexn' },
})

testKeysThrow({
  ownKeys() { return this.getOwnPropertyNames2() },
  getOwnPropertyNames2() { return ['1', '2'] },
  getOwnPropertyDescriptor(k) {
    return this.getOwnPropertyDescriptor2(k)
  },
  getOwnPropertyDescriptor2(k) { throw 'myexn' }
})

testKeysThrow({
  get ownKeys() { throw 'myexn' }
})

testKeysThrow({
  get ownKeys() {
    return function() { throw 'myexn' }
  },
})

testKeysThrow({
  get ownKeys() {
    return function() { return ['1', '2'] }
  },
  getOwnPropertyDescriptor(k) { throw 'myexn' }
})



// ---------------------------------------------------------------------------
// String conversion (Object.prototype.toString,
//                    Object.prototype.toLocaleString)

let key

function testToString(handler) {
  let p = new Proxy({}, handler)
  key = ''
  arktest.assertEQ('[object Object]', Object.prototype.toString.call(p))
  arktest.assertEQ(Symbol.toStringTag, key)
  arktest.assertEQ('my_proxy', Object.prototype.toLocaleString.call(p))
  arktest.assertEQ('toString', key)

  let f = new Proxy(function() {}, handler)
  key = ''
  arktest.assertEQ('[object Function]', Object.prototype.toString.call(f))
  arktest.assertEQ(Symbol.toStringTag, key)
  arktest.assertEQ('my_proxy', Object.prototype.toLocaleString.call(f))
  arktest.assertEQ('toString', key)

  let o = Object.create(p)
  key = ''
  arktest.assertEQ('[object Object]', Object.prototype.toString.call(o))
  arktest.assertEQ(Symbol.toStringTag, key)
  arktest.assertEQ('my_proxy', Object.prototype.toLocaleString.call(o))
  arktest.assertEQ('toString', key)
}

testToString({
  get: function(r, k) { key = k; return function() { return 'my_proxy' } }
})

testToString({
  get: function(r, k) { return this.get2(r, k) },
  get2: function(r, k) { key = k; return function() { return 'my_proxy' } }
})

testToString(new Proxy({}, {
  get: function(pr, pk) {
    return function(r, k) { key = k; return function() { return 'my_proxy' } }
  }
}))


function testToStringThrow(handler) {
  let p = new Proxy({}, handler)
  arktest.expectThrow(() => Object.prototype.toString.call(p), 'myexn')
  arktest.expectThrow(() => Object.prototype.toLocaleString.call(p), 'myexn')

  let f = new Proxy(function(){}, handler)
  arktest.expectThrow(() => Object.prototype.toString.call(f), 'myexn')
  arktest.expectThrow(() => Object.prototype.toLocaleString.call(f), 'myexn')

  let o = Object.create(p)
  arktest.expectThrow(() => Object.prototype.toString.call(o), 'myexn')
  arktest.expectThrow(() => Object.prototype.toLocaleString.call(o), 'myexn')
}

testToStringThrow({
  get: function(r, k) { throw 'myexn' }
})

testToStringThrow({
  get: function(r, k) { return this.get2(r, k) },
  get2: function(r, k) { throw 'myexn' }
})

testToStringThrow(new Proxy({}, {
  get: function(pr, pk) { throw 'myexn' }
}))

testToStringThrow(new Proxy({}, {
  get: function(pr, pk) {
    return function(r, k) { throw 'myexn' }
  }
}))


// ---------------------------------------------------------------------------
// Value conversion (Object.prototype.toValue)

function testValueOf(handler) {
  testWithProxies(testValueOf2, handler)
}

function testValueOf2(create, handler) {
  let p = create(handler)
  arktest.assertEQ(p, Object.prototype.valueOf.call(p))
}
testValueOf({})



// ---------------------------------------------------------------------------
let key

function testIsEnumerable(handler) {
  testWithProxies(testIsEnumerable2, handler)
}

function testIsEnumerable2(create, handler) {
  let p = create(handler)
  arktest.assertTrue(Object.prototype.propertyIsEnumerable.call(p, 'a'))
  arktest.assertEQ('a', key)
  arktest.assertTrue(Object.prototype.propertyIsEnumerable.call(p, 2))
  arktest.assertEQ('2', key)
  arktest.assertFalse(Object.prototype.propertyIsEnumerable.call(p, 'z'))
  arktest.assertEQ('z', key)

  let o = Object.create(p)
  key = ''
  arktest.assertFalse(Object.prototype.propertyIsEnumerable.call(o, 'a'))
  arktest.assertEQ('', key)  // trap not invoked
}

testIsEnumerable({
  getOwnPropertyDescriptor(t, k) {
    key = k;
    return {enumerable: k < 'z', configurable: true}
  },
})

testIsEnumerable({
  getOwnPropertyDescriptor: function(t, k) {
    return this.getOwnPropertyDescriptor2(k)
  },
  getOwnPropertyDescriptor2: function(k) {
    key = k;
    return {enumerable: k < 'z', configurable: true}
  },
})

testIsEnumerable({
  getOwnPropertyDescriptor: function(t, k) {
    key = k;
    return {get enumerable() { return k < 'z' }, configurable: true}
  },
})

testIsEnumerable(new Proxy({}, {
  get: function(pt, pk, pr) {
    return function(t, k) {
      key = k;
      return {enumerable: k < 'z', configurable: true}
    }
  }
}))


// ---------------------------------------------------------------------------
function testIsEnumerableThrow(handler) {
  testWithProxies(testIsEnumerableThrow2, handler)
}

function testIsEnumerableThrow2(create, handler) {
  let p = create(handler)
  arktest.expectThrow(() => Object.prototype.propertyIsEnumerable.call(p, 'a'),
      'myexn')
  arktest.expectThrow(() => Object.prototype.propertyIsEnumerable.call(p, 11),
      'myexn')
}

testIsEnumerableThrow({
  getOwnPropertyDescriptor: function(k) { throw 'myexn' }
})

testIsEnumerableThrow({
  getOwnPropertyDescriptor: function(k) {
    return this.getOwnPropertyDescriptor2(k)
  },
  getOwnPropertyDescriptor2: function(k) { throw 'myexn' }
})

testIsEnumerableThrow({
  getOwnPropertyDescriptor: function(k) {
    return {get enumerable() { throw 'myexn' }, configurable: true}
  },
})

testIsEnumerableThrow(new Proxy({}, {
  get: function(pr, pk) { throw 'myexn' }
}))

testIsEnumerableThrow(new Proxy({}, {
  get: function(pr, pk) {
    return function(k) { throw 'myexn' }
  }
}));



// ---------------------------------------------------------------------------
// Constructor functions with proxy prototypes.

(function TestConstructorWithProxyPrototype() {
  testWithProxies(testConstructorWithProxyPrototype2, {})
})();

function testConstructorWithProxyPrototype2(create, handler) {
  function C() {};
  C.prototype = create(handler);

  let o = new C;
  arktest.assertEQ(C.prototype, Object.getPrototypeOf(o));
};


(function TestOptWithProxyPrototype() {
  let handler = {
    get(t, k) {
      return 10;
    }
  };

  function C() {};
  C.prototype = new Proxy({}, handler);
  let o = new C();

  function f() {
    return o.x;
  }
  ArkTools.prepareFunctionForOptimization(f);
  arktest.assertEQ(10, f());
  arktest.assertEQ(10, f());
  ArkTools.optimizeFunctionOnNextCall(f);
  arktest.assertEQ(10, f());
})();
