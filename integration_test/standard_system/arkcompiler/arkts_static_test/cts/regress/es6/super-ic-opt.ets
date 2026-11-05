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

(function TestPropertyIsInTheHomeObjectsProto() {
  // Test where the property is a constant found on home object's proto. This
  // will generate a minimorphic property load.
  class A {}
  A.prototype.bar = 'wrong value: A.prototype.bar';

  class B extends A {};
  B.prototype.bar = 'correct value';

  class C extends B {
    foo() { return super.bar; }
  }
  C.prototype.bar = 'wrong value: D.prototype.bar';
  ArkTools.prepareFunctionForOptimization(C.prototype.foo);

  let o = new C();
  o.bar = 'wrong value: o.bar';

  // Fill in the feedback.
  let r = o.foo();
  arktest.assertEQ('correct value', r);
  ArkTools.optimizeFunctionOnNextCall(C.prototype.foo);

  // Test the optimized function.
  r = o.foo();
  arktest.assertEQ('correct value', r);

  // Assert that the function was not deoptimized.
  assertOptimized(C.prototype.foo);

  // Change the property value.
  B.prototype.bar = 'new value';
  r = o.foo();
  arktest.assertEQ('new value', r);
})();

(function TestPropertyIsGetterInTheHomeObjectsProto() {
  // Test where the property is a constant found on home object's proto. This
  // will generate a minimorphic property load.
  class A {}
  A.prototype.bar = 'wrong value: A.prototype.bar';

  class B extends A {
    get bar() { return this.this_value; }
  }
  class C extends B {
    foo() { return super.bar; }
  }
  C.prototype.bar = 'wrong value: D.prototype.bar';
  ArkTools.prepareFunctionForOptimization(C.prototype.foo);

  let o = new C();
  o.bar = 'wrong value: o.bar';
  o.this_value = 'correct value';

  // Fill in the feedback.
  let r = o.foo();
  arktest.assertEQ('correct value', r);
  ArkTools.optimizeFunctionOnNextCall(C.prototype.foo);

  // Test the optimized function.
  r = o.foo();
  arktest.assertEQ('correct value', r);

  // Assert that the function was not deoptimized.
  assertOptimized(C.prototype.foo);

  // Change the property value.
  o.this_value = 'new value';
  r = o.foo();
  arktest.assertEQ('new value', r);
})();

(function TestPropertyIsConstantInThePrototypeChain() {
  // Test where the property is a constant found on the prototype chain of the
  // lookup start object.
  class A {}
  A.prototype.bar = 'wrong value: A.prototype.bar';

  class B extends A {};
  B.prototype.bar = 'correct value';

  class C extends B {};

  class D extends C {
    foo() { return super.bar; }
  }
  D.prototype.bar = 'wrong value: D.prototype.bar';
  ArkTools.prepareFunctionForOptimization(D.prototype.foo);

  let o = new D();
  o.bar = 'wrong value: o.bar';

  // Fill in the feedback.
  let r = o.foo();
  arktest.assertEQ('correct value', r);

  ArkTools.optimizeFunctionOnNextCall(D.prototype.foo);

  // Test the optimized function.
  r = o.foo();
  arktest.assertEQ('correct value', r);

  // Assert that the function was not deoptimized.
  assertOptimized(D.prototype.foo);

  // Change the property value.
  B.prototype.bar = 'new value';
  r = o.foo();
  arktest.assertEQ('new value', r);

  // Assert that the function was deoptimized (dependency to the constant
  // value).
  // TODO(upstream engine:11457) We don't support inlining JSLoadNamedFromSuper for
  // dictionary mode prototypes, yet. Therefore, if
  // dict_property_const_tracking is enabled, the optimized code only
  // contains a call to the IC handler and doesn't get deopted.
  arktest.assertEQ(ArkTools.isDictPropertyConstTrackingEnabled(),
               isOptimized(D.prototype.foo));
})();

(function TestPropertyIsNonConstantData() {
  // Test for a case where the property is a non-constant data property found
  // in the lookup start object.
  class A {}
  A.prototype.bar = 'wrong value: A.prototype.bar';

  class B extends A {};
  B.prototype.bar = 'initial value';

  class C extends B {
    foo() { return super.bar; }
  }
  C.prototype.bar = 'wrong value: C.prototype.bar';
  ArkTools.prepareFunctionForOptimization(C.prototype.foo);

  let o = new C();
  o.bar = 'wrong value: o.bar';

  // Make the property look like a non-constant.
  B.prototype.bar = 'correct value';

  // Fill in the feedback.
  let r = o.foo();
  arktest.assertEQ('correct value', r);
  ArkTools.optimizeFunctionOnNextCall(C.prototype.foo);

  // Test the optimized function.
  r = o.foo();
  arktest.assertEQ('correct value', r);

  // Assert that the function was not deoptimized.
  assertOptimized(C.prototype.foo);

  // Change the property value.
  B.prototype.bar = 'new value';
  r = o.foo();
  arktest.assertEQ('new value', r);

  // Assert that the function was still not deoptimized (the value was not a
  // constant to begin with).
  assertOptimized(C.prototype.foo);
})();

(function TestPropertyIsGetter() {
  class A {}
  A.prototype.bar = 'wrong value: A.prototype.bar';

  class B extends A {
    get bar() {
      return this.test_value;
    }
  };

  class C extends B {}

  class D extends C {
    foo() {
      const b = super.bar;
      return b;
    }
  }
  ArkTools.prepareFunctionForOptimization(D.prototype.foo);
  D.prototype.bar = 'wrong value: D.prototype.bar';

  let o = new D();
  o.bar = 'wrong value: o.bar';
  o.test_value = 'correct value';

  // Fill in the feedback.
  let r = o.foo();
  arktest.assertEQ('correct value', r);

  ArkTools.optimizeFunctionOnNextCall(D.prototype.foo);

  // Test the optimized function.
  r = o.foo();
  arktest.assertEQ('correct value', r);

  // Assert that the function was not deoptimized.
  assertOptimized(D.prototype.foo);
})();

(function TestPropertyInsertedInTheMiddle() {
  // Test for a case where the property is a constant found in the lookup start
  // object.
  class A {}
  A.prototype.bar = 'correct value';

  class B extends A {};

  class C extends B {
    foo() { return super.bar; }
  }
  C.prototype.bar = 'wrong value: C.prototype.bar';
  ArkTools.prepareFunctionForOptimization(C.prototype.foo);

  let o = new C();
  o.bar = 'wrong value: o.bar';

  // Fill in the feedback.
  let r = o.foo();
  arktest.assertEQ('correct value', r);
  ArkTools.optimizeFunctionOnNextCall(C.prototype.foo);

  // Test the optimized function.
  r = o.foo();
  arktest.assertEQ('correct value', r);

  // Assert that the function was not deoptimized.
  assertOptimized(C.prototype.foo);

  // Insert the property into the prototype chain between the lookup start
  // object and the old holder.
  B.prototype.bar = 'new value';
  r = o.foo();
  arktest.assertEQ('new value', r);

  // Assert that the function was deoptimized (holder changed).
  // TODO(upstream engine:11457) We don't support inlining JSLoadNamedFromSuper for
  // dictionary mode prototypes, yet. Therefore, if
  // dict_property_const_tracking is enabled, the optimized code only
  // contains a call to the IC handler and doesn't get deopted.
  arktest.assertEQ(ArkTools.isDictPropertyConstTrackingEnabled(),
               isOptimized(C.prototype.foo));
})();

(function TestUnexpectedHomeObjectPrototypeDeoptimizes() {
  class A {}
  A.prototype.bar = 'wrong value: A.prototype.bar';

  class B extends A {}
  B.prototype.bar = 'correct value';

  class C extends B {}

  class D extends C {
    foo() { return super.bar; }
  }
  ArkTools.prepareFunctionForOptimization(D.prototype.foo);
  D.prototype.bar = 'wrong value: D.prototype.bar';

  const o = new D();

  // Fill in the feedback.
  let r = o.foo();
  arktest.assertEQ('correct value', r);

  ArkTools.optimizeFunctionOnNextCall(D.prototype.foo);

  // Test the optimized function.
  r = o.foo();
  arktest.assertEQ('correct value', r);

  // Assert that the function was not deoptimized.
  assertOptimized(D.prototype.foo);

  // Change the home object's prototype.
  D.prototype.__proto__ = {'bar': 'new value'};
  r = o.foo();
  arktest.assertEQ('new value', r);

  // Assert that the function was deoptimized.
  // TODO(upstream engine:11457) We don't support inlining JSLoadNamedFromSuper for
  // dictionary mode prototypes, yet. Therefore, if
  // dict_property_const_tracking is enabled, the optimized code only
  // contains a call to the IC handler and doesn't get deopted.
  arktest.assertEQ(ArkTools.isDictPropertyConstTrackingEnabled(),
               isOptimized(D.prototype.foo));

})();

(function TestUnexpectedReceiverDoesNotDeoptimize() {
  class A {}
  A.prototype.bar = 'wrong value: A.prototype.bar';

  class B extends A {};
  B.prototype.bar = 'correct value';

  class C extends B {
    foo() { return super.bar; }
  }
  C.prototype.bar = 'wrong value: C.prototype.bar';
  ArkTools.prepareFunctionForOptimization(C.prototype.foo);

  let o = new C();
  o.bar = 'wrong value: o.bar';

  // Fill in the feedback.
  let r = o.foo();
  arktest.assertEQ('correct value', r);

  ArkTools.optimizeFunctionOnNextCall(C.prototype.foo);
  o.foo();
  assertOptimized(C.prototype.foo);

  // Test the optimized function with an unexpected receiver.
  r = C.prototype.foo.call({'lol': 5});
  arktest.assertEQ('correct value', r);

  // Assert that the function was not deoptimized.
  assertOptimized(C.prototype.foo);
})();

(function TestPolymorphic() {
  class A {}
  A.prototype.bar = 'wrong value: A.prototype.bar';

  class B extends A {}
  B.prototype.bar = 'correct value';

  class C extends B {}

  class D extends C {
    foo() { return super.bar; }
  }
  ArkTools.prepareFunctionForOptimization(D.prototype.foo);
  D.prototype.bar = 'wrong value: D.prototype.bar';

  const o = new D();

  // Create objects which will act as the "home object's prototype" later.
  const prototypes = [{'a': 0}, {'b': 0}];
  for (p of prototypes) {
    p.__proto__ = B.prototype;
  }

  // Fill in the feedback (polymorphic).
  for (p of prototypes) {
    D.prototype.__proto__ = p;
    const r = o.foo();
    arktest.assertEQ('correct value', r);
  }

  ArkTools.optimizeFunctionOnNextCall(D.prototype.foo);

  // Test the optimized function - don't change the home object's proto any
  // more.
  let r = o.foo();
  arktest.assertEQ('correct value', r);

  // Assert that the function was not deoptimized.
  assertOptimized(D.prototype.foo);
})();

(function TestPolymorphicWithGetter() {
  class A {}
  A.prototype.bar = 'wrong value: A.prototype.bar';

  class B extends A {
    get bar() {
      return this.test_value;
    }
  }

  class C extends B {}

  class D extends C {
    foo() { return super.bar; }
  }
  ArkTools.prepareFunctionForOptimization(D.prototype.foo);
  D.prototype.bar = 'wrong value: D.prototype.bar';

  const o = new D();
  o.test_value = 'correct value';

  // Create objects which will act as the "home object's prototype" later.
  const prototypes = [{'a': 0}, {'b': 0}];
  for (p of prototypes) {
    p.__proto__ = B.prototype;
  }

  // Fill in the feedback.
  for (p of prototypes) {
    D.prototype.__proto__ = p;
    const r = o.foo();
    arktest.assertEQ('correct value', r);
  }

  ArkTools.optimizeFunctionOnNextCall(D.prototype.foo);

  // Test the optimized function - don't change the home object's proto any
  // more.
  const r = o.foo();
  arktest.assertEQ('correct value', r);

  // Assert that the function was not deoptimized.
  assertOptimized(D.prototype.foo);
})();

(function TestPolymorphicMixinDoesNotDeopt() {
  function createClasses() {
    class A {}
    A.prototype.bar = 'correct value';
    class B extends A {
      foo() { return super.bar; }
    }
    return B;
  }

  const b1 = createClasses();
  ArkTools.prepareFunctionForOptimization(b1.prototype.foo);
  const b2 = createClasses();
  ArkTools.prepareFunctionForOptimization(b2.prototype.foo);

  class C1 extends b1 {};
  class C2 extends b2 {};

  const objects = [new C1(), new C2()];

  // Fill in the feedback.
  for (o of objects) {
    const r = o.foo();
    arktest.assertEQ('correct value', r);
  }
  ArkTools.optimizeFunctionOnNextCall(b1.prototype.foo);
  ArkTools.optimizeFunctionOnNextCall(b2.prototype.foo);

  // Test the optimized function.
  for (o of objects) {
    const r = o.foo();
    arktest.assertEQ('correct value', r);
  }
  assertOptimized(b1.prototype.foo);
  assertOptimized(b2.prototype.foo);
})();

(function TestHomeObjectProtoIsGlobalThis() {
  class A {}

  class B extends A {
    foo() { return super.bar; }
  }
  B.prototype.__proto__ = globalThis;
  globalThis.bar = 'correct value';
  ArkTools.prepareFunctionForOptimization(B.prototype.foo);

  let o = new B();

  // Fill in the feedback.
  let r = o.foo();
  arktest.assertEQ('correct value', r);

  ArkTools.optimizeFunctionOnNextCall(B.prototype.foo);

  // Test the optimized function.
  r = o.foo();
  arktest.assertEQ('correct value', r);

  // Assert that the function was not deoptimized.
  assertOptimized(B.prototype.foo);

  globalThis.bar = 'new value';

  r = o.foo();
  arktest.assertEQ('new value', r);
})();

(function TestMegamorphic() {
  class A {}
  A.prototype.bar = 'wrong value: A.prototype.bar';

  class B extends A {}
  B.prototype.bar = 'correct value';

  class C extends B {}

  class D extends C {
    foo() { return super.bar; }
  }
  ArkTools.prepareFunctionForOptimization(D.prototype.foo);
  D.prototype.bar = 'wrong value: D.prototype.bar';

  const o = new D();

  // Create objects which will act as the "home object's prototype" later.
  const prototypes = [{'a': 0}, {'b': 0}, {'c': 0}, {'d': 0}, {'e': 0},
  {'f': 0}, {'g': 0}, {'e': 0}];
  for (p of prototypes) {
    p.__proto__ = B.prototype;
  }

  // Fill in the feedback (megamorphic).
  for (p of prototypes) {
    D.prototype.__proto__ = p;
    const r = o.foo();
    arktest.assertEQ('correct value', r);
  }

  ArkTools.optimizeFunctionOnNextCall(D.prototype.foo);

  // Test the optimized function - don't change the home object's proto any
  // more.
  let r = o.foo();
  arktest.assertEQ('correct value', r);

  // Assert that the function was not deoptimized.
  assertOptimized(D.prototype.foo);
})();

(function TestMegamorphicWithGetter() {
  class A {}
  A.prototype.bar = 'wrong value: A.prototype.bar';

  class B extends A {
    get bar() {
      return this.test_value;
    }
  };

  class C extends B {}

  class D extends C {
    foo() { return super.bar;}
  }
  ArkTools.prepareFunctionForOptimization(D.prototype.foo);
  D.prototype.bar = 'wrong value: D.prototype.bar';

  const o = new D();
  o.test_value = 'correct value';

  // Create objects which will act as the "home object's prototype" later.
  const prototypes = [{'a': 0}, {'b': 0}, {'c': 0}, {'d': 0}, {'e': 0},
                      {'f': 0}, {'g': 0}, {'e': 0}];
  for (p of prototypes) {
    p.__proto__ = B.prototype;
  }

  // Fill in the feedback (megamorphic).
  for (p of prototypes) {
    D.prototype.__proto__ = p;
    const r = o.foo();
    arktest.assertEQ('correct value', r);
  }

  ArkTools.optimizeFunctionOnNextCall(D.prototype.foo);

  // Test the optimized function - don't change the home object's proto any
  // more.
  const r = o.foo();
  arktest.assertEQ('correct value', r);
})();

(function TestHomeObjectProtoIsGlobalThisGetterProperty() {
  class A {}

  class B extends A {
    foo() { return super.bar; }
  }
  B.prototype.__proto__ = globalThis;
  Object.defineProperty(globalThis, 'bar', {get: function() { return this.this_value; }});
  ArkTools.prepareFunctionForOptimization(B.prototype.foo);

  let o = new B();
  o.this_value = 'correct value';

  // Fill in the feedback.
  let r = o.foo();
  arktest.assertEQ('correct value', r);

  ArkTools.optimizeFunctionOnNextCall(B.prototype.foo);

  // Test the optimized function.
  r = o.foo();
  arktest.assertEQ('correct value', r);

  // Assert that the function was not deoptimized.
  assertOptimized(B.prototype.foo);
})();

(() => {
(function TestPropertyIsConstant() {
  class A {}
  A.prototype.bar = 'wrong value: A.prototype.bar';

  class B extends A {};
  B.prototype.bar = 'correct value';

  class C extends B {
    foo() { return super.bar; }
  }
  C.prototype.bar = 'wrong value: C.prototype.bar';
  ArkTools.prepareFunctionForOptimization(C.prototype.foo);

  let o = new C();
  o.bar = 'wrong value: o.bar';

  // Fill in the feedback.
  let r;
  r = o.foo();
  arktest.assertEQ('correct value', r);

  ArkTools.optimizeFunctionOnNextCall(C.prototype.foo);

  // Test the optimized function.
  r = o.foo();
  arktest.assertEQ('correct value', r);

  // Assert that the function was not deoptimized.
  assertOptimized(C.prototype.foo);

  B.prototype.bar = 'new value';
  r = o.foo();
  arktest.assertEQ('new value', r);

  arktest.assertEQ(ArkTools.isDictPropertyConstTrackingEnabled(),
               isOptimized(C.prototype.foo));
})();

(function TestSuperpropertyAccessInlined() {
  class A {}
  A.prototype.bar = 'wrong value: A.prototype.bar';

  class B extends A {}
  B.prototype.bar = 'correct value';

  class C extends B {}

  let inlineThisIsBeingInterpreted;
  class D extends C {
    inline_this() {
      inlineThisIsBeingInterpreted = ArkTools.isBeingInterpreted();
      return super.bar;
    }
    foo() { return this.inline_this(); }
  }
  ArkTools.prepareFunctionForOptimization(D.prototype.inline_this);
  ArkTools.prepareFunctionForOptimization(D.prototype.foo);
  D.prototype.bar = 'wrong value: D.prototype.bar';

  const o = new D();

  let r = o.foo();
  arktest.assertEQ('correct value', r);

  ArkTools.optimizeFunctionOnNextCall(D.prototype.foo);

  r = o.foo();
  arktest.assertEQ('correct value', r);

  assertOptimized(D.prototype.foo);

  arktest.assertFalse(inlineThisIsBeingInterpreted);
})();

(function TestMegamorphicInlined() {
  class A {}
  A.prototype.bar = 'wrong value: A.prototype.bar';

  class B extends A {}
  B.prototype.bar = 'correct value';

  class C extends B {}

  let inlineThisIsBeingInterpreted;
  class D extends C {
    inline_this() {
      inlineThisIsBeingInterpreted = ArkTools.isBeingInterpreted();
      return super.bar;
    }
    foo() { return this.inline_this(); }
  }
  ArkTools.prepareFunctionForOptimization(D.prototype.inline_this);
  ArkTools.prepareFunctionForOptimization(D.prototype.foo);
  D.prototype.bar = 'wrong value: D.prototype.bar';

  const o = new D();

  const prototypes = [{'a': 0}, {'b': 0}, {'c': 0}, {'d': 0}, {'e': 0},
  {'f': 0}, {'g': 0}, {'e': 0}];
  for (p of prototypes) {
    p.__proto__ = B.prototype;
  }

  for (p of prototypes) {
    D.prototype.__proto__ = p;
    const r = o.foo();
    arktest.assertEQ('correct value', r);
  }

  ArkTools.optimizeFunctionOnNextCall(D.prototype.foo);

  let r = o.foo();
  arktest.assertEQ('correct value', r);

  assertOptimized(D.prototype.foo);

  arktest.assertFalse(inlineThisIsBeingInterpreted);
})();

(function TestHomeObjectProtoIsGlobalThisGetterPropertyInlined() {
  class A {}

  let inlineThisIsBeingInterpreted;
  class B extends A {
    inline_this() {
      inlineThisIsBeingInterpreted = ArkTools.isBeingInterpreted();
      return super.bar;
    }
    foo() { return this.inline_this(); }
  }
  B.prototype.__proto__ = globalThis;
  Object.defineProperty(globalThis, 'bar',
                        {get: function() { return this.this_value; }});
  ArkTools.prepareFunctionForOptimization(B.prototype.inline_this);
  ArkTools.prepareFunctionForOptimization(B.prototype.foo);

  let o = new B();
  o.this_value = 'correct value';

  let r = o.foo();
  arktest.assertEQ('correct value', r);

  ArkTools.optimizeFunctionOnNextCall(B.prototype.foo);

  r = o.foo();
  arktest.assertEQ('correct value', r);

  assertOptimized(B.prototype.foo);

  arktest.assertFalse(inlineThisIsBeingInterpreted);
})();
})();

(function TestHomeObjectProtoIsFunctionAndPropertyIsPrototype() {
  // There are special optimizations for accessing Function.prototype. Test
  // that super property access which ends up accessing it works.
  class A {}

  class B extends A {
    foo() { return super.prototype; }
  }
  function f() {}
  B.prototype.__proto__ = f;
  ArkTools.prepareFunctionForOptimization(B.prototype.foo);

  let o = new B();

  let r = o.foo();
  arktest.assertEQ(f.prototype, r);

  ArkTools.optimizeFunctionOnNextCall(B.prototype.foo);

  r = o.foo();
  arktest.assertEQ(f.prototype, r);

  assertOptimized(B.prototype.foo);
})();
