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
expected_out_1: "Syntax error ESY0320: Function expressions are not supported, use arrow functions instead"
---*/

'use strict';
(function TestArgumentsAccess() {
  class Base {
    constructor() {
      arktest.assertEQ(2, arguments.length);
      arktest.assertEQ(1, arguments[0]);
      arktest.assertEQ(2, arguments[1]);
    }
  }

  let b = new Base(1,2);

  class Subclass extends Base {
    constructor() {
      arktest.assertEQ(2, arguments.length);
      arktest.assertEQ(3, arguments[0]);
      arktest.assertEQ(4, arguments[1]);
      super(1,2);
    }
  }

  let s = new Subclass(3,4);
  arktest.assertEQ(0, Subclass.length);

  class Subclass2 extends Base {
    constructor(x,y) {
      arktest.assertEQ(2, arguments.length);
      arktest.assertEQ(3, arguments[0]);
      arktest.assertEQ(4, arguments[1]);
      super(1,2);
    }
  }

  let s2 = new Subclass2(3,4);
  arktest.assertEQ(2, Subclass2.length);
}());

(function TestThisAccessRestriction() {
  class Base {
    constructor(a, b) {
      let o = {};
      o.prp = a + b;
      return o;
    }
  }

  class Subclass extends Base {
    constructor(a, b) {
      let exn;
      try {
        this.prp1 = 3;
      } catch (e) {
        exn = e;
      }
      arktest.assertTrue(exn instanceof ReferenceError);
      super(a, b);
      arktest.assertTrue(Object.is(a + b, this.prp));
      arktest.assertTrue(Object.is(undefined, this.prp1));
      arktest.assertFalse(this.hasOwnProperty('prp1'));
      return this;
    }
  }

  let b = new Base(1, 2);
  arktest.assertTrue(Object.is(3, b.prp));


  let s = new Subclass(2, -1);
  arktest.assertTrue(Object.is(1, s.prp));
  arktest.assertTrue(Object.is(undefined, s.prp1));
  arktest.assertFalse(s.hasOwnProperty('prp1'));

  class Subclass2 extends Base {
    constructor(x) {
      super(1,2);

      if (x < 0) { return; }

      let called = false;
      function tmp() { called = true; return 3; }
      let exn = null;
      try {
        super(tmp(),4);
      } catch (e) { exn = e; }
      arktest.assertTrue(exn instanceof ReferenceError);
      arktest.assertTrue(called);
    }
  }

  let s2 = new Subclass2(1);
  arktest.assertTrue(Object.is(3, s2.prp));

  let s3 = new Subclass2(-1);
  arktest.assertTrue(Object.is(3, s3.prp));

  arktest.expectThrow(() => { Subclass.call({}, 1, 2); }, (e) => e instanceof TypeError);
  arktest.expectThrow(() => { Base.call({}, 1, 2); }, (e) => e instanceof TypeError);

  class BadSubclass extends Base {
    constructor() {}
  }

  arktest.expectThrow(() => { new BadSubclass(); }, (e) => e instanceof ReferenceError);
}());

(function TestThisCheckOrdering() {
  let baseCalled = 0;
  class Base {
    constructor() { baseCalled++ }
  }

  let fCalled = 0;
  function f() { fCalled++; return 3; }

  class Subclass1 extends Base {
    constructor() {
      baseCalled = 0;
      super();
      arktest.assertEQ(1, baseCalled);
      let obj = this;

      let exn = null;
      baseCalled = 0;
      fCalled = 0;
      try {
        super(f());
      } catch (e) { exn = e; }
      arktest.assertTrue(exn instanceof ReferenceError);
      arktest.assertEQ(1, fCalled);
      arktest.assertEQ(1, baseCalled);
      arktest.assertTrue(Object.is(obj, this));

      exn = null;
      baseCalled = 0;
      fCalled = 0;
      try {
        super(super(), f());
      } catch (e) { exn = e; }
      arktest.assertTrue(exn instanceof ReferenceError);
      arktest.assertEQ(0, fCalled);
      arktest.assertEQ(1, baseCalled);
      arktest.assertTrue(Object.is(obj, this));

      exn = null;
      baseCalled = 0;
      fCalled = 0;
      try {
        super(f(), super());
      } catch (e) { exn = e; }
      arktest.assertTrue(exn instanceof ReferenceError);
      arktest.assertEQ(1, fCalled);
      arktest.assertEQ(1, baseCalled);
      arktest.assertTrue(Object.is(obj, this));
    }
  }

  new Subclass1();
}());


(function TestPrototypeWiring() {
  class Base {
    constructor(x) {
      this.foobar = x;
    }
  }

  class Subclass extends Base {
    constructor(x) {
      super(x);
    }
  }

  let s = new Subclass(1);
  arktest.assertTrue(Object.is(1, s.foobar));
  arktest.assertTrue(Object.is(Subclass.prototype, s.__proto__));

  let s1 = new Subclass(1, 2);
  arktest.assertTrue(Object.is(1, s1.foobar));
  arktest.assertTrue(s1.__proto__ === Subclass.prototype);

  let s2 = new Subclass();
  arktest.assertTrue(Object.is(undefined, s2.foobar));
  arktest.assertTrue(Object.is(Subclass.prototype, s2.__proto__));
  arktest.expectThrow(() => { Subclass(1); }, (e) => e instanceof TypeError);
  arktest.expectThrow(() => { Subclass(1,2,3,4); }, (e) => e instanceof TypeError);

  class Subclass2 extends Subclass {
    constructor() {
      super(5, 6, 7);
    }
  }

  let ss2 = new Subclass2();
  arktest.assertTrue(Object.is(5, ss2.foobar));
  arktest.assertTrue(Object.is(Subclass2.prototype, ss2.__proto__));

  class Subclass3 extends Base {
    constructor(x,y) {
      super(x + y);
    }
  }

  let ss3 = new Subclass3(27,42-27);
  arktest.assertTrue(Object.is(42, ss3.foobar));
  arktest.assertTrue(Object.is(Subclass3.prototype, ss3.__proto__));
}());

(function TestSublclassingBuiltins() {
  class ExtendedUint8Array extends Uint8Array {
    constructor() {
      super(10);
      this[0] = 255;
      this[1] = 0xFFA;
    }
  }

  let eua = new ExtendedUint8Array();
  arktest.assertEQ(10, eua.length);
  arktest.assertEQ(10, eua.byteLength);
  arktest.assertEQ(0xFF, eua[0]);
  arktest.assertEQ(0xFA, eua[1]);
  arktest.assertTrue(Object.is(ExtendedUint8Array.prototype, eua.__proto__));
  arktest.assertEQ('[object Uint8Array]', Object.prototype.toString.call(eua));
}());

(function TestSubclassingNull() {
  let N = null;

  class Foo extends N {
    constructor(x,y) {
      arktest.assertTrue(Object.is(1, x));
      arktest.assertTrue(Object.is(2, y));
      return {};
    }
  }

  new Foo(1,2);
}());

(function TestSubclassBinding() {
  class Base {
    constructor(x, y) {
      this.x = x;
      this.y = y;
    }
  }

  let obj = {};
  class Subclass extends Base {
    constructor(x,y) {
      super(x,y);
      arktest.assertTrue(this !== obj);
    }
  }

  let f = Subclass.bind(obj);
  arktest.expectThrow(() => { f(1, 2); }, (e) => e instanceof TypeError);
  let s = new f(1, 2);
  arktest.assertTrue(Object.is(1, s.x));
  arktest.assertTrue(Object.is(2, s.y));
  arktest.assertTrue(Object.is(Subclass.prototype, s.__proto__));

  let s1 = new f(1);
  arktest.assertTrue(Object.is(1, s1.x));
  arktest.assertTrue(Object.is(undefined, s1.y));
  arktest.assertTrue(Object.is(Subclass.prototype, s1.__proto__));

  let g = Subclass.bind(obj, 1);
  arktest.expectThrow(() => { g(8); }, (e) => e instanceof TypeError);
  let s2 = new g(8);
  arktest.assertTrue(Object.is(1, s2.x));
  arktest.assertTrue(Object.is(8, s2.y));
  arktest.assertTrue(Object.is(Subclass.prototype, s.__proto__));
}());


(function TestDefaultConstructor() {
  class Base1 { }
  arktest.expectThrow(() => { Base1(); }, (e) => e instanceof TypeError);

  class Subclass1 extends Base1 { }

  arktest.expectThrow(() => { Subclass1(); }, (e) => e instanceof TypeError);

  let s1 = new Subclass1();
  arktest.assertTrue(Object.is(s1.__proto__, Subclass1.prototype));

  class Base2 {
    constructor(x, y) {
      this.x = x;
      this.y = y;
    }
  }

  class Subclass2 extends Base2 {};

  let s2 = new Subclass2(1, 2);

  arktest.assertTrue(Object.is(s2.__proto__, Subclass2.prototype));
  arktest.assertTrue(Object.is(1, s2.x));
  arktest.assertTrue(Object.is(2, s2.y));

  let f = Subclass2.bind({}, 3, 4);
  let s2prime = new f();
  arktest.assertTrue(Object.is(s2prime.__proto__, Subclass2.prototype));
  arktest.assertTrue(Object.is(3, s2prime.x));
  arktest.assertTrue(Object.is(4, s2prime.y));

  let obj = {};
  class Base3 {
    constructor() {
      return obj;
    }
  }

  class Subclass3 extends Base3 {};

  let s3 = new Subclass3();
  arktest.assertTrue(Object.is(obj, s3));

  class ExtendedUint8Array extends Uint8Array { }

  let eua = new ExtendedUint8Array(10);
  arktest.assertEQ(10, eua.length);
  arktest.assertEQ(10, eua.byteLength);
  eua[0] = 0xFF;
  eua[1] = 0xFFA;
  arktest.assertEQ(0xFF, eua[0]);
  arktest.assertEQ(0xFA, eua[1]);
  arktest.assertTrue(Object.is(ExtendedUint8Array.prototype, eua.__proto__));
  arktest.assertEQ('[object Uint8Array]', Object.prototype.toString.call(eua));
}());
