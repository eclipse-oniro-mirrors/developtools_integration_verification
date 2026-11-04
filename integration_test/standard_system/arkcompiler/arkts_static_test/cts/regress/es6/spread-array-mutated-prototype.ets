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


// NOTE:
// Tests in this file are meant to run in the presence of an invalidated
// NoElementsProtector, as effected by the following line.

/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0252: Indexed access is not supported for such expression type."
---*/

Array.prototype[0] = 42;
delete Array.prototype[0];


(function TestBasics() {
  let a = [1, 2];
  const b = [...a];
  arktest.assertEQ([1, 2], b)

  arktest.assertEQ(['a', 'b', 'c', 'd', 'e', 'f'],
                    ['a', ...'bc', 'd', ...'ef'])
})();


let log = [];

function* gen(n) {
  log.push(n, 1);
  yield 1;
  log.push(n, 2);
  yield 2;
  log.push(n, 3);
  yield 3;
  log.push(n, 'done');
}

function id(v) {
  log.push(v);
  return v;
}


(function TestGenerator() {
  arktest.assertEQ([1, 2, 3], [...gen('a')]);
  arktest.assertEQ(['x', 1, 2, 3, 'y', 1, 2, 3, 'z'],
                    ['x', ...gen('a'), 'y', ...gen('b'), 'z']);
})();


(function TestOrderOfExecution() {
  log = [];
  arktest.assertEQ(['x', 1, 2, 3, 'y', 1, 2, 3, 'z'],
                    [id('x'), ...gen('a'), id('y'), ...gen('b'), id('z')]);
  arktest.assertEQ([
    'x', 'a', 1, 'a', 2, 'a', 3, 'a', 'done',
    'y', 'b', 1, 'b', 2, 'b', 3, 'b', 'done',
    'z'
  ], log);
})();


(function TestNotIterable() {
  let a;
  arktest.expectThrow(function() {
    a = [...42];
  }, ((e: Error): boolean => e instanceof TypeError));
  arktest.assertEQ(undefined, a);


})();


(function TestInvalidIterator() {
  let iter = {
    [Symbol.iterator]: 42
  };
  let a;
  arktest.expectThrow(function() {
    a = [...iter];
  }, ((e: Error): boolean => e instanceof TypeError));
  arktest.assertEQ(undefined, a);
})();


(function TestIteratorNotAnObject() {
  let iter = {
    [Symbol.iterator]() {
      return 42;
    }
  };
  let a;
  arktest.expectThrow(function() {
    a = [...iter];
  }, ((e: Error): boolean => e instanceof TypeError));
  arktest.assertEQ(undefined, a);
})();


(function TestIteratorNoNext() {
  let iter = {
    [Symbol.iterator]() {
      return {};
    }
  };
  let a;
  arktest.expectThrow(function() {
    a = [...iter];
  }, ((e: Error): boolean => e instanceof TypeError));
  arktest.assertEQ(undefined, a);
})();


(function TestIteratorResultDoneThrows() {
  function MyError() {}
  let iter = {
    [Symbol.iterator]() {
      return {
        next() {
          return {
            get done() {
              throw new MyError();
            }
          }
        }
      };
    }
  };
  let a;
  arktest.expectThrow(function() {
    a = [...iter];
  }, MyError);
  arktest.assertEQ(undefined, a);
})();


(function TestIteratorResultValueThrows() {
  function MyError() {}
  let iter = {
    [Symbol.iterator]() {
      return {
        next() {
          return {
            done: false,
            get value() {
              throw new MyError();
            }
          }
        }
      };
    }
  };
  let a;
  arktest.expectThrow(function() {
    a = [...iter];
  }, MyError);
  arktest.assertEQ(undefined, a);
})();


(function TestOptimize() {
  function f() {
    return [...'abc'];
  }
  ArkTools.prepareFunctionForOptimization(f);
  arktest.assertEQ(['a', 'b', 'c'], f());
  ArkTools.optimizeFunctionOnNextCall(f);
  arktest.assertEQ(['a', 'b', 'c'], f());
})();


(function TestDeoptimize() {
  let iter = {
    [Symbol.iterator]() {
      let i = 0;
      return {
        next() {
          ArkTools.deoptimizeFunction(f);
          return {value: ++i, done: i === 3};
        }
      };
    }
  };
  function f() {
    return [0, ...iter];
  }

  arktest.assertEQ([0, 1, 2], f());
})();


(function TestPrototypeSetter1() {
  Object.defineProperty(Array.prototype, 3, {set() {throw 666}})
  Object.defineProperty(Array.prototype, 4, {set() {throw 666}})

  function f() {
    return ['a', ...['b', 'c', 'd'], 'e']
  }

  ArkTools.prepareFunctionForOptimization(f);
  arktest.assertEQ(['a', 'b', 'c', 'd', 'e'], f());
  ArkTools.optimizeFunctionOnNextCall(f);
  arktest.assertEQ(['a', 'b', 'c', 'd', 'e'], f());

  delete Array.prototype[3];
  delete Array.prototype[4];
})();


(function TestPrototypeSetter2() {
  Object.defineProperty(Array.prototype.__proto__, 3, {set() {throw 666}})
  Object.defineProperty(Array.prototype.__proto__, 4, {set() {throw 666}})

  function f() {
    return ['a', ...['b', 'c', 'd'], 'e']
  }

  ArkTools.prepareFunctionForOptimization(f);
  arktest.assertEQ(['a', 'b', 'c', 'd', 'e'], f());
  ArkTools.optimizeFunctionOnNextCall(f);
  arktest.assertEQ(['a', 'b', 'c', 'd', 'e'], f());

  delete Array.prototype.__proto__[3];
  delete Array.prototype.__proto__[4];
})();


(function TestPrototypeProxy() {
  const backup = Array.prototype.__proto__;
  Array.prototype.__proto__ = new Proxy({}, {set() {throw 666}});

  function f() {
    return ['a', ...['b', 'c', 'd'], 'e']
  }

  ArkTools.prepareFunctionForOptimization(f);
  arktest.assertEQ(['a', 'b', 'c', 'd', 'e'], f());
  ArkTools.optimizeFunctionOnNextCall(f);
  arktest.assertEQ(['a', 'b', 'c', 'd', 'e'], f());

  Object.setPrototypeOf(Array.prototype, backup);
})();

(() => {
Object.prototype['10'] = 'unreachable';
Object.prototype['7'] = 'unreachable';
Object.prototype['-1'] = 'unreachable';
Object.prototype['-0'] = 'unreachable';
Object.prototype['4294967295'] = 'unreachable';

const array = new Int32Array(10);

function check() {
  for (let i = 0; i < 4; i++) {
    arktest.assertEQ(undefined, array['-1']);
    arktest.assertEQ(undefined, array['-0']);
    arktest.assertEQ(undefined, array['10']);
    arktest.assertEQ(undefined, array['4294967295']);
  }
  arktest.assertEQ('unreachable', array.__proto__['-1']);
  arktest.assertEQ('unreachable', array.__proto__['-0']);
  arktest.assertEQ('unreachable', array.__proto__['10']);
  arktest.assertEQ('unreachable', array.__proto__['4294967295']);
}

check();

array['-1'] = 'unreachable';
array['-0'] = 'unreachable';
array['10'] = 'unreachable';
array['4294967295'] = 'unreachable';

check();

delete array['-0'];
delete array['-1'];
delete array['10'];
delete array['4294967295'];

arktest.assertEQ(undefined, Object.getOwnPropertyDescriptor(array, '-1'));
arktest.assertEQ(undefined, Object.getOwnPropertyDescriptor(array, '-0'));
arktest.assertEQ(undefined, Object.getOwnPropertyDescriptor(array, '10'));
arktest.assertEQ(undefined, Object.getOwnPropertyDescriptor(array, '4294967295'));
arktest.assertEQ(10, Object.keys(array).length);

check();

function f() { return array['-1']; }

ArkTools.prepareFunctionForOptimization(f);
for (let i = 0; i < 3; i++) {
  arktest.assertEQ(undefined, f());
}
ArkTools.optimizeFunctionOnNextCall(f);
arktest.assertEQ(undefined, f());

arktest.expectThrow('Object.defineProperty(new Int32Array(100), -1, {value: 1})');
arktest.expectThrow('Object.defineProperty(new Int32Array(100), "-0", {value: 1})');
arktest.expectThrow('Object.defineProperty(new Int32Array(100), -10, {value: 1})');
arktest.expectThrow('Object.defineProperty(new Int32Array(), 4294967295, {value: 1})');

check();
})();
