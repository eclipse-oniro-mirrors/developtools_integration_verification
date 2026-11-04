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

// Helper.

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0194: Parameter declaration should have an explicit type annotation."
---*/

function testWithProxies(test, x, y, z) {
  test(function(h) { return new Proxy({}, h) }, x, y, z)
  test(function(h) {
      return new Proxy(function() {}, h)
  }, x, y, z)
}



// Getting.

function testWithGet(handler) {
  testWithProxies(testWithGet2, handler)
}

let c = 'global'
let key = ''

function testWithGet2(create, handler) {
  let b = 'local'

  let p = create(handler);
  arktest.assertEQ('onproxy', p.a);
  arktest.assertEQ(undefined, p.b);
  arktest.assertEQ(undefined, p.c);

  with (p) {
    arktest.assertEQ('onproxy', a);
    arktest.assertEQ('local', b);
    arktest.assertEQ('global', c);
  }

  let o = Object.create(p, {d: {value: 'own'}})
  with (o) {
    arktest.assertEQ('onproxy', a)
    arktest.assertEQ('local', b);
    arktest.assertEQ('global', c)
    arktest.assertEQ('own', d)
  }
}

testWithGet({
  get(target, k) {
    key = k;
    return k === 'a' ? 'onproxy' : undefined
  },
  has(target, k) { return k === 'a' }
})

testWithGet({
  get: function(r, k) { return this.get2(r, k) },
  get2: function(r, k) { key = k; return k === 'a' ? 'onproxy' : undefined },
  has(target, k) { return k === 'a' }
})




// Invoking.

function testWithGetCall(handler) {
  testWithProxies(testWithGetCall2, handler)
}

let receiver = null
let c = function() { return 'global' }

function testWithGetCall2(create, handler) {
  let b = function() { return 'local' }

  let p = create(handler)
  with (p) {
    receiver = null
    arktest.assertEQ('onproxy', a())
    arktest.assertEQ(p, receiver)
    arktest.assertEQ('local', b())
    arktest.assertEQ('global', c())
  }

  let o = Object.create(p, {d: {value: function() { return 'own' }}})
  with (o) {
    receiver = null
    arktest.assertEQ('onproxy', a())
    arktest.assertEQ(o, receiver)
    arktest.assertEQ('local', b())
    arktest.assertEQ('global', c())
    arktest.assertEQ('own', d())
  }
}

function onproxy() { receiver = this; return 'onproxy' }

testWithGetCall({
  get: function(r, k) { key = k; return k === 'a' ? onproxy : undefined },
  has: function(t, k) {
    key = k;
    return k === 'a';
  }
})

testWithGetCall({
  get: function(r, k) { return this.get2(r, k) },
  get2: function(r, k) { key = k; return k === 'a' ? onproxy : undefined },
  has: function(t, k) {
    key = k;
    return k === 'a';
  }
})

testWithGetCall({
  get: function(r, k) { key = k; return k === 'a' ? onproxy : undefined },
  has: function(t, k) {
    return this.has2(k)
  },
  has2: function(k) {
    key = k;
    return k === 'a';
  }
})

testWithGetCall({
  get: function(r, k) { key = k; return k === 'a' ? onproxy : undefined },
  has: function(t, k) {
    key = k;
    return k === 'a';
  }
})


function testWithGetCallThrow(handler) {
  testWithProxies(testWithGetCallThrow2, handler)
}

function testWithGetCallThrow2(create, handler) {
  let b = function() { return 'local' }

  let p = create(handler)
  with (p) {
    arktest.expectThrow(function(){ a() }, 'myexn')
    arktest.assertEQ('local', b())
    arktest.assertEQ('global', c())
  }

  let o = Object.create(p, {d: {value: function() { return 'own' }}})
  with (o) {
    arktest.expectThrow(function(){ a() }, 'myexn')
    arktest.assertEQ('local', b())
    arktest.assertEQ('global', c())
    arktest.assertEQ('own', d())
  }
}

function onproxythrow() { throw 'myexn' }

testWithGetCallThrow({
  has: function(r, k) { return k === 'a'; },
  get: function(r, k) { key = k; return k === 'a' ? onproxythrow : undefined },
})

testWithGetCallThrow({
  has: function(r, k) { return k === 'a'; },
  get: function(r, k) { return this.get2(r, k) },
  get2: function(r, k) { key = k; return k === 'a' ? onproxythrow : undefined },
})



// Setting.

let key
let val

function testWithSet(handler, hasSetter) {
  testWithProxies(testWithSet2, handler, hasSetter)
}

let c = 'global'

function testWithSet2(create, handler, hasSetter) {
  let b = 'local'

  let p = create(handler)
  key = val = undefined
  with (p) {
    a = 'set'
    arktest.assertEQ('a', key)
    arktest.assertEQ('set', val)
    arktest.assertEQ('local', b)
    arktest.assertEQ('global', c)
    b = 'local'
    c = 'global'
    arktest.assertEQ('a', key)
    arktest.assertEQ('set', val)
  }

  if (!hasSetter) { return }

  let o = Object.create(p, {d: {value: 'own'}})
  key = val = undefined
  with (o) {
    a = 'set'
    arktest.assertEQ('a', key)
    arktest.assertEQ('set', val)
    arktest.assertEQ('local', b)
    arktest.assertEQ('global', c)
    arktest.assertEQ('own', d)
    b = 'local'
    c = 'global'
    d = 'own'
    arktest.assertEQ('a', key)
    arktest.assertEQ('set', val)
  }
}

testWithSet({
  set: function(r, k, v) { key = k; val = v; return true },
  has: function(t, k) {
    return k === 'a'
  }
})

testWithSet({
  set: function(r, k, v) { return this.set2(r, k, v) },
  set2: function(r, k, v) { key = k; val = v; return true },
  has: function(t, k) {
    return k === 'a'
  }
})

testWithSet({
  has: function(t, k) {
    return k === 'a'
  },
  defineProperty: function(t, k, desc) { key = k; val = desc.value }
})

testWithSet({
  has: function(t, k) {
    return this.has2(k)
  },
  has2: function(k) {
    return k === 'a'
  },
  defineProperty: function(t, k, desc) { this.defineProperty2(k, desc) },
  defineProperty2: function(k, desc) { key = k; val = desc.value }
})

testWithSet({
  has: function(t, k) {
    return k === 'a'
  },
  defineProperty: function(t, k, desc) { key = k; val = desc.value }
})

testWithSet({
  has: function(t, k) {
    return this.has2(k);
  },
  has2: function(k) {
    return k === 'a'
  },
  set: function(t, k, v) { key = k; val = v; return true }
}, true)

testWithSet({
  has: function(t, k) {
    return k === 'a'
  },
  defineProperty: function(t, k, desc) { key = k; val = desc.value }
})


function testWithSetThrow(handler, hasSetter) {
  testWithProxies(testWithSetThrow2, handler, hasSetter)
}

function testWithSetThrow2(create, handler, hasSetter) {
  let p = create(handler)
  arktest.expectThrow(function(){
    with (p) {
      a = 1
    }
  }, 'myexn')

  if (!hasSetter) { return }

  let o = Object.create(p, {})
  arktest.expectThrow(function(){
    with (o) {
      a = 1
    }
  }, 'myexn')
}

testWithSetThrow({
  set: function() { throw 'myexn' },
  has: function(t, k) {
    return k === 'a'
  }
})

testWithSetThrow({
  has: function() { throw 'myexn' },
})

testWithSetThrow({
  has: function() { throw 'myexn' },
})

testWithSetThrow({
  has: function(t, k) {
    return k === 'a'
  },
  defineProperty: function() { throw 'myexn' }
})

testWithSetThrow({
  has: function(t, k) {
    return k === 'a'
  },
  set: function() { throw 'myexn' }
}, true)
