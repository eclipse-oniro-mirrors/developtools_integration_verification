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
  let object = {
    method() {
      return 42;
    }
  };
  arktest.assertEQ(42, object.method());
})();


(function TestThis() {
  let object = {
    method() {
      arktest.assertEQ(object, this);
    }
  };
  object.method();
})();


(function TestDescriptor() {
  let object = {
    method() {
      return 42;
    }
  };

  let desc = Object.getOwnPropertyDescriptor(object, 'method');
  arktest.assertTrue(desc.enumerable);
  arktest.assertTrue(desc.configurable);
  arktest.assertTrue(desc.writable);
  arktest.assertEQ('function', typeof desc.value);

  arktest.assertEQ(42, desc.value());
})();


(function TestProto() {
  let object = {
    method() {}
  };

  arktest.assertEQ(Function.prototype, Object.getPrototypeOf(object.method));
})();


(function TestNotConstructable() {
  let object = {
    method() {}
  };

  arktest.expectThrow(function() {
    new object.method;
  });
})();


(function TestFunctionName() {
  let object = {
    method() {},
    1() {},
    2.0() {}
  };
  let f = object.method;
  arktest.assertEQ('method', f.name);
  let g = object[1];
  arktest.assertEQ('1', g.name);
  let h = object[2];
  arktest.assertEQ('2', h.name);
})();


(function TestNoBinding() {
  let method = 'local';
  let calls = 0;
  let object = {
    method() {
      calls++;
      arktest.assertEQ('local', method);
    }
  };
  object.method();
  arktest.assertEQ(1, calls);
})();


(function TestNoPrototype() {
  let object = {
    method() {}
  };
  let f = object.method;
  arktest.assertFalse(f.hasOwnProperty('prototype'));
  arktest.assertEQ(undefined, f.prototype);

  f.prototype = 42;
  arktest.assertEQ(42, f.prototype);
})();


(function TestNoRestrictedPropertiesStrict() {
  let obj = {
    method() { 'use strict'; }
  };
  arktest.assertFalse(obj.method.hasOwnProperty('arguments'));
  arktest.expectThrow(function() { return obj.method.arguments; }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { obj.method.arguments = {}; }, ((e: Error): boolean => e instanceof TypeError));

  arktest.assertFalse(obj.method.hasOwnProperty('caller'));
  arktest.expectThrow(function() { return obj.method.caller; }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { obj.method.caller = {}; }, ((e: Error): boolean => e instanceof TypeError));
})();


(function TestNoRestrictedPropertiesSloppy() {
  let obj = {
    method() {}
  };
  arktest.assertFalse(obj.method.hasOwnProperty('arguments'));
  arktest.expectThrow(function() { return obj.method.arguments; }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { obj.method.arguments = {}; }, ((e: Error): boolean => e instanceof TypeError));

  arktest.assertFalse(obj.method.hasOwnProperty('caller'));
  arktest.expectThrow(function() { return obj.method.caller; }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { obj.method.caller = {}; }, ((e: Error): boolean => e instanceof TypeError));
})();


(function TestToString() {
  let object = {
    method() { 42; }
  };
  arktest.assertEQ('method() { 42; }', object.method.toString());
})();


(function TestOptimized() {
  let object = {
    method() { return 42; }
  };
  ArkTools.prepareFunctionForOptimization(object.method);
  arktest.assertEQ(42, object.method());
  arktest.assertEQ(42, object.method());
  ArkTools.optimizeFunctionOnNextCall(object.method);
  arktest.assertEQ(42, object.method());
  arktest.assertFalse(object.method.hasOwnProperty('prototype'));
})();


///////////////////////////////////////////////////////////////////////////////


const generatorFunction = function*() {}.__proto__.constructor;
const generatorPrototype = Object.getPrototypeOf(function*() {}).prototype;


function assertIteratorResult(value, done, result) {
  arktest.assertEQ({value: value, done: done}, result);
}


(function TestGeneratorBasics() {
  let object = {
    *method() {
      yield 1;
    }
  };
  let g = object.method();
  assertIteratorResult(1, false, g.next());
  assertIteratorResult(undefined, true, g.next());
})();


(function TestGeneratorThis() {
  let object = {
    *method() {
      yield this;
    }
  };
  let g = object.method();
  assertIteratorResult(object, false, g.next());
  assertIteratorResult(undefined, true, g.next());
})();


(function TestGeneratorSymbolIterator() {
  let object = {
    *method() {}
  };
  let g = object.method();
  arktest.assertEQ(g, g[Symbol.iterator]());
})();


(function TestGeneratorDescriptor() {
  let object = {
    *method() {
      yield 1;
    }
  };

  let desc = Object.getOwnPropertyDescriptor(object, 'method');
  arktest.assertTrue(desc.enumerable);
  arktest.assertTrue(desc.configurable);
  arktest.assertTrue(desc.writable);
  arktest.assertEQ('function', typeof desc.value);

  let g = desc.value();
  assertIteratorResult(1, false, g.next());
  assertIteratorResult(undefined, true, g.next());
})();


(function TestGeneratorPrototypeDescriptor() {
  let object = {
    *method() {}
  };

  let desc = Object.getOwnPropertyDescriptor(object.method, 'prototype');
  arktest.assertFalse(desc.enumerable);
  arktest.assertFalse(desc.configurable);
  arktest.assertTrue(desc.writable);
  arktest.assertEQ(generatorPrototype, Object.getPrototypeOf(desc.value));
})();


(function TestGeneratorProto() {
  let object = {
    *method() {}
  };

  arktest.assertEQ(generatorFunction.prototype,
               Object.getPrototypeOf(object.method));
})();


(function TestGeneratorNotConstructable() {
  let object = {
    *method() {
      yield 1;
    }
  };

  arktest.expectThrow(()=>new object.method());
})();


(function TestGeneratorName() {
  let object = {
    *method() {},
    *1() {},
    *2.0() {}
  };
  let f = object.method;
  arktest.assertEQ('method', f.name);
  let g = object[1];
  arktest.assertEQ('1', g.name);
  let h = object[2];
  arktest.assertEQ('2', h.name);
})();


(function TestGeneratorNoBinding() {
  let method = 'local';
  let calls = 0;
  let object = {
    *method() {
      calls++;
      arktest.assertEQ('local', method);
    }
  };
  let g = object.method();
  assertIteratorResult(undefined, true, g.next());
  arktest.assertEQ(1, calls);
})();


(function TestGeneratorToString() {
  let object = {
    *method() { yield 1; }
  };
  arktest.assertEQ('*method() { yield 1; }', object.method.toString());
})();


(function TestProtoName() {
  let object = {
    __proto__() {
      return 1;
    }
  };
  arktest.assertEQ(Object.prototype, Object.getPrototypeOf(object));
  arktest.assertEQ(1, object.__proto__());
})();


(function TestProtoName2() {
  const p = {};
  let object = {
    __proto__() {
      return 1;
    },
    __proto__: p
  };
  arktest.assertEQ(p, Object.getPrototypeOf(object));
  arktest.assertEQ(1, object.__proto__());
})();
