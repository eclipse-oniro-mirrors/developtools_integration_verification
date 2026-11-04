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

(function TestNameBindingConst() {
  arktest.expectThrow('class C { constructor() { C = 42; } }; new C();', ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow('new (class C { constructor() { C = 42; } })', ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow('class C { m() { C = 42; } }; new C().m()', ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow('new (class C { m() { C = 42; } }).m()', ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow('class C { get x() { C = 42; } }; new C().x', ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow('(new (class C { get x() { C = 42; } })).x', ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow('class C { set x(_) { C = 42; } }; new C().x = 15;', ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow('(new (class C { set x(_) { C = 42; } })).x = 15;', ((e: Error): boolean => e instanceof TypeError));
})();

(function TestNameBinding() {
  let C2;
  class C {
    constructor() {
      C2 = C;
    }
    m() {
      C2 = C;
    }
    get X() {
      C2 = C;
    }
    set X(_) {
      C2 = C;
    }
  }
  new C();
  arktest.assertEQ(C, C2);

  C2 = undefined;
  new C().m();
  arktest.assertEQ(C, C2);

  C2 = undefined;
  new C().X;
  arktest.assertEQ(C, C2);

  C2 = undefined;
  new C().X = 1;
  arktest.assertEQ(C, C2);
})();

(function TestNameBindingExpression() {
  let C3;
  let C = class C2 {
    constructor() {
      arktest.assertEQ(C2, C);
      C3 = C2;
    }
    m() {
      arktest.assertEQ(C2, C);
      C3 = C2;
    }
    get X() {
      arktest.assertEQ(C2, C);
      C3 = C2;
    }
    set X(_) {
      arktest.assertEQ(C2, C);
      C3 = C2;
    }
  }
  new C();
  arktest.assertEQ(C, C3);

  C3 = undefined;
  new C().m();
  arktest.assertEQ(C, C3);

  C3 = undefined;
  new C().X;
  arktest.assertEQ(C, C3);

  C3 = undefined;
  new C().X = 1;
  arktest.assertEQ(C, C3);
})();

(function TestNameBindingInExtendsExpression() {
  arktest.expectThrow(function() {
    class X extends X {}
  }, ((e: Error): boolean => e instanceof ReferenceError));

  arktest.expectThrow(function() {
    (class X extends X {});
  }, ((e: Error): boolean => e instanceof ReferenceError));

  arktest.expectThrow(function() {
    let X = (class X extends X {});
  }, ((e: Error): boolean => e instanceof ReferenceError));
})();
