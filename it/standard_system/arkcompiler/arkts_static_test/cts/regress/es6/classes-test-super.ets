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

(function TestSuperInMethods() {
  class B {
    method() {
      return 1;
    }
    get x() {
      return 2;
    }
  }
  class C extends B {
    method() {
      arktest.assertEQ(2, super.x);
      return super.method();
    }
  }
  arktest.assertEQ(1, new C().method());
})();


(function TestSuperInGetter() {
  class B {
    method() {
      return 1;
    }
    get x() {
      return 2;
    }
  }
  class C extends B {
    get y() {
      arktest.assertEQ(2, super.x);
      return super.method();
    }
  }
  arktest.assertEQ(1, new C().y);
})();


(function TestSuperInSetter() {
  class B {
    method() {
      return 1;
    }
    get x() {
      return 2;
    }
  }
  class C extends B {
    set y(v) {
      arktest.assertEQ(3, v);
      arktest.assertEQ(2, super.x);
      arktest.assertEQ(1, super.method());
    }
  }
  arktest.assertEQ(3, new C().y = 3);
})();


(function TestSuperInStaticMethods() {
  class B {
    static method() {
      return 1;
    }
    static get x() {
      return 2;
    }
  }
  class C extends B {
    static method() {
      arktest.assertEQ(2, super.x);
      return super.method();
    }
  }
  arktest.assertEQ(1, C.method());
})();


(function TestSuperInStaticGetter() {
  class B {
    static method() {
      return 1;
    }
    static get x() {
      return 2;
    }
  }
  class C extends B {
    static get x() {
      arktest.assertEQ(2, super.x);
      return super.method();
    }
  }
  arktest.assertEQ(1, C.x);
})();


(function TestSuperInStaticSetter() {
  class B {
    static method() {
      return 1;
    }
    static get x() {
      return 2;
    }
  }
  class C extends B {
    static set x(v) {
      arktest.assertEQ(3, v);
      arktest.assertEQ(2, super.x);
      arktest.assertEQ(1, super.method());
    }
  }
  arktest.assertEQ(3, C.x = 3);
})();
