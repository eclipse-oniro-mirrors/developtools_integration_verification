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

(function TestMethod() {
  let object = {
    __proto__: {
      method(x) {
        return 'proto' + x;
      }
    },
    method(x) {
      return super.method(x);
    }
  };
  arktest.assertEQ('proto42', object.method(42));
})();


(function TestGetter() {
  let object = {
    __proto__: {
      _x: 42,
      get x() {
        return 'proto' + this._x;
      }
    },
    get x() {
      return super.x;
    }
  };
  arktest.assertEQ('proto42', object.x);
})();


(function TestSetter() {
  let object = {
    __proto__: {
      _x: 0,
      set x(v) {
        return this._x = v;
      }
    },
    set x(v) {
      super.x = v;
    }
  };
  arktest.assertEQ(1, object.x = 1);
  arktest.assertEQ(1, object._x);
  arktest.assertEQ(0, Object.getPrototypeOf(object)._x);
})();


(function TestOptimized() {
  // Object literals without any accessors get optimized.
  let object = {
    method() {
      return super.toString;
    }
  };
  arktest.assertEQ(Object.prototype.toString, object.method());
})();


(function TestConciseGenerator() {
  let o = {
    __proto__: {
      m() {
        return 42;
      }
    },
    *g() {
      yield super.m();
    },
  };

  arktest.assertEQ(42, o.g().next().value);
})();


(function TestSuperPropertyInEval() {
  let y = 3;
  let p  = {
    m() { return 1; },
    get x() { return 2; }
  };
  let o = {
    __proto__: p,
    evalM() {
      arktest.assertEQ(1, eval('super.m()'));
    },
    evalX() {
      arktest.assertEQ(2, eval('super.x'));
    },
    globalEval1() {
      arktest.expectThrow('super.x', ((e: Error): boolean => e instanceof SyntaxError));
      arktest.expectThrow('super.m()', ((e: Error): boolean => e instanceof SyntaxError));
    },
    globalEval2() {
      super.x;
      arktest.expectThrow('super.x', ((e: Error): boolean => e instanceof SyntaxError));
      arktest.expectThrow('super.m()', ((e: Error): boolean => e instanceof SyntaxError));
    }
  };
  o.evalM();
  o.evalX();
  o.globalEval1();
  o.globalEval2();
})();


(function TestSuperPropertyInArrow() {
  let y = 3;
  let p  = {
    m() { return 1; },
    get x() { return 2; }
  };
  let o = {
    __proto__: p,
    arrow() {
      arktest.assertEQ(super.x, (() => super.x)());
      arktest.assertEQ(super.m(), (() => super.m())());
      return (() => super.m())();
    }
  };
  arktest.assertEQ(1, o.arrow());
})();
