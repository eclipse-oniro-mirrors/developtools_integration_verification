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

(function TestSuperInObjectLiteralMethod() {
  let myProto = {
    __proto__ : {'x': 'right' },
    m() { return super.x; }
  };
  let o = {__proto__: myProto};
  arktest.assertEQ('right', o.m());
})();

(function TestSuperInObjectLiteralGetter() {
  let myProto = {
    __proto__ : {'x': 'right' },
    get p() { return super.x; }
  };
  let o = {__proto__: myProto};
  arktest.assertEQ('right', o.p);
})();

(function TestSuperInObjectLiteralSetter() {
  let readValue;
  let myProto = {
    __proto__ : {'x': 'right' },
    set p(x) { readValue = super.x; }
  };
  let o = {__proto__: myProto};
  o.p = 'whatever';
  arktest.assertEQ('right', readValue);
})();

(function TestSuperInObjectLiteralProperty() {
  class OuterBase {};
  OuterBase.prototype.x = 'right';
  class Outer extends OuterBase {
    m2() {
      let myProto = {
        __proto__ : {'x': 'wrong' },
        m: () => super.x,
      };
      let o = {__proto__: myProto};
      return o.m();
    }
  }
  arktest.assertEQ('right', (new Outer()).m2());
})();

(function TestMethodScopes() {
  let object = { // object literal 1 starts
    __proto__: { // object literal 2 starts
      method1() { return 'right'; }
    }, // object literal 2 ends
    method2() {
      return super.method1();
    }
  }; // object literal 1 ends
  arktest.assertEQ('right', object.method2());
})();

(function TestEvalInObjectLiteral() {
  let o = {__proto__: {x: 'right'},
           x: 'wrong',
           m() {
             let r = 0;
             eval('r = super.x;');
             return r;
           }
          };

  arktest.assertEQ('right', o.m());
})();

(function TestEvalInMethod() {
  class A {};
  A.prototype.x = 'right';

  class B extends A {
    m() {
      let r;
      eval('r = super.x;');
      return r;
    }
  };
  B.prototype.x = 'wrong';

  let b = new B();
  arktest.assertEQ('right', b.m());
})();

(function TestSuperInsidePropertyInitializer() {
  class OuterBase {}
  OuterBase.prototype.prop = 'wrong';
  OuterBase.prop = 'wrong';

  class Outer extends OuterBase {
    m() {
      class A { }
      A.prototype.prop = 'right';

      class B extends A {
        public x = () => { return super.prop; };
      }

      B.prototype.prop = 'wrong';
      return (new B()).x();
    }
  }
  Outer.prototype.prop = 'wrong';
  Outer.prop = 'wrong';

  arktest.assertEQ('right', (new Outer()).m());
})();

(function TestSuperInsideStaticPropertyInitializer() {
  class OuterBase {}
  OuterBase.prototype.prop = 'wrong';
  OuterBase.prop = 'wrong';

  class Outer extends OuterBase {
    m() {
      class A { }
      A.prop = 'right';
      A.prototype.prop = 'wrong';
      class B extends A {
        public static x = super.prop;
      }
      B.prop = 'wrong';
      B.prototype.prop = 'wrong';
      return B.x;
    }
  }
  Outer.prototype.prop = 'wrong';
  Outer.prop = 'wrong';

  arktest.assertEQ('right', (new Outer).m());
})();

(function TestSuperInsideStaticPropertyInitializer2() {
  class A extends class {
                      a() { return 'wrong'; }
                  } {
    m() {
      class C extends class {
                        static a() { return 'right'; }
                      } {
        public static staticProp = super.a;
      };
      return C.staticProp;
    }
  };
  arktest.assertEQ('right', (new A()).m()());
})();

(function TestSuperInsideExtends() {
  class C extends class {
                    static a = 'right';
                  } {
    public static m = class D extends new Proxy(function f() {},
                                         {get:(t, k) => {
                                            if (k == 'prototype') {
                                              return Function.prototype;
                                            }
                                            return super.a;
                                          }
                                         }) {}
  };
  arktest.assertEQ('right', C.m.a);
})();

// Same as the previous test but without a Proxy.
(function TestSuperInsideExtends2() {
  function f(x) {
    function A() { }
    A.x = x;
    return A;
  }

  class B {};
  B.a = 'right';

  // How to write "super" inside the extends clause? The "class extends value"
  // needs to be a constructor.
  class C extends B {
    public static m = class D extends f({m2: () => { return super.a;}}) { }
  }

  // C.m is a class. Its "parent class" is a function (returned by f). C.m.x
  // binds to the parent's x, which is whatever we passed as a param to f.
  // In this case, it's an object which has a property m2.

  // Since m2 is an arrow function, and not a method, "super" inside it
  // doesn't bind to the object where m2 is defined, but outside.
  arktest.assertEQ('right', C.m.x.m2());
})();
