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

let key = Symbol('property-key');



function iD(x) {
  return x;
}



(function TestBasicsString() {
  let object = {
    a: 'A',
    ['b']: 'B',
    c: 'C',
    [iD('d')]: 'D',
  };
  arktest.assertEQ('A', object.a);
  arktest.assertEQ('B', object.b);
  arktest.assertEQ('C', object.c);
  arktest.assertEQ('D', object.d);
  arktest.assertEQ(['a', 'b', 'c', 'd'], Object.keys(object));
})();


(function TestBasicsNumber() {
  let object = {
    a: 'A',
    [1]: 'B',
    c: 'C',
    [iD(2)]: 'D',
  };
  arktest.assertEQ('A', object.a);
  arktest.assertEQ('B', object[1]);
  arktest.assertEQ('C', object.c);
  arktest.assertEQ('D', object[2]);
  // Array indexes first.
  arktest.assertEQ(['1', '2', 'a', 'c'], Object.keys(object));
})();


(function TestBasicsSymbol() {
  const sym1 = Symbol();
  const sym2 = Symbol();
  let object = {
    a: 'A',
    [sym1]: 'B',
    c: 'C',
    [iD(sym2)]: 'D',
  };
  arktest.assertEQ('A', object.a);
  arktest.assertEQ('B', object[sym1]);
  arktest.assertEQ('C', object.c);
  arktest.assertEQ('D', object[sym2]);
  arktest.assertEQ(['a', 'c'], Object.keys(object));
  arktest.assertEQ([sym1, sym2], Object.getOwnPropertySymbols(object));
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
  let object = {
    a: 'A',
    [key1]: 'B',
    c: 'C',
    [key2]: 'D',
  };
  arktest.assertEQ(2, counter);
  arktest.assertEQ('A', object.a);
  arktest.assertEQ('B', object.b);
  arktest.assertEQ('C', object.c);
  arktest.assertEQ('D', object.d);
  arktest.assertEQ(['a', 'b', 'c', 'd'], Object.keys(object));
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

  let object = {
    a: 'A',
    [key1]: 'B',
    c: 'C',
    [key2]: 'D',
  };
  arktest.assertEQ(2, counter);
  arktest.assertEQ('A', object.a);
  arktest.assertEQ('B', object[1]);
  arktest.assertEQ('C', object.c);
  arktest.assertEQ('D', object[2]);
  // Array indexes first.
  arktest.assertEQ(['1', '2', 'a', 'c'], Object.keys(object));
})();


(function TestDoubleName() {
  let object = {
    [1.2]: 'A',
    [1e55]: 'B',
    [0.000001]: 'C',
    [-0]: 'D',
    // TODO(arv): https://upstream issue tracker/issues/detail?id=3815
    // [Infinity]: 'E',
    // [-Infinity]: 'F',
    [NaN]: 'G',
  };
  arktest.assertEQ('A', object['1.2']);
  arktest.assertEQ('B', object['1e+55']);
  arktest.assertEQ('C', object['0.000001']);
  arktest.assertEQ('D', object[0]);
  // TODO(arv): https://upstream issue tracker/issues/detail?id=3815
  arktest.assertEQ('G', object[NaN]);
})();


(function TestGetter() {
  let object = {
    get ['a']() {
      return 'A';
    }
  };
  arktest.assertEQ('A', object.a);

  object = {
    get b() {
      arktest.assertTrue(false)();
    },
    get ['b']() {
      return 'B';
    }
  };
  arktest.assertEQ('B', object.b);

  object = {
    get c() {
      arktest.assertTrue(false)();
    },
    get ['c']() {
      arktest.assertTrue(false)();
    },
    get ['c']() {
      return 'C';
    }
  };
  arktest.assertEQ('C', object.c);

  object = {
    get ['d']() {
      arktest.assertTrue(false)();
    },
    get d() {
      return 'D';
    }
  };
  arktest.assertEQ('D', object.d);
})();


(function TestSetter() {
  let calls = 0;
  let object = {
    set ['a'](_) {
      calls++;
    }
  };
  object.a = 'A';
  arktest.assertEQ(1, calls);

  calls = 0;
  object = {
    set b(_) {
      arktest.assertTrue(false)();
    },
    set ['b'](_) {
      calls++;
    }
  };
  object.b = 'B';
  arktest.assertEQ(1, calls);

  calls = 0;
  object = {
    set c(_) {
      arktest.assertTrue(false)()
    },
    set ['c'](_) {
      arktest.assertTrue(false)()
    },
    set ['c'](_) {
      calls++
    }
  };
  object.c = 'C';
  arktest.assertEQ(1, calls);

  calls = 0;
  object = {
    set ['d'](_) {
      arktest.assertTrue(false)()
    },
    set d(_) {
      calls++
    }
  };
  object.d = 'D';
  arktest.assertEQ(1, calls);
})();


(function TestDuplicateKeys() {
  'use strict';
  // ES5 does not allow duplicate keys.
  // ES6 does but we haven't changed our code yet.

  let object = {
    a: 1,
    ['a']: 2,
  };
  arktest.assertEQ(2, object.a);
})();


(function TestProto() {
  const proto = {};
  let object = {
    __proto__: proto
  };
  arktest.assertEQ(proto, Object.getPrototypeOf(object));

  object = {
    '__proto__': proto
  };
  arktest.assertEQ(proto, Object.getPrototypeOf(object));

  object = {
    ['__proto__']: proto
  };
  arktest.assertEQ(Object.prototype, Object.getPrototypeOf(object));
  arktest.assertEQ(proto, object.__proto__);
  arktest.assertTrue(object.hasOwnProperty('__proto__'));

  object = {
    [iD('x')]: 'X',
    __proto__: proto
  };
  arktest.assertEQ('X', object.x);
  arktest.assertEQ(proto, Object.getPrototypeOf(object));
})();


(function TestExceptionInName() {
  function MyError() {};
  function throwMyError() {
    throw new MyError();
  }
  arktest.expectThrow(function() {
    let o = {
      [throwMyError()]: 42
    };
  }, MyError);
  arktest.expectThrow(function() {
    let o = {
      get [throwMyError()]() { return 42; }
    };
  }, MyError);
  arktest.expectThrow(function() {
    let o = {
      set [throwMyError()](_) { }
    };
  }, MyError);
})();


(function TestNestedLiterals() {
  const array = [
    42,
    { a: 'A',
      ['b']: 'B',
      c: 'C',
      [iD('d')]: 'D',
    },
    43,
  ];
  arktest.assertEQ(42, array[0]);
  arktest.assertEQ(43, array[2]);
  arktest.assertEQ('A', array[1].a);
  arktest.assertEQ('B', array[1].b);
  arktest.assertEQ('C', array[1].c);
  arktest.assertEQ('D', array[1].d);
  let object = {
    outer: 42,
    inner: {
      a: 'A',
      ['b']: 'B',
      c: 'C',
      [iD('d')]: 'D',
    },
    outer2: 43,
  };
  arktest.assertEQ(42, object.outer);
  arktest.assertEQ(43, object.outer2);
  arktest.assertEQ('A', object.inner.a);
  arktest.assertEQ('B', object.inner.b);
  arktest.assertEQ('C', object.inner.c);
  arktest.assertEQ('D', object.inner.d);
  let object = {
    outer: 42,
    array: [
      43,
      { a: 'A',
        ['b']: 'B',
        c: 'C',
        [iD('d')]: 'D',
      },
      44,
    ],
    outer2: 45
  };
  arktest.assertEQ(42, object.outer);
  arktest.assertEQ(45, object.outer2);
  arktest.assertEQ(43, object.array[0]);
  arktest.assertEQ(44, object.array[2]);
  arktest.assertEQ('A', object.array[1].a);
  arktest.assertEQ('B', object.array[1].b);
  arktest.assertEQ('C', object.array[1].c);
  arktest.assertEQ('D', object.array[1].d);
})();
