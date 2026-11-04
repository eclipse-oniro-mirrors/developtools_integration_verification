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

(function TestBasics() {
  let C = class C {}
  arktest.assertEQ(typeof C, 'function');
  arktest.assertEQ(C.__proto__, Function.prototype);
  arktest.assertEQ(Object.prototype, Object.getPrototypeOf(C.prototype));
  arktest.assertEQ(Function.prototype, Object.getPrototypeOf(C));
  arktest.assertEQ('C', C.name);

  class D {}
  arktest.assertEQ(typeof D, 'function');
  arktest.assertEQ(D.__proto__, Function.prototype);
  arktest.assertEQ(Object.prototype, Object.getPrototypeOf(D.prototype));
  arktest.assertEQ(Function.prototype, Object.getPrototypeOf(D));
  arktest.assertEQ('D', D.name);

  class D2 { constructor() {} }
  arktest.assertEQ('D2', D2.name);

  let E = class {}
  arktest.assertEQ('E', E.name);

  let F = class { constructor() {} };
  arktest.assertEQ('F', F.name);

  let literal = { E: class {} };
  arktest.assertEQ('E', literal.E.name);

  literal = { E: class F {} };
  arktest.assertEQ('F', literal.E.name);

  literal = { __proto__: class {} };
  arktest.assertEQ('', literal.__proto__.name);
  let nameDescr = Object.getOwnPropertyDescriptor(literal.__proto__, 'name');
  arktest.assertEQ('', nameDescr.value);
  arktest.assertFalse(nameDescr.writable);
  arktest.assertFalse(nameDescr.enumerable);
  arktest.assertTrue(nameDescr.configurable);

  literal = { __proto__: class F {} };
  arktest.assertEQ('F', literal.__proto__.name);
  arktest.assertNE(
      undefined, Object.getOwnPropertyDescriptor(literal.__proto__, 'name'));

  class G {};
  literal = { __proto__: G };
  arktest.assertEQ('G', literal.__proto__.name);

  let H = class { static name() { return 'A'; } };
  literal = { __proto__ : H };
  arktest.assertEQ('A', literal.__proto__.name());

  literal = {
    __proto__: class {
      static name() { return 'A'; }
    }
  };
  arktest.assertEQ('A', literal.__proto__.name());
})();


(function TestBasicsExtends() {
  class C extends null {}
  arktest.assertEQ(typeof C, 'function');
  arktest.assertEQ(C.__proto__, Function.prototype);
  arktest.assertEQ(null, Object.getPrototypeOf(C.prototype));

  class D extends C {}
  arktest.assertEQ(typeof D, 'function');
  arktest.assertEQ(D.__proto__, C);
  arktest.assertEQ(C.prototype, Object.getPrototypeOf(D.prototype));
})();


(function TestSideEffectInExtends() {
  let calls = 0;
  class C {}
  class D extends (calls++, C) {}
  arktest.assertEQ(1, calls);
  arktest.assertEQ(typeof D, 'function');
  arktest.assertEQ(D.__proto__, C);
  arktest.assertEQ(C.prototype, Object.getPrototypeOf(D.prototype));
})();


(function TestInvalidExtends() {
  arktest.expectThrow(function() {
    class C extends 42 {}
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(function() {
    // Function but its .prototype is not null or a function.
    class C extends Math.abs {}
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(function() {
    Math.abs.prototype = 42;
    class C extends Math.abs {}
  }, ((e: Error): boolean => e instanceof TypeError));
  delete Math.abs.prototype;

  arktest.expectThrow(function() {
    function* g() {}
    class C extends g {}
  }, ((e: Error): boolean => e instanceof TypeError));
})();


(function TestConstructorProperty() {
  class C {}
  arktest.assertEQ(C, C.prototype.constructor);
  let descr = Object.getOwnPropertyDescriptor(C.prototype, 'constructor');
  arktest.assertTrue(descr.configurable);
  arktest.assertFalse(descr.enumerable);
  arktest.assertTrue(descr.writable);
})();


(function TestPrototypeProperty() {
  class C {}
  let descr = Object.getOwnPropertyDescriptor(C, 'prototype');
  arktest.assertFalse(descr.configurable);
  arktest.assertFalse(descr.enumerable);
  arktest.assertFalse(descr.writable);
})();

(function TestImplicitConstructor() {
  class C {}
  let c = new C();
  arktest.assertEQ(Object.getPrototypeOf(c), C.prototype);
})();


(function TestConstructorStrict() {
  class C {
    constructor() {
      arktest.expectThrow(() => {
        nonExistingBinding = 42;
      }, (e) => e instanceof ReferenceError);
    }
  }
  new C();
})();


(function TestSuperInConstructor() {
  let calls = 0;
  class B {}
  B.prototype.x = 42;

  class C extends B {
    constructor() {
      super();
      calls++;
      arktest.assertEQ(42, super.x);
    }
  }

  new C;
  arktest.assertEQ(1, calls);
})();


(function TestStrictMode() {
  class C {}

  with ({a: 1}) {
    arktest.assertEQ(1, a);
  }

  arktest.expectThrow('class C extends function B() { with ({}); return B; }() {}',
               SyntaxError);

  let D = class extends function() {
    this.args = arguments;
  } {};
  arktest.expectThrow(() => {
    Object.getPrototypeOf(D).arguments;
  }, (e) => e instanceof TypeError);
  let e = new D();
  arktest.expectThrow(() => e.args.callee, ((e: Error): boolean => e instanceof TypeError));
  arktest.assertEQ(undefined, Object.getOwnPropertyDescriptor(e.args, 'caller'));
  arktest.assertFalse('caller' in e.args);
})();


(function TestToString() {
  class C {}
  arktest.assertEQ('class C {}', C.toString());

  class D { constructor() { 42; } }
  arktest.assertEQ('class D { constructor() { 42; } }', D.toString());

  class E { x() { 42; } }
  arktest.assertEQ('class E { x() { 42; } }', E.toString());
})();

function assertMethodDescriptor(object, name) {
  let descr = Object.getOwnPropertyDescriptor(object, name);
  arktest.assertTrue(descr.configurable);
  arktest.assertFalse(descr.enumerable);
  arktest.assertTrue(descr.writable);
  arktest.assertEQ('function', typeof descr.value);
  arktest.assertFalse('prototype' in descr.value);
  arktest.assertEQ(name, descr.value.name);
}


function assertGetterDescriptor(object, name) {
  let descr = Object.getOwnPropertyDescriptor(object, name);
  arktest.assertTrue(descr.configurable);
  arktest.assertFalse(descr.enumerable);
  arktest.assertEQ('function', typeof descr.get);
  arktest.assertFalse('prototype' in descr.get);
  arktest.assertEQ(undefined, descr.set);
  arktest.assertEQ('get ' + name, descr.get.name);
}


function assertSetterDescriptor(object, name) {
  let descr = Object.getOwnPropertyDescriptor(object, name);
  arktest.assertTrue(descr.configurable);
  arktest.assertFalse(descr.enumerable);
  arktest.assertEQ(undefined, descr.get);
  arktest.assertEQ('function', typeof descr.set);
  arktest.assertFalse('prototype' in descr.set);
  arktest.assertEQ('set ' + name, descr.set.name);
}


function assertAccessorDescriptor(object, name) {
  let descr = Object.getOwnPropertyDescriptor(object, name);
  arktest.assertTrue(descr.configurable);
  arktest.assertFalse(descr.enumerable);
  arktest.assertEQ('function', typeof descr.get);
  arktest.assertEQ('function', typeof descr.set);
  arktest.assertFalse('prototype' in descr.get);
  arktest.assertFalse('prototype' in descr.set);
  arktest.assertEQ('get ' + name, descr.get.name);
  arktest.assertEQ('set ' + name, descr.set.name);
}


(function TestMethods() {
  class C {
    method() { return 1; }
    static staticMethod() { return 2; }
    method2() { return 3; }
    static staticMethod2() { return 4; }
  }

  assertMethodDescriptor(C.prototype, 'method');
  assertMethodDescriptor(C.prototype, 'method2');
  assertMethodDescriptor(C, 'staticMethod');
  assertMethodDescriptor(C, 'staticMethod2');

  arktest.assertEQ(1, new C().method());
  arktest.assertEQ(2, C.staticMethod());
  arktest.assertEQ(3, new C().method2());
  arktest.assertEQ(4, C.staticMethod2());
})();


(function TestGetters() {
  class C {
    get x() { return 1; }
    static get staticX() { return 2; }
    get y() { return 3; }
    static get staticY() { return 4; }
  }

  assertGetterDescriptor(C.prototype, 'x');
  assertGetterDescriptor(C.prototype, 'y');
  assertGetterDescriptor(C, 'staticX');
  assertGetterDescriptor(C, 'staticY');

  arktest.assertEQ(1, new C().x);
  arktest.assertEQ(2, C.staticX);
  arktest.assertEQ(3, new C().y);
  arktest.assertEQ(4, C.staticY);
})();



(function TestSetters() {
  let x;
  let staticX;
  let y;
  let staticY;
  class C {
    set x(v) { x = v; }
    static set staticX(v) { staticX = v; }
    set y(v) { y = v; }
    static set staticY(v) { staticY = v; }
  }

  assertSetterDescriptor(C.prototype, 'x');
  assertSetterDescriptor(C.prototype, 'y');
  assertSetterDescriptor(C, 'staticX');
  assertSetterDescriptor(C, 'staticY');

  arktest.assertEQ(1, new C().x = 1);
  arktest.assertEQ(1, x);
  arktest.assertEQ(2, C.staticX = 2);
  arktest.assertEQ(2, staticX);
  arktest.assertEQ(3, new C().y = 3);
  arktest.assertEQ(3, y);
  arktest.assertEQ(4, C.staticY = 4);
  arktest.assertEQ(4, staticY);
})();


(function TestSideEffectsInPropertyDefine() {
  function bFunction() {}
  bFunction.prototype = {
    constructor: bFunction,
    set m(v) {
      throw Error();
    }
  };

  class C extends bFunction {
    m() { return 1; }
  }

  arktest.assertEQ(1, new C().m());
})();


(function TestAccessors() {
  class C {
    constructor(x) {
      this._x = x;
    }

    get x() { return this._x; }
    set x(v) { this._x = v; }

    static get staticX() { return this._x; }
    static set staticX(v) { this._x = v; }
  }

  assertAccessorDescriptor(C.prototype, 'x');
  assertAccessorDescriptor(C, 'staticX');

  let c = new C(1);
  c._x = 1;
  arktest.assertEQ(1, c.x);
  c.x = 2;
  arktest.assertEQ(2, c._x);

  C._x = 3;
  arktest.assertEQ(3, C.staticX);
  C._x = 4;
  arktest.assertEQ(4, C.staticX );
})();

(function TestNumericPropertyNames() {
  class B {
    1() { return 1; }
    get 2() { return 2; }
    set 3(_) {}

    static 4() { return 4; }
    static get 5() { return 5; }
    static set 6(_) {}

    2147483649() { return 2147483649; }
    get 2147483650() { return 2147483650; }
    set 2147483651(_) {}

    static 2147483652() { return 2147483652; }
    static get 2147483653() { return 2147483653; }
    static set 2147483654(_) {}

    4294967294() { return 4294967294; }
    4294967295() { return 4294967295; }
    static 4294967294() { return 4294967294; }
    static 4294967295() { return 4294967295; }
  }

  assertMethodDescriptor(B.prototype, '1');
  assertGetterDescriptor(B.prototype, '2');
  assertSetterDescriptor(B.prototype, '3');
  assertMethodDescriptor(B.prototype, '2147483649');
  assertGetterDescriptor(B.prototype, '2147483650');
  assertSetterDescriptor(B.prototype, '2147483651');
  assertMethodDescriptor(B.prototype, '4294967294');
  assertMethodDescriptor(B.prototype, '4294967295');

  assertMethodDescriptor(B, '4');
  assertGetterDescriptor(B, '5');
  assertSetterDescriptor(B, '6');
  assertMethodDescriptor(B, '2147483652');
  assertGetterDescriptor(B, '2147483653');
  assertSetterDescriptor(B, '2147483654');
  assertMethodDescriptor(B, '4294967294');
  assertMethodDescriptor(B, '4294967295');

  class C extends B {
    1() { return super[1](); }
    get 2() { return super[2]; }

    static 4() { return super[4](); }
    static get 5() { return super[5]; }

    2147483649() { return super[2147483649](); }
    get 2147483650() { return super[2147483650]; }

    static 2147483652() { return super[2147483652](); }
    static get 2147483653() { return super[2147483653]; }

  }

  arktest.assertEQ(1, new C()[1]());
  arktest.assertEQ(2, new C()[2]);
  arktest.assertEQ(2147483649, new C()[2147483649]());
  arktest.assertEQ(2147483650, new C()[2147483650]);
  arktest.assertEQ(4, C[4]());
  arktest.assertEQ(5, C[5]);
  arktest.assertEQ(2147483652, C[2147483652]());
  arktest.assertEQ(2147483653, C[2147483653]);
})();

(function testReturnFromClassLiteral() {

  function usingYieldInBody() {
    function* foo() {
      class C {
        [yield]() {}
      }
    }
    let g = foo();
    g.next();
    return g.return(42).value;
  }
  arktest.assertEQ(42, usingYieldInBody());

  function usingYieldInExtends() {
    function* foo() {
      class C extends (yield) {};
    }
    let g = foo();
    g.next();
    return g.return(42).value;
  }
  arktest.assertEQ(42, usingYieldInExtends());

})();
