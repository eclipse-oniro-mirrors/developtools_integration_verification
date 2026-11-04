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

(function TestClass() {
  'use strict';

  let calls = 0;
  class Base {
    constructor(_) {
      arktest.assertEQ(Base, new.target);
      calls++;
    }
  }
  arktest.assertTrue(new Base(1) instanceof Base);
  arktest.assertTrue(new Base(1, 2) instanceof Base);
  arktest.assertTrue(new Base() instanceof Base);
  arktest.assertEQ(3, calls);
})();


(function TestDerivedClass() {
  'use strict';

  let calls = 0;
  class Base {
    constructor(expected) {
      arktest.assertEQ(expected, new.target);
    }
  }
  class Derived extends Base {
    constructor(expected) {
      super(expected);
      arktest.assertEQ(expected, new.target);
      calls++;
    }
  }
  new Derived(Derived, 'extra');
  new Derived(Derived);
  arktest.assertEQ(2, calls);

  class Derived2 extends Derived {}
  calls = 0;
  new Derived2(Derived2);
  new Derived2(Derived2, 'extra');
  arktest.assertEQ(2, calls);
})();


(function TestFunctionCall() {
  let calls;
  function F(expected) {
    calls++;
    arktest.assertEQ(expected, new.target);
  }

  calls = 0;
  F(undefined);
  F(undefined, 'extra');
  F();
  arktest.assertEQ(3, calls);

  calls = 0;
  F.call({}, undefined);
  F.call({}, undefined, 'extra');
  F.call({});
  arktest.assertEQ(3, calls);

  calls = 0;
  F.apply({}, [undefined]);
  F.apply({}, [undefined, 'extra']);
  F.apply({}, []);
  arktest.assertEQ(3, calls);
})();


(function TestFunctionConstruct() {
  let calls;
  function F(expected) {
    calls++;
    arktest.assertEQ(expected, new.target);
  }

  calls = 0;
  new F(F);
  new F(F, 'extra');
  arktest.assertEQ(2, calls);
})();


(function TestClassExtendsFunction() {
  'use strict';

  let calls = 0;
  function F(expected) {
    arktest.assertEQ(expected, new.target);
  }
  class Derived extends F {
    constructor(expected) {
      super(expected);
      arktest.assertEQ(expected, new.target);
      calls++;
    }
  }

  new Derived(Derived);
  new Derived(Derived, 'extra');
  arktest.assertEQ(2, calls);
})();


(function TestFunctionReturnObject() {
  function F(expected) {
    arktest.assertEQ(expected, new.target);
    return /abc/;
  }

  arktest.assertTrue(new F(F) instanceof RegExp);
  arktest.assertTrue(new F(F, 'extra') instanceof RegExp);

  arktest.assertTrue(F(undefined) instanceof RegExp);
  arktest.assertTrue(F() instanceof RegExp);
  arktest.assertTrue(F(undefined, 'extra') instanceof RegExp);
})();


(function TestClassReturnObject() {
  'use strict';

  class Base {
    constructor(expected) {
      arktest.assertEQ(expected, new.target);
      return /abc/;
    }
  }

  arktest.assertTrue(new Base(Base) instanceof RegExp);
  arktest.assertTrue(new Base(Base, 'extra') instanceof RegExp);

  class Derived extends Base {}
  arktest.assertTrue(new Derived(Derived) instanceof RegExp);
  arktest.assertTrue(new Derived(Derived, 'extra') instanceof RegExp);

  class Derived2 extends Base {
    constructor(expected) {
      super(expected);
      arktest.assertTrue(this instanceof RegExp);
    }
  }
  arktest.assertTrue(new Derived2(Derived2) instanceof RegExp);
  arktest.assertTrue(new Derived2(Derived2, 'extra') instanceof RegExp);
})();


(function TestReflectConstruct() {
  let calls = 0;
  function F(expected) {
    calls++;
    arktest.assertEQ(expected, new.target);
  }

  let o = Reflect.construct(F, [F]);
  arktest.assertEQ(Object.getPrototypeOf(o), F.prototype);
  o = Reflect.construct(F, [F, 'extra']);
  arktest.assertEQ(Object.getPrototypeOf(o), F.prototype);
  arktest.assertEQ(2, calls);

  calls = 0;
  o = Reflect.construct(F, [F], F);
  arktest.assertEQ(Object.getPrototypeOf(o), F.prototype);
  o = Reflect.construct(F, [F, 'extra'], F);
  arktest.assertEQ(Object.getPrototypeOf(o), F.prototype);
  arktest.assertEQ(2, calls);


  function g() {}
  calls = 0;
  o = Reflect.construct(F, [g], g);
  arktest.assertEQ(Object.getPrototypeOf(o), g.prototype);
  o = Reflect.construct(F, [g, 'extra'], g);
  arktest.assertEQ(Object.getPrototypeOf(o), g.prototype);
  arktest.assertEQ(2, calls);
})();


(function TestRestParametersFunction() {
  function F(...rest) {
    arktest.assertEQ(rest[0], new.target);
  }

  arktest.assertTrue(new F(F) instanceof F);
  arktest.assertTrue(new F(F, 'extra') instanceof F);
})();


(function TestRestParametersClass() {
  'use strict';

  class Base {
    constructor(...rest) {
      arktest.assertEQ(rest[0], new.target);
    }
  }

  arktest.assertTrue(new Base(Base) instanceof Base);
  arktest.assertTrue(new Base(Base, 'extra') instanceof Base);

  class Derived extends Base {}

  arktest.assertTrue(new Derived(Derived) instanceof Derived);
  arktest.assertTrue(new Derived(Derived, 'extra') instanceof Derived);
})();


(function TestArrowFunction() {
  function F(expected) {
    (() => {
      arktest.assertEQ(expected, new.target);
    })();
  }

  arktest.assertTrue(new F(F) instanceof F);
  arktest.assertTrue(new F(F, 'extra') instanceof F);
})();


(function TestRestParametersClass() {
  'use strict';

  class Base {
    constructor(expected) {
      (() => {
        arktest.assertEQ(expected, new.target);
      })();
    }
  }

  arktest.assertTrue(new Base(Base) instanceof Base);
  arktest.assertTrue(new Base(Base, 'extra') instanceof Base);

  class Derived extends Base {}

  arktest.assertTrue(new Derived(Derived) instanceof Derived);
  arktest.assertTrue(new Derived(Derived, 'extra') instanceof Derived);
})();


(function TestSloppyArguments() {
  let length;
  let a0;
  let a1;
  let a2;
  let nt;
  function F(x) {
    arktest.assertEQ(length, arguments.length);
    arktest.assertEQ(a0, arguments[0]);
    arktest.assertEQ(a1, arguments[1]);
    arktest.assertEQ(a2, arguments[2]);
    arktest.assertEQ(nt, new.target);

    if (length > 0) {
      x = 42;
      arktest.assertEQ(42, x);
      arktest.assertEQ(42, arguments[0]);

      arguments[0] = 33;
      arktest.assertEQ(33, x);
      arktest.assertEQ(33, arguments[0]);
    }
  }

  nt = F;
  length = 0;
  new F();

  length = 1;
  a0 = 1;
  new F(1);

  length = 2;
  a0 = 1;
  a1 = 2;
  new F(1, 2);

  length = 3;
  a0 = 1;
  a1 = 2;
  a2 = 3;
  new F(1, 2, 3);

  nt = undefined;
  a0 = a1 = a2 = undefined;
  length = 0;
  F();

  length = 1;
  a0 = 1;
  F(1);

  length = 2;
  a0 = 1;
  a1 = 2;
  F(1, 2);

  length = 3;
  a0 = 1;
  a1 = 2;
  a2 = 3;
  F(1, 2, 3);
})();


(function TestStrictArguments() {
  let length;
  let a0;
  let a1;
  let a2;
  let nt;
  function F(x) {
    'use strict';
    arktest.assertEQ(length, arguments.length);
    arktest.assertEQ(a0, arguments[0]);
    arktest.assertEQ(a1, arguments[1]);
    arktest.assertEQ(a2, arguments[2]);
    arktest.assertEQ(nt, new.target);

    if (length > 0) {
      x = 42;
      arktest.assertEQ(a0, arguments[0]);

      arguments[0] = 33;
      arktest.assertEQ(33, arguments[0]);
    }
  }

  nt = F;
  length = 0;
  new F();

  length = 1;
  a0 = 1;
  new F(1);

  length = 2;
  a0 = 1;
  a1 = 2;
  new F(1, 2);

  length = 3;
  a0 = 1;
  a1 = 2;
  a2 = 3;
  new F(1, 2, 3);

  nt = undefined;
  a0 = a1 = a2 = undefined;
  length = 0;
  F();

  length = 1;
  a0 = 1;
  F(1);

  length = 2;
  a0 = 1;
  a1 = 2;
  F(1, 2);

  length = 3;
  a0 = 1;
  a1 = 2;
  a2 = 3;
  F(1, 2, 3);
})();


(function TestOtherScopes() {
  function F1() { return eval('\'use strict\'; new.target') }
  arktest.assertEQ(F1, new F1);
  function F2() { with ({}) return new.target }
  arktest.assertEQ(F2, new F2);
  function F3({a}) { return new.target }
  arktest.assertEQ(F3, new F3({}));
  function F4(...a) { return new.target }
  arktest.assertEQ(F4, new F4);
  function F5() { 'use strict'; { let x; return new.target } }
  arktest.assertEQ(F5, new F5);
  function F6() { with ({'new.target': 42}) return new.target }
  arktest.assertEQ(F6, new F6);
})();


// Has to be top-level to be inlined.
function GetNewTarget() { return new.target; }
(function TestInlining() {
  'use strict';
  new function() { arktest.assertEQ(undefined, GetNewTarget()); }
  new function() { arktest.assertEQ(GetNewTarget, new GetNewTarget()); }

  class A extends GetNewTarget {
    constructor() {
      let newTarget = super();
      this.newTarget = newTarget;
    }
  }
  arktest.assertEQ(A, new A().newTarget);
})();


(function TestEarlyErrors() {
  arktest.expectThrow(function() { Function('new.target = 42'); }, ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow(function() { Function('var foo = 1; new.target = foo = 42'); }, ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow(function() { Function('var foo = 1; foo = new.target = 42'); }, ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow(function() { Function('new.target--'); }, ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow(function() { Function('--new.target'); }, ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow(function() { Function('(new.target)++'); }, ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow(function() { Function('++(new.target)'); }, ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow(function() { Function('for (new.target of {});'); }, ((e: Error): boolean => e instanceof SyntaxError));
})();

(function TestOperatorPrecedence() {
  function A() {}
  function ConstructNewTargetDotProp() { return new new.target.Prop }
  ConstructNewTargetDotProp.Prop = A;
  arktest.assertTrue(new ConstructNewTargetDotProp instanceof A);

  function ConstructNewTargetBracketProp() { return new new.target['Prop'] }
  ConstructNewTargetBracketProp.Prop = A;
  arktest.assertTrue(new ConstructNewTargetBracketProp instanceof A);

  function RefNewTargetDotProp() { return new.target.Prop; }
  function b() {}
  RefNewTargetDotProp.Prop = b;
  arktest.assertEQ(new RefNewTargetDotProp, b);

  function RefNewTargetBracketProp() { return new.target['Prop']; }
  RefNewTargetBracketProp.Prop = b;
  arktest.assertEQ(new RefNewTargetBracketProp, b);

  let calls = 0;
  function ConstructNewTargetArgsDotProp(safe) {
    this.Prop = ++calls;
    return safe ? Object(new new.target().Prop) : this;
  }
  arktest.assertTrue(new ConstructNewTargetArgsDotProp instanceof ConstructNewTargetArgsDotProp);
  arktest.assertEQ(3, new ConstructNewTargetArgsDotProp(true) | 0);

  function ConstructNewTargetArgsBracketProp(safe) {
    this.Prop = ++calls;
    return safe ? Object(new new.target()['Prop']) : this;
  }
  arktest.assertTrue(new ConstructNewTargetArgsBracketProp instanceof ConstructNewTargetArgsBracketProp);
  arktest.assertEQ(6, new ConstructNewTargetArgsBracketProp(true) | 0);

  function CallNewTargetArgsDotProp(safe) {
    this.Prop = ++calls;
    return safe ? Object(new.target().Prop) : this;
  }
  arktest.assertTrue(new CallNewTargetArgsDotProp() instanceof CallNewTargetArgsDotProp);
  arktest.assertEQ(new CallNewTargetArgsDotProp(true) | 0, 9);

  function CallNewTargetArgsBracketProp(safe) {
    this.Prop = ++calls;
    return safe ? Object(new.target()['Prop']) : this;
  }
  arktest.assertTrue(new CallNewTargetArgsBracketProp() instanceof CallNewTargetArgsBracketProp);
  arktest.assertEQ(new CallNewTargetArgsBracketProp(true) | 0, 12);

  function TagNewTarget(callSite, ...subs) {
    return callSite ? subs : new.target`${new.target.name}`;
  }
  arktest.assertEQ(new TagNewTarget, ['tagNewTarget']);

  function c(callSite, ...subs) { return subs; }
  function TagNewTargetProp() { return new.target.Prop`${new.target.name}`; }
  TagNewTargetProp.Prop = c;
  arktest.assertEQ(new TagNewTargetProp, ['tagNewTargetProp']);
})();

(function testDeleteSloppy() {
  arktest.assertTrue(delete new.target);
})();

(function testDeleteStrict() {
  'use strict';
  arktest.assertTrue(delete new.target);
})();
