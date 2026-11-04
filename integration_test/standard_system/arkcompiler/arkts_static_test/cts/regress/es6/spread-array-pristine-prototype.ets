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
// Tests in this file are meant to run in the presence of a valid
// NoElementsProtector. Do not touch Array.prototype here.

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0320: Function expressions are not supported, use arrow functions instead"
---*/

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
