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
expected_out_1: "Semantic error ESE0124: Expected 2 arguments, got 0."
---*/

let values: int[] = [1]; values.copyWithin();


(function copyWithinArity() {
  arktest.assertEQ(Array.prototype.copyWithin.length, 2);
})();


(function copyWithinTargetAndStart() {
  // works with two arguemnts
  arktest.assertEQ([4, 5, 3, 4, 5], [1, 2, 3, 4, 5].copyWithin(0, 3));
  arktest.assertEQ([1, 4, 5, 4, 5], [1, 2, 3, 4, 5].copyWithin(1, 3));
  arktest.assertEQ([1, 3, 4, 5, 5], [1, 2, 3, 4, 5].copyWithin(1, 2));
  arktest.assertEQ([1, 2, 3, 4, 5], [1, 2, 3, 4, 5].copyWithin(2, 2));
})();


(function copyWithinTargetStartAndEnd() {
  // works with three arguments
  arktest.assertEQ([1, 2, 3, 4, 5].copyWithin(0, 3, 4), [4, 2, 3, 4, 5]);
  arktest.assertEQ([1, 2, 3, 4, 5].copyWithin(1, 3, 4), [1, 4, 3, 4, 5]);
  arktest.assertEQ([1, 2, 3, 4, 5].copyWithin(1, 2, 4), [1, 3, 4, 4, 5]);
})();


(function copyWithinNegativeRelativeOffsets() {
  // works with negative arguments
  arktest.assertEQ([4, 5, 3, 4, 5], [1, 2, 3, 4, 5].copyWithin(0, -2));
  arktest.assertEQ([4, 2, 3, 4, 5], [1, 2, 3, 4, 5].copyWithin(0, -2, -1));
  arktest.assertEQ([1, 3, 3, 4, 5], [1, 2, 3, 4, 5].copyWithin(-4, -3, -2));
  arktest.assertEQ([1, 3, 4, 4, 5], [1, 2, 3, 4, 5].copyWithin(-4, -3, -1));
  arktest.assertEQ([1, 3, 4, 5, 5], [1, 2, 3, 4, 5].copyWithin(-4, -3));
  // test with arguments equal to -this.length
  arktest.assertEQ([1, 2, 3, 4, 5], [1, 2, 3, 4, 5].copyWithin(-5, 0));
})();


(function copyWithinArrayLikeValues() {
  // works with array-like values
  const args = (function () { return arguments; }(1, 2, 3));
  Array.prototype.copyWithin.call(args, -2, 0);
  arktest.assertEQ([1, 1, 2], Array.prototype.slice.call(args));

  // Object.prototype.toString branding does not change
  arktest.assertEQ('[object Arguments]', Object.prototype.toString.call(args));
})();


(function copyWithinNullThis() {
  // throws on null/undefined values
  arktest.expectThrow(function() {
    return Array.prototype.copyWithin.call(null, 0, 3);
  }, ((e: Error): boolean => e instanceof TypeError));
})();


(function copyWithinUndefinedThis() {
  arktest.expectThrow(function() {
    return Array.prototype.copyWithin.call(undefined, 0, 3);
  }, ((e: Error): boolean => e instanceof TypeError));
})();


// TODO(caitp): indexed properties of String are read-only and setting them
//              should throw in strict mode. See bug upstream engine:4042
// (function copyWithinStringThis() {
//   // test with this value as string
//     return Array.prototype.copyWithin.call("hello world", 0, 3);
//   }, TypeError);
// })();


(function copyWithinNumberThis() {
  // test with this value as number
  arktest.assertEQ(34, Array.prototype.copyWithin.call(34, 0, 3).valueOf());
})();


(function copyWithinSymbolThis() {
  // test with this value as number
  const sym = Symbol('test');
  arktest.assertEQ(sym, Array.prototype.copyWithin.call(sym, 0, 3).valueOf());
})();


(function copyyWithinTypedArray() {
  // test with this value as TypedArray
  const buffer = new ArrayBuffer(16);
  const int32View = new Int32Array(buffer);
  for (let i=0; i<int32View.length; i++) {
    int32View[i] = i*2;
  }
  arktest.assertEQ(new Int32Array([2, 4, 6, 6]),
                    Array.prototype.copyWithin.call(int32View, 0, 1));
})();

// Openharmony only support strict mode.
(function copyWithinSloppyArguments() {
  // if arguments object is sloppy, copyWithin must move the arguments around
  function f(a, b, c, d, e) {
    [].copyWithin.call(arguments, 1, 3);
    return [a, b, c, d, e];
  }
  arktest.assertEQ([1, 2, 3, 4, 5], f(1, 2, 3, 4, 5));
})();


(function copyWithinStartLessThanTarget() {
  // test with target > start on 2 arguments
  arktest.assertEQ([1, 2, 3, 1, 2], [1, 2, 3, 4, 5].copyWithin(3, 0));

  // test with target > start on 3 arguments
  arktest.assertEQ([1, 2, 3, 1, 2], [1, 2, 3, 4, 5].copyWithin(3, 0, 4));
})();


(function copyWithinArrayWithHoles() {
  // test on array with holes
  let arr = new Array(6);
  for (let i = 0; i < arr.length; i += 2) {
    arr[i] = i;
  }
  arktest.assertEQ([, 4, , , 4, , ], arr.copyWithin(0, 3));
})();


(function copyWithinArrayLikeWithHoles() {
  // test on array-like object with holes
  arktest.assertEQ({
    length: 6,
    1: 4,
    4: 4
  }, Array.prototype.copyWithin.call({
    length: 6,
    0: 0,
    2: 2,
    4: 4
  }, 0, 3));
})();


(function copyWithinNonIntegerRelativeOffsets() {
  // test on fractional arguments
  arktest.assertEQ([4, 5, 3, 4, 5], [1, 2, 3, 4, 5].copyWithin(0.2, 3.9));
})();


(function copyWithinNegativeZeroTarget() {
  // test with -0
  arktest.assertEQ([4, 5, 3, 4, 5], [1, 2, 3, 4, 5].copyWithin(-0, 3));
})();


(function copyWithinTargetOutsideStart() {
  // test with arguments more than this.length
  arktest.assertEQ([1, 2, 3, 4, 5], [1, 2, 3, 4, 5].copyWithin(0, 7));

  // test with arguments less than -this.length
  arktest.assertEQ([1, 2, 3, 4, 5], [1, 2, 3, 4, 5].copyWithin(-7, 0));
})();


(function copyWithinEmptyArray() {
  // test on empty array
  arktest.assertEQ([], [].copyWithin(0, 3));
})();


(function copyWithinTargetCutOff() {
  // test with target range being shorter than end - start
  arktest.assertEQ([1, 2, 2, 3, 4], [1, 2, 3, 4, 5].copyWithin(2, 1, 4));
})();


(function copyWithinOverlappingRanges() {
  // test overlapping ranges
  let arr = [1, 2, 3, 4, 5];
  arr.copyWithin(2, 1, 4);
  arktest.assertEQ([1, 2, 2, 2, 3], arr.copyWithin(2, 1, 4));
})();


(function copyWithinStrictDelete() {
  // check that [[Delete]] is strict (non-extensible via freeze)
  arktest.expectThrow(function() {
    return Object.freeze([1, , 3, , 4, 5]).copyWithin(2, 1, 4);
  }, ((e: Error): boolean => e instanceof TypeError));

  // check that [[Delete]] is strict (non-extensible via seal)
  arktest.expectThrow(function() {
    return Object.seal([1, , 3, , 4, 5]).copyWithin(2, 1, 4);
  }, ((e: Error): boolean => e instanceof TypeError));

  // check that [[Delete]] is strict (non-extensible via preventExtensions)
  arktest.expectThrow(function() {
    return Object.preventExtensions([1, , 3, , 4, 5]).copyWithin(2, 1, 4);
  }, ((e: Error): boolean => e instanceof TypeError));
})();


(function copyWithinStrictSet() {
  // check that [[Set]] is strict (non-extensible via freeze)
  arktest.expectThrow(function() {
    return Object.freeze([1, 2, 3, 4, 5]).copyWithin(0, 3);
  }, ((e: Error): boolean => e instanceof TypeError));

  // check that [[Set]] is strict (non-extensible via seal)
  arktest.expectThrow(function() {
    return Object.seal([, 2, 3, 4, 5]).copyWithin(0, 3);
  }, ((e: Error): boolean => e instanceof TypeError));

  // check that [[Set]] is strict (non-extensible via preventExtensions)
  arktest.expectThrow(function() {
    return Object.preventExtensions([ , 2, 3, 4, 5]).copyWithin(0, 3);
  }, ((e: Error): boolean => e instanceof TypeError));
})();


(function copyWithinSetterThrows() {
  function Boom() {}
  // test if we throw in between
  let arr = Object.defineProperty([1, 2, 3, 4, 5], 1, {
    set: function () {
      throw new Boom();
    }
  });

  arktest.expectThrow(function() {
    return arr.copyWithin(1, 3);
  }, Boom);

  arktest.assertEQ([1, , 3, 4, 5], arr);
})();


(function copyWithinDefaultEnd() {
  // undefined as third argument
  arktest.assertEQ(
      [4, 5, 3, 4, 5], [1, 2, 3, 4, 5].copyWithin(0, 3, undefined));
})();


(function copyWithinGetLengthOnce() {
  // test that this.length is called only once
  let count = 0;
  let arr = Object.defineProperty({ 0: 1, 1: 2, 2: 3, 3: 4, 4: 5 }, 'length', {
    get: function () {
      count++;
      return 5;
    }
  });
  Array.prototype.copyWithin.call(arr, 1, 3);
  arktest.assertEQ(1, count);

  Array.prototype.copyWithin.call(arr, 1, 3, 4);
  arktest.assertEQ(2, count);
})();


(function copyWithinLargeArray() {
  let large = 10000;

  // test on a large array
  let arr = new Array(large);
  arktest.assertEQ(arr, arr.copyWithin(45, 9000));

  const expected = new Array(large);
  // test on floating point numbers
  for (let i = 0; i < large; i++) {
    arr[i] = Math.random();
    expected[i] = arr[i];
    if (i >= 9000) {
      expected[(i - 9000) + 45] = arr[i];
    }
  }
  arktest.assertEQ(expected, arr.copyWithin(45, 9000));

  // test on array of objects
  for (let i = 0; i < large; i++) {
    arr[i] = { num: Math.random() };
  } + 45
  arr.copyWithin(45, 9000);

  // test copied by reference
  for (let i = 9000; i < large; ++i) {
    arktest.assertEQ(arr[(i - 9000) + 45], arr[i]);
  }

  // test array length remains same
  arktest.assertEQ(large, arr.length);
})();


(function copyWithinSuperLargeLength() {
  // 2^53 - 1 is the maximum value returned from ToLength()
  let large = Math.pow(2, 53) - 1;
  let object = { length: large };

  // Initialize last 10 entries
  for (let i = 1; i <= 10; ++i) {
    object[(large - 11) + i] = { num: i };
  }

  Array.prototype.copyWithin.call(object, 1, large - 10);

  // Test copied values
  for (let i = 1; i <= 10; ++i) {
    const oldRef = object[(large - 11) + i];
    const newRef = object[i];
    arktest.assertEQ(oldRef, newRef);
    arktest.assertEQ(newRef.num, i);
  }

  // Assert length has not changed
  arktest.assertEQ(large, object.length);
})();


(function copyWithinNullEnd() {
  // test null on third argument is converted to +0
  arktest.assertEQ([1, 2, 3, 4, 5], [1, 2, 3, 4, 5].copyWithin(0, 3, null));
})();


(function copyWithinElementsInObjectsPrototype() {
  // tamper the global Object prototype and test this works
  Object.prototype[2] = 1;
  arktest.assertEQ([4, 5, 3, 4, 5], [1, 2, 3, 4, 5].copyWithin(0, 3));
  delete Object.prototype[2];

  Object.prototype[3] = 'FAKE';
  arktest.assertEQ(['FAKE', 5, 3, 'FAKE', 5], [1, 2, 3, , 5].copyWithin(0, 3));
  delete Object.prototype[3];
})();
