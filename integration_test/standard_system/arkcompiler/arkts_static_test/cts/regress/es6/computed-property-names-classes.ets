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
expected_out_1: "Semantic error ESE0143: Unresolved reference Symbol"
---*/

let key = Symbol('class-key');


'use strict';


function iD(x) {
  return x;
}


(function TestClassMethodString() {
  class C {
    a() { return 'A'}
    ['b']() { return 'B'; }
    c() { return 'C'; }
    [iD('d')]() { return 'D'; }
  }
  arktest.assertEQ('A', new C().a());
  arktest.assertEQ('B', new C().b());
  arktest.assertEQ('C', new C().c());
  arktest.assertEQ('D', new C().d());
  arktest.assertEQ([], Object.keys(C.prototype));
  arktest.assertEQ(['constructor', 'a', 'b', 'c', 'd'],
                    Object.getOwnPropertyNames(C.prototype));
})();


(function TestClassMethodNumber() {
  class C {
    a() { return 'A'; }
    [1]() { return 'B'; }
    c() { return 'C'; }
    [iD(2)]() { return 'D'; }
  }
  arktest.assertEQ('A', new C().a());
  arktest.assertEQ('B', new C()[1]());
  arktest.assertEQ('C', new C().c());
  arktest.assertEQ('D', new C()[2]());
  // Array indexes first.
  arktest.assertEQ([], Object.keys(C.prototype));
  arktest.assertEQ(['1', '2', 'constructor', 'a', 'c'],
                    Object.getOwnPropertyNames(C.prototype));
})();


(function TestClassMethodSymbol() {
  let sym1 = Symbol();
  let sym2 = Symbol();
  class C {
    a() { return 'A'; }
    [sym1]() { return 'B'; }
    c() { return 'C'; }
    [iD(sym2)]() { return 'D'; }
  }
  arktest.assertEQ('A', new C().a());
  arktest.assertEQ('B', new C()[sym1]());
  arktest.assertEQ('C', new C().c());
  arktest.assertEQ('D', new C()[sym2]());
  arktest.assertEQ([], Object.keys(C.prototype));
  arktest.assertEQ(['constructor', 'a', 'c'],
                    Object.getOwnPropertyNames(C.prototype));
  arktest.assertEQ([sym1, sym2], Object.getOwnPropertySymbols(C.prototype));
})();



(function TestStaticClassMethodString() {
  class C {
    static a() { return 'A'}
    static ['b']() { return 'B'; }
    static c() { return 'C'; }
    static ['d']() { return 'D'; }
  }
  arktest.assertEQ('A', C.a());
  arktest.assertEQ('B', C.b());
  arktest.assertEQ('C', C.c());
  arktest.assertEQ('D', C.d());
  arktest.assertEQ([], Object.keys(C));
  arktest.assertEQ(['length', 'name', 'prototype', 'a', 'b', 'c', 'd'],
                    Object.getOwnPropertyNames(C));
})();


(function TestStaticClassMethodNumber() {
  class C {
    static a() { return 'A'; }
    static [1]() { return 'B'; }
    static c() { return 'C'; }
    static [2]() { return 'D'; }
  }
  arktest.assertEQ('A', C.a());
  arktest.assertEQ('B', C[1]());
  arktest.assertEQ('C', C.c());
  arktest.assertEQ('D', C[2]());
  // Array indexes first.
  arktest.assertEQ([], Object.keys(C));
  arktest.assertEQ(['1', '2', 'length', 'name', 'prototype', 'a', 'c'],
                    Object.getOwnPropertyNames(C));
})();


(function TestStaticClassMethodSymbol() {
  let sym1 = Symbol();
  let sym2 = Symbol();
  class C {
    static a() { return 'A'; }
    static [sym1]() { return 'B'; }
    static c() { return 'C'; }
    static [sym2]() { return 'D'; }
  }
  arktest.assertEQ('A', C.a());
  arktest.assertEQ('B', C[sym1]());
  arktest.assertEQ('C', C.c());
  arktest.assertEQ('D', C[sym2]());
  arktest.assertEQ([], Object.keys(C));
  arktest.assertEQ(['length', 'name', 'prototype', 'a', 'c'],
                    Object.getOwnPropertyNames(C));
  arktest.assertEQ([sym1, sym2], Object.getOwnPropertySymbols(C));
})();



function assertIteratorResult(value, done, result) {
  arktest.assertEQ({ value: value, done: done}, result);
}


(function TestGeneratorComputedName() {
  class C {
    *['a']() {
      yield 1;
      yield 2;
    }
  }
  let iter = new C().a();
  assertIteratorResult(1, false, iter.next());
  assertIteratorResult(2, false, iter.next());
  assertIteratorResult(undefined, true, iter.next());
  arktest.assertEQ([], Object.keys(C.prototype));
  arktest.assertEQ(['constructor', 'a'],
                    Object.getOwnPropertyNames(C.prototype));
})();


(function TestToNameSideEffects() {
  let counter = 0;
  let key1 = {
    toString: function() {
      arktest.assertEQ(0, counter++);
      return 'b';
    }
  };
  let key2 = {
    toString: function() {
      arktest.assertEQ(1, counter++);
      return 'd';
    }
  };
  class C {
    a() { return 'A'; }
    [key1]() { return 'B'; }
    c() { return 'C'; }
    [key2]() { return 'D'; }
  }
  arktest.assertEQ(2, counter);
  arktest.assertEQ('A', new C().a());
  arktest.assertEQ('B', new C().b());
  arktest.assertEQ('C', new C().c());
  arktest.assertEQ('D', new C().d());
  arktest.assertEQ([], Object.keys(C.prototype));
  arktest.assertEQ(['constructor', 'a', 'b', 'c', 'd'],
                    Object.getOwnPropertyNames(C.prototype));
})();


(function TestToNameSideEffectsNumbers() {
  let counter = 0;
  let key1 = {
    valueOf: function() {
      arktest.assertEQ(0, counter++);
      return 1;
    },
    toString: null
  };
  let key2 = {
    valueOf: function() {
      arktest.assertEQ(1, counter++);
      return 2;
    },
    toString: null
  };

  class C {
    a() { return 'A'; }
    [key1]() { return 'B'; }
    c() { return 'C'; }
    [key2]() { return 'D'; }
  }
  arktest.assertEQ(2, counter);
  arktest.assertEQ('A', new C().a());
  arktest.assertEQ('B', new C()[1]());
  arktest.assertEQ('C', new C().c());
  arktest.assertEQ('D', new C()[2]());
  // Array indexes first.
  arktest.assertEQ([], Object.keys(C.prototype));
  arktest.assertEQ(['1', '2', 'constructor', 'a', 'c'],
                    Object.getOwnPropertyNames(C.prototype));
})();


(function TestLength() {
  class C {
    static ['length']() {
      return 42;
    }
  }
  arktest.assertEQ(42, C.length());

  class C1 {
    static get ['length']() {
      return 'A';
    }
  }
  arktest.assertEQ('A', C1.length);

  class C2 {
    static get length() {
      arktest.assertTrue(false)();
    }
    static get ['length']() {
      return 'B';
    }
  }
  arktest.assertEQ('B', C2.length);

  class C3 {
    static get length() {
      arktest.assertTrue(false)();
    }
    static get ['length']() {
      arktest.assertTrue(false)();
    }
    static get ['length']() {
      return 'C';
    }
  }
  arktest.assertEQ('C', C3.length);

  class C4 {
    static get ['length']() {
      arktest.assertTrue(false)();
    }
    static get length() {
      return 'D';
    }
  }
  arktest.assertEQ('D', C4.length);
})();


(function TestGetter() {
  class C {
    get ['a']() {
      return 'A';
    }
  }
  arktest.assertEQ('A', new C().a);

  class C2 {
    get b() {
      arktest.assertTrue(false)();
    }
    get ['b']() {
      return 'B';
    }
  }
  arktest.assertEQ('B', new C2().b);

  class C3 {
    get c() {
      arktest.assertTrue(false)();
    }
    get ['c']() {
      arktest.assertTrue(false)();
    }
    get ['c']() {
      return 'C';
    }
  }
  arktest.assertEQ('C', new C3().c);

  class C4 {
    get ['d']() {
      arktest.assertTrue(false)();
    }
    get d() {
      return 'D';
    }
  }
  arktest.assertEQ('D', new C4().d);
})();


(function TestSetter() {
  let calls = 0;
  class C {
    set ['a'](_) {
      calls++;
    }
  }
  new C().a = 'A';
  arktest.assertEQ(1, calls);

  calls = 0;
  class C2 {
    set b(_) {
      arktest.assertTrue(false)();
    }
    set ['b'](_) {
      calls++;
    }
  }
  new C2().b = 'B';
  arktest.assertEQ(1, calls);

  calls = 0;
  class C3 {
    set c(_) {
      arktest.assertTrue(false)()
    }
    set ['c'](_) {
      arktest.assertTrue(false)()
    }
    set ['c'](_) {
      calls++
    }
  }
  new C3().c = 'C';
  arktest.assertEQ(1, calls);

  calls = 0;
  class C4 {
    set ['d'](_) {
      arktest.assertTrue(false)()
    }
    set d(_) {
      calls++
    }
  }
  new C4().d = 'D';
  arktest.assertEQ(1, calls);
})();


(function TestPrototype() {
  arktest.expectThrow(function() {
    class C {
      static ['prototype']() {
        return 1;
      }
    }
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(function() {
    class C2 {
      static get ['prototype']() {
        return 2;
      }
    }
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(function() {
    class C3 {
      static set ['prototype'](x) {
        arktest.assertEQ(3, x);
      }
    }
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(function() {
    class C4 {
      static *['prototype']() {
        yield 1;
        yield 2;
      }
    }
  }, ((e: Error): boolean => e instanceof TypeError));
})();


(function TestPrototypeConcat() {
  arktest.expectThrow(function() {
    class C {
      static ['pro' + 'tot' + 'ype']() {
        return 1;
      }
    }
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(function() {
    class C2 {
      static get ['pro' + 'tot' + 'ype']() {
        return 2;
      }
    }
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(function() {
    class C3 {
      static set ['pro' + 'tot' + 'ype'](x) {
        arktest.assertEQ(3, x);
      }
    }
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(function() {
    class C4 {
      static *['pro' + 'tot' + 'ype']() {
        yield 1;
        yield 2;
      }
    }
  }, ((e: Error): boolean => e instanceof TypeError));
})();


(function TestConstructor() {
  // Normally a constructor property is not allowed.
  class C {
    ['constructor']() {
      return 1;
    }
  }
  arktest.assertTrue(C !== C.prototype.constructor);
  arktest.assertEQ(1, new C().constructor());

  class C2 {
    get ['constructor']() {
      return 2;
    }
  }
  arktest.assertEQ(2, new C2().constructor);

  let calls = 0;
  class C3 {
    set ['constructor'](x) {
      arktest.assertEQ(3, x);
      calls++;
    }
  }
  new C3().constructor = 3;
  arktest.assertEQ(1, calls);

  class C4 {
    *['constructor']() {
      yield 1;
      yield 2;
    }
  }
  let iter = new C4().constructor();
  assertIteratorResult(1, false, iter.next());
  assertIteratorResult(2, false, iter.next());
  assertIteratorResult(undefined, true, iter.next());
})();


(function TestExceptionInName() {
  function MyError() {};
  function throwMyError() {
    throw new MyError();
  }
  arktest.expectThrow(function() {
    class C {
      [throwMyError()]() {}
    }
  }, MyError);
  arktest.expectThrow(function() {
    class C {
      get [throwMyError()]() { return 42; }
    }
  }, MyError);
  arktest.expectThrow(function() {
    class C {
      set [throwMyError()](_) { }
    }
  }, MyError);
})();


(function TestTdzName() {
  arktest.expectThrow(function() {
    class C {
      [C]() {}
    }
  }, ((e: Error): boolean => e instanceof ReferenceError));
  arktest.expectThrow(function() {
    class C {
      get [C]() { return 42; }
    }
  }, ((e: Error): boolean => e instanceof ReferenceError));
  arktest.expectThrow(function() {
    class C {
      set [C](_) { }
    }
  }, ((e: Error): boolean => e instanceof ReferenceError));
})();


// The following tests deal with computed and statically known properties
// of the same name overwriting each other.
//
// More concretely, we consider the cases where:
// The computed property appears ...
//   - before an existing data property           (case 1)
//   - after an existing data property            (case 2)
//   - before an existing getter and setter pair  (case 3)
//   - before an existing getter xor setter       (case 4)
//   - after an existing getter and setter pair   (case 5)
//   - after an existing getter xor setter        (case 6)
//   - in between two existing accessors          (case 7)
//
// For each of the 7 cases above, there exists A and B variants, indicating
// whether the computed property refers to an accessor (variant A) or a
// plain property (variant B).


// expecting |b| to be a data property.
function testOverwritingHelper(clazz, expectGetter, expectSetter) {
  const proto = clazz.prototype;
  const desc = Object.getOwnPropertyDescriptor(proto, 'b');

  if (desc.hasOwnProperty('value')) {
    arktest.assertEQ(undefined, expectGetter);
    arktest.assertEQ(undefined, expectSetter);

    arktest.assertEQ('B', proto.b());
  } else {
    arktest.assertEQ('boolean', typeof expectGetter);
    arktest.assertEQ('boolean', typeof expectSetter);

    if (expectGetter) {
      arktest.assertEQ('B', proto.b);
    } else {
      arktest.assertEQ(undefined, desc.getter);
    }

      arktest.assertEQ(expectSetter, desc.set !== undefined);
  }

  arktest.assertEQ('A', proto.a());
  arktest.assertEQ('C', proto.c());
  arktest.assertEQ('D', proto.d());

  arktest.assertEQ([], Object.keys(proto));
  arktest.assertEQ(['constructor', 'a', 'b', 'c', 'd'],
                    Object.getOwnPropertyNames(proto));
}


(function TestOverwriting1A() {
  class C {
    a() { return 'A'}
    get [iD('b')]() { return 'Bx'; }
    c() { return 'C'; }
    b() { return 'B'; }
    d() { return 'D'; }
  }
  testOverwritingHelper(C);
})();


(function TestOverwriting1B() {
  class C {
    a() { return 'A'}
    [iD('b')]() { return 'Bx'; }
    c() { return 'C'; }
    b() { return 'B'; }
    d() { return 'D'; }
  }
  testOverwritingHelper(C);
})();


(function TestOverwriting2A() {
  class C {
    a() { return 'A'}
    b() { return 'Bx'; }
    c() { return 'C'; }
    get [iD('b')]() { return 'B'; }
    d() { return 'D'; }
  }
  testOverwritingHelper(C, true, false);
})();


(function TestOverwriting2B() {
  class C {
    a() { return 'A'}
    b() { return 'Bx'; }
    c() { return 'C'; }
    [iD('b')]() { return 'B'; }
    d() { return 'D'; }
  }
  testOverwritingHelper(C);
})();


(function TestOverwriting3A() {
  class C {
    a() { return 'A'}
    get [iD('b')]() { return 'Bx'; }
    c() { return 'C'; }
    get b() { return 'B'; }
    set b(foo) { this.x = foo; }
    d() { return 'D'; }
  }
  testOverwritingHelper(C, true, true);
})();


(function TestOverwriting3B() {
  class C {
    a() { return 'A'}
    [iD('b')]() { return 'Bx'; }
    c() { return 'C'; }
    get b() { return 'B'; }
    set b(foo) { this.x = foo; }
    d() { return 'D'; }
  }
  testOverwritingHelper(C, true, true);
})();


(function TestOverwriting4A() {
  class C {
    a() { return 'A'}
    get [iD('b')]() { return 'Bx'; }
    c() { return 'C'; }
    get b() { return 'B'; }
    d() { return 'D'; }
  }
  testOverwritingHelper(C, true, false);
})();


(function TestOverwriting4B() {
  class C {
    a() { return 'A'}
    [iD('b')]() { return 'Bx'; }
    c() { return 'C'; }
    get b() { return 'B'; }
    d() { return 'D'; }
  }
  testOverwritingHelper(C, true, false);
})();


(function TestOverwriting5A() {
  class C {
    a() { return 'A'}
    get b() { return 'Bx'; }
    set b(foo) { this.x = foo; }
    c() { return 'C'; }
    get [iD('b')]() { return 'B'; }
    d() { return 'D'; }
  }
  testOverwritingHelper(C, true, true);
})();


(function TestOverwriting5B() {
  class C {
    a() { return 'A'}
    get b() { return 'Bx'; }
    set b(foo) { this.x = foo; }
    c() { return 'C'; }
    [iD('b')]() { return 'B'; }
    d() { return 'D'; }
  }
  testOverwritingHelper(C);
})();


(function TestOverwriting6A() {
  class C {
    a() { return 'A'}
    set b(foo) { this.x = foo; }
    c() { return 'C'; }
    get [iD('b')]() { return 'B'; }
    d() { return 'D'; }
  }
  testOverwritingHelper(C, true, true);
})();


(function TestOverwriting6B() {
  class C {
    a() { return 'A'}
    set b(foo) { this.x = foo; }
    c() { return 'C'; }
    [iD('b')]() { return 'B'; }
    d() { return 'D'; }
  }
  testOverwritingHelper(C);
})();


(function TestOverwriting7A() {
  class C {
    a() { return 'A'}
    get b() { return 'Bx'; }
    c() { return 'C'; }
    get [iD('b')]() { return 'B'; }
    d() { return 'D'; }
    set b(foo) { this.x = foo; }
  }
  testOverwritingHelper(C, true, true);
})();


(function TestOverwriting7B() {
  class C {
    a() { return 'A'}
    set b(foo) { this.x = foo; }
    c() { return 'C'; }
    [iD('b')]() { return 'Bx'; }
    d() { return 'D'; }
    get b() { return 'B'; }
  }
  testOverwritingHelper(C, true, false);
})();
