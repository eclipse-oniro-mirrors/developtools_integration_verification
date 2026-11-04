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

// A simple membrane. Adapted from:
// http://wiki.ecmascript.org/doku.php?id=harmony:proxies#a_simple_membrane

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0194: Parameter declaration should have an explicit type annotation."
---*/

function createSimpleMembrane(target) {
  let enabled = true;

  function wrap(obj) {
    if (obj !== Object(obj)) {
      return obj;
    }

    let handler = new Proxy({}, {get: function(_, key) {
      if (!enabled) { throw new Error('disabled'); }
      switch (key) {
        case 'apply':
          return (_, that, args) => {
            try {
              return wrap(Reflect.apply(
                  obj, wrap(that), args.map((x) => wrap(x))));
            } catch(e) {
              throw wrap(e);
            }
          }
        case 'construct':
          return (_, args, newt) => {
            try {
              return wrap(Reflect.construct(
                  obj, args.map((x) => wrap(x)), wrap(newt)));
            } catch(e) {
              throw wrap(e);
            }
          }
        default:
          return (_, ...args) => {
            try {
              return wrap(Reflect[key](obj, ...(args.map(wrap))));
            } catch(e) {
              throw wrap(e);
            }
          }
      }
    }});

    return new Proxy(obj, handler);
  }

  const gate = Object.freeze({
    enable: () => enabled = true,
    disable: () => enabled = false
  });

  return Object.freeze({
    wrapper: wrap(target),
    gate: gate
  });
}


// Test the simple membrane.
{
  let o = {
    a: 6,
    b: {bb: 8},
    f: function(x) { return x },
    g: function(x) { return x.a },
    h: function(x) { this.q = x }
  };
  o[2] = {c: 7};
  let m = createSimpleMembrane(o);
  let w = m.wrapper;
  let f = w.f;
  let x = f(66);
  let x = f({a: 1});
  let x = w.f({a: 1});
  let a = x.a;
  arktest.assertEQ(6, w.a);
  arktest.assertEQ(8, w.b.bb);
  arktest.assertEQ(7, w[2]['c']);
  arktest.assertEQ(undefined, w.c);
  arktest.assertEQ(1, w.f(1));
  arktest.assertEQ(1, w.f({a: 1}).a);
  arktest.assertEQ(2, w.g({a: 2}));
  arktest.assertEQ(3, (w.r = {a: 3}).a);
  arktest.assertEQ(3, w.r.a);
  arktest.assertEQ(3, o.r.a);
  w.h(3);
  arktest.assertEQ(3, w.q);
  arktest.assertEQ(3, o.q);
  arktest.assertEQ(4, (new w.h(4)).q);

  let wb = w.b;
  let wr = w.r;
  let wf = w.f;
  let wf3 = w.f(3);
  let wfx = w.f({a: 6});
  let wgx = w.g({a: {aa: 7}});
  let wh4 = new w.h(4);
  m.gate.disable();
  arktest.assertEQ(3, wf3);
  arktest.expectThrow(function() { w.a }, ((e: Error): boolean => e instanceof Error));
  arktest.expectThrow(function() { w.r }, ((e: Error): boolean => e instanceof Error));
  arktest.expectThrow(function() { w.r = {a: 4} }, ((e: Error): boolean => e instanceof Error));
  arktest.expectThrow(function() { o.r.a }, ((e: Error): boolean => e instanceof Error));
  arktest.assertEQ('object', typeof o.r);
  arktest.assertEQ(5, (o.r = {a: 5}).a);
  arktest.assertEQ(5, o.r.a);
  arktest.expectThrow(function() { w[1] }, ((e: Error): boolean => e instanceof Error));
  arktest.expectThrow(function() { w.c }, ((e: Error): boolean => e instanceof Error));
  arktest.expectThrow(function() { wb.bb }, ((e: Error): boolean => e instanceof Error));
  arktest.expectThrow(function() { wr.a }, ((e: Error): boolean => e instanceof Error));
  arktest.expectThrow(function() { wf(4) }, ((e: Error): boolean => e instanceof Error));
  arktest.expectThrow(function() { wfx.a }, ((e: Error): boolean => e instanceof Error));
  arktest.expectThrow(function() { wgx.aa }, ((e: Error): boolean => e instanceof Error));
  arktest.expectThrow(function() { wh4.q }, ((e: Error): boolean => e instanceof Error));

  m.gate.enable();
  arktest.assertEQ(6, w.a);
  arktest.assertEQ(5, w.r.a);
  arktest.assertEQ(5, o.r.a);
  arktest.assertEQ(7, w.r = 7);
  arktest.assertEQ(7, w.r);
  arktest.assertEQ(7, o.r);
  arktest.assertEQ(8, w.b.bb);
  arktest.assertEQ(7, w[2]['c']);
  arktest.assertEQ(undefined, w.c);
  arktest.assertEQ(8, wb.bb);
  arktest.assertEQ(3, wr.a);
  arktest.assertEQ(4, wf(4));
  arktest.assertEQ(3, wf3);
  arktest.assertEQ(6, wfx.a);
  arktest.assertEQ(7, wgx.aa);
  arktest.assertEQ(4, wh4.q);
}



// An identity-preserving membrane. Adapted from:
// http://wiki.ecmascript.org/doku.php?id=harmony:proxies#an_identity-preserving_membrane

function createMembrane(target) {
  const wet2dry = 0;
  const dry2wet = 1;

  function flip(dir) { return (dir + 1) % 2 }

  let maps = [new WeakMap(), new WeakMap()];

  let revoked = false;

  function wrap(dir, obj) {
    if (obj !== Object(obj)) {
      return obj;
    }

    let wrapper = maps[dir].get(obj);
    if (wrapper) {
      return wrapper;
    }

    let handler = new Proxy({}, {get: function(_, key) {
      if (revoked) { throw new Error('revoked'); }
      switch (key) {
        case 'apply':
          return (_, that, args) => {
            try {
              return wrap(dir, Reflect.apply(
                  obj, wrap(flip(dir), that),
                  args.map((x) => wrap(flip(dir), x))));
            } catch(e) {
              throw wrap(dir, e);
            }
          }
        case 'construct':
          return (_, args, newt) => {
            try {
              return wrap(dir, Reflect.construct(
                  obj, args.map((x) => wrap(flip(dir), x)),
                  wrap(flip(dir), newt)));
            } catch(e) {
              throw wrap(dir, e);
            }
          }
        default:
          return (_, ...args) => {
            try {
              return wrap(dir, Reflect[key](
                  obj, ...(args.map((x) => wrap(flip(dir), x)))))
            } catch(e) {
              throw wrap(dir, e);
            }
          }
      }
    }});

    wrapper = new Proxy(obj, handler);
    maps[dir].set(obj, wrapper);
    maps[flip(dir)].set(wrapper, obj);
    return wrapper;
  }

  const gate = Object.freeze({
    revoke: () => revoked = true
  });

  return Object.freeze({
    wrapper: wrap(wet2dry, target),
    gate: gate
  });
}


// Test the identity-preserving membrane.
{
  const receiver
  const argument
  let o = {
    a: 6,
    b: {bb: 8},
    f: function(x) {receiver = this; argument = x; return x},
    g: function(x) {receiver = this; argument = x; return x.a},
    h: function(x) {receiver = this; argument = x; this.q = x},
    s: function(x) {receiver = this; argument = x; this.x = {y: x}; return this}
  }
  o[2] = {c: 7}
  let m = createMembrane(o)
  let w = m.wrapper
  let f = w.f
  let x = f(66)
  let x = f({a: 1})
  let x = w.f({a: 1})
  let a = x.a
  arktest.assertEQ(6, w.a)
  arktest.assertEQ(8, w.b.bb)
  arktest.assertEQ(7, w[2]['c'])
  arktest.assertEQ(undefined, w.c)
  arktest.assertEQ(1, w.f(1))
  arktest.assertEQ(o, receiver)
  arktest.assertEQ(1, w.f({a: 1}).a)
  arktest.assertEQ(o, receiver)
  arktest.assertEQ(2, w.g({a: 2}))
  arktest.assertEQ(o, receiver)
  arktest.assertEQ(w, w.f(w))
  arktest.assertEQ(o, receiver)
  arktest.assertEQ(o, argument)
  arktest.assertEQ(o, w.f(o))
  arktest.assertEQ(o, receiver)
  // Note that argument !== o, since o isn't dry, so gets wrapped wet again.
  arktest.assertEQ(3, (w.r = {a: 3}).a)
  arktest.assertEQ(3, w.r.a)
  arktest.assertEQ(3, o.r.a)
  w.h(3)
  arktest.assertEQ(3, w.q)
  arktest.assertEQ(3, o.q)
  arktest.assertEQ(4, (new w.h(4)).q)
  arktest.assertEQ(5, w.s(5).x.y)
  arktest.assertEQ(o, receiver)

  let wb = w.b
  let wr = w.r
  let wf = w.f
  let wf3 = w.f(3)
  let wfx = w.f({a: 6})
  let wgx = w.g({a: {aa: 7}})
  let wh4 = new w.h(4)
  const ws5 = w.s(5)
  const ws5x = ws5.x
  m.gate.revoke()
  arktest.assertEQ(3, wf3)
  arktest.expectThrow(function() { w.a }, ((e: Error): boolean => e instanceof Error))
  arktest.expectThrow(function() { w.r }, ((e: Error): boolean => e instanceof Error))
  arktest.expectThrow(function() { w.r = {a: 4} }, ((e: Error): boolean => e instanceof Error))
  arktest.expectThrow(function() { o.r.a }, ((e: Error): boolean => e instanceof Error))
  arktest.assertEQ('object', typeof o.r)
  arktest.assertEQ(5, (o.r = {a: 5}).a)
  arktest.assertEQ(5, o.r.a)
  arktest.expectThrow(function() { w[1] }, ((e: Error): boolean => e instanceof Error))
  arktest.expectThrow(function() { w.c }, ((e: Error): boolean => e instanceof Error))
  arktest.expectThrow(function() { wb.bb }, ((e: Error): boolean => e instanceof Error))
  arktest.assertEQ(3, wr.a)
  arktest.expectThrow(function() { wf(4) }, ((e: Error): boolean => e instanceof Error))
  arktest.assertEQ(6, wfx.a)
  arktest.assertEQ(7, wgx.aa)
  arktest.expectThrow(function() { wh4.q }, ((e: Error): boolean => e instanceof Error))
  arktest.expectThrow(function() { ws5.x }, ((e: Error): boolean => e instanceof Error))
  arktest.expectThrow(function() { ws5x.y }, ((e: Error): boolean => e instanceof Error))
}
