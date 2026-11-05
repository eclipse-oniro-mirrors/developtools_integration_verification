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
expected_out_1: "Semantic error ESE0087: Property 'getOwnPropertyDescriptor' does not exist on type 'Object'"
---*/

function assertMethodDescriptor(object: Object, name: string) {
    let descr = Object.getOwnPropertyDescriptor(object, name);
    arktest.assertTrue(descr.configurable);
    arktest.assertFalse(descr.enumerable);
    arktest.assertTrue(descr.writable);
    arktest.assertEQ('function', typeof descr.value);
    arktest.assertFalse('prototype' in descr.value);
    arktest.assertEQ(name, descr.value.name);
}


function assertAccessorDescriptor(object: Object, name: string) {
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


(function TestProto() {
  class C {
    __proto__() { return 1; }
  }
  assertMethodDescriptor(C.prototype, '__proto__');
  arktest.assertEQ(1, new C().__proto__());
})();


(function TestProtoStatic() {
  class C {
    static __proto__() { return 1; }
  }
  assertMethodDescriptor(C, '__proto__');
  arktest.assertEQ(1, C.__proto__());
})();


(function TestProtoAccessor() {
  class C {
    get __proto__() { return this._p; }
    set __proto__(v) { this._p = v; }
  }
  assertAccessorDescriptor(C.prototype, '__proto__');
  let c = new C();
  c._p = 1;
  arktest.assertEQ(1, c.__proto__);
  c.__proto__ = 2;
  arktest.assertEQ(2, c.__proto__);
})();


(function TestStaticProtoAccessor() {
  class C {
    static get __proto__() { return this._p; }
    static set __proto__(v) { this._p = v; }
  }
  assertAccessorDescriptor(C, '__proto__');
  C._p = 1;
  arktest.assertEQ(1, C.__proto__);
  C.__proto__ = 2;
  arktest.assertEQ(2, C.__proto__);
})();


(function TestSettersOnProto() {
  function base() {}
  base.prototype = {
    set constructor(_) {
      arktest.assertTrue(false);
    },
    set m(_) {
      arktest.assertTrue(false);
    }
  };
  Object.defineProperty(base, 'staticM', {
    set: function() {
      arktest.assertTrue(false);
    }
  });

  class C extends base {
    m() {
      return 1;
    }
    static staticM() {
      return 2;
    }
  }

  arktest.assertEQ(1, new C().m());
  arktest.assertEQ(2, C.staticM());
})();


(function TestConstructableButNoPrototype() {
  let base = function() {}.bind();
  arktest.expectThrow(function() {
    class C extends base {}
  }, ((e: Error): boolean => e instanceof TypeError));
})();


(function TestPrototypeGetter() {
  let calls = 0;
  let base = function() {}.bind();
  Object.defineProperty(base, 'prototype', {
    get: function() {
      calls++;
      return null;
    },
    configurable: true
  });
  class C extends base {}
  arktest.assertEQ(1, calls);

  calls = 0;
  Object.defineProperty(base, 'prototype', {
    get: function() {
      calls++;
      return 42;
    },
    configurable: true
  });
  arktest.expectThrow(function() {
    class C extends base {}
  }, ((e: Error): boolean => e instanceof TypeError));
  arktest.assertEQ(1, calls);
})();


(function TestPrototypeSetter() {
  let base = function() {}.bind();
  Object.defineProperty(base, 'prototype', {
    set: function() {
      arktest.assertTrue(false);
    }
  });
  arktest.expectThrow(function() {
    class C extends base {}
  }, ((e: Error): boolean => e instanceof TypeError));
})();
