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
expected_out_1: "Semantic error ESE0143: Unresolved reference ArkTools"
---*/

ArkTools.prepareFunctionForOptimization(() => {});


'use strict';

let global = this;
let tests = {
  FastElementsKind() {
    let runners = {
      PACKED_SMI_ELEMENTS(array) {
        let sum = 0;
        for (let x of array) {
          sum += x;
        }
        return sum;
      },

      HOLEY_SMI_ELEMENTS(array) {
        let sum = 0;
        for (let x of array) {
          if (x) {
            sum += x;
          }
        }
        return sum;
      },

      PACKED_ELEMENTS(array) {
        let ret = '';
        for (let str of array) {
          ret += `> ${str}`;
        }
        return ret;
      },

      HOLEY_ELEMENTS(array) {
        let ret = '';
        for (let str of array) {
          ret += `> ${str}`;
        }
        return ret;
      },

      PACKED_DOUBLE_ELEMENTS(array) {
        let sum = 0.0;
        for (let x of array) { sum += x; }
          return sum;
      },

      // TODO(6587): Re-enable the below test case once we no longer deopt due
      // to non-truncating uses of {CheckFloat64Hole} nodes.
    };

    let tests = {
      PACKED_SMI_ELEMENTS: {
        array: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        expected: 55,
        array2: [1, 2, 3],
        expected2: 6
      },
      HOLEY_SMI_ELEMENTS: {
        array: [1, , 3, , 5, , 7, , 9, ,],
        expected: 25,
        array2: [1, , 3],
        expected2: 4
      },
      PACKED_ELEMENTS: {
        array: ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'],
        expected: '> a> b> c> d> e> f> g> h> i> j',
        array2: ['a', 'b', 'c'],
        expected2: '> a> b> c'
      },
      HOLEY_ELEMENTS: {
        array: ['a', , 'c', , 'e', , 'g', , 'i', ,],
        expected: '> a> undefined> c> undefined> e> undefined> g' +
                  '> undefined> i> undefined',
        array2: ['a', , 'c'],
        expected2: '> a> undefined> c'
      },
      PACKED_DOUBLE_ELEMENTS: {
        array: [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0],
        expected: 5.5,
        array2: [0.6, 0.4, 0.2],
        expected2: 1.2
      },
      // TODO(6587): Re-enable the below test case once we no longer deopt due
      // to non-truncating uses of {CheckFloat64Hole} nodes.
      /*HOLEY_DOUBLE_ELEMENTS: {
        array: [0.1, , 0.3, , 0.5, , 0.7, , 0.9, ,],
        expected: 2.5,
        array2: [0.1, , 0.3],
        expected2: 0.4
      }*/
    };

    for (let key of Object.keys(runners)) {
      let fn = runners[key];
      let { array, expected, array2, expected2 } = tests[key];

      // Warmup:
      ArkTools.prepareFunctionForOptimization(fn);
      fn(array);
      fn(array);
      ArkTools.optimizeFunctionOnNextCall(fn);
      fn(array);

      assertOptimized(fn, key);
      arktest.assertEQ(expected, fn(array), key);
      assertOptimized(fn, key);

      // Check no deopt when another array with the same map is used
      arktest.assertTrue(ArkTools.haveSameMap(array, array2), key);
      assertOptimized(fn, key);
      arktest.assertEQ(expected2, fn(array2), key);

      // CheckMaps bailout
      let newArray = Object.defineProperty(
          [1, 2, 3], 2, { enumerable: false, configurable: false,
                          get() { return 7; } });
      fn(newArray);
      assertUnoptimized(fn, key);
    }
  },

  TypedArrays() {
    let tests = {
      Uint8Array: {
        array: new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, -1, 256]),
        expected: 291,
        array2: new Uint8Array([1, 2, 3]),
        expected2: 6
      },

      Int8Array: {
        array: new Int8Array([1, 2, 3, 4, 5, 6, 7, 8, -129, 128]),
        expected: 35,
        array2: new Int8Array([1, 2, 3]),
        expected2: 6
      },

      Uint16Array: {
        array: new Uint16Array([1, 2, 3, 4, 5, 6, 7, 8, -1, 0x10000]),
        expected: 65571,
        array2: new Uint16Array([1, 2, 3]),
        expected2: 6
      },

      Int16Array: {
        array: new Int16Array([1, 2, 3, 4, 5, 6, 7, 8, -32769, 0x7FFF]),
        expected: 65570,
        array2: new Int16Array([1, 2, 3]),
        expected2: 6
      },

      Uint32Array: {
        array: new Uint32Array([1, 2, 3, 4, 5, 6, 7, 8, -1, 0x100000000]),
        expected: 4294967331,
        array2: new Uint32Array([1, 2, 3]),
        expected2: 6
      },

      Int32Array: {
        array: new Int32Array([1, 2, 3, 4, 5, 6, 7, 8,
                               -2147483649, 0x7FFFFFFF]),
        expected: 4294967330,
        array2: new Int32Array([1, 2, 3]),
        expected2: 6
      },

      Float32Array: {
        array: new Float32Array([9.5, 8.0, 7.0, 7.0, 5.0, 4.0, 3.0, 2.0]),
        expected: 45.5,
        array2: new Float32Array([10.5, 5.5, 1.5]),
        expected2: 17.5
      },

      Float64Array: {
        array: new Float64Array([9.5, 8.0, 7.0, 7.0, 5.0, 4.0, 3.0, 2.0]),
        expected: 45.5,
        array2: new Float64Array([10.5, 5.5, 1.5]),
        expected2: 17.5
      },

      Uint8ClampedArray: {
        array: new Uint8ClampedArray([4.3, 7.45632, 3.14, 4.61, 5.0004, 6.493,
                                      7.12, 8, 1.7, 3.6]),
        expected: 51,
        array2: new Uint8ClampedArray([1, 2, 3]),
        expected2: 6
      }
    };

    for (let key of Object.keys(tests)) {
      let test = tests[key];
      let { array, expected, array2, expected2 } = test;

      let sum = function(array) {
        let ret = 0;
        for (let x of array) { ret += x; }
        return ret;
      };

      // Warmup
      ArkTools.prepareFunctionForOptimization(sum);
      sum(array);
      sum(array);
      ArkTools.optimizeFunctionOnNextCall(sum);
      arktest.assertEQ(expected, sum(array), key);

      assertOptimized(sum, key);

      // Not deoptimized when called on typed array of same type / map
      arktest.assertTrue(ArkTools.haveSameMap(array, array2));
      arktest.assertEQ(expected2, sum(array2), key);
      assertOptimized(sum, key);

      // Throw when detached
      let clone = new array.constructor(array);
      ArkTools.arrayBufferDetach(clone.buffer);
      arktest.expectThrow(() => sum(clone), ((e: Error): boolean => e instanceof TypeError));

      // Clear the slate for the next iteration.
      ArkTools.deoptimizeFunction(sum);
      ArkTools.clearFunctionFeedback(sum);
    }
  }
};

for (let name of Object.keys(tests)) {
  let test = tests[name];
  test();
}
