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
expected_out_1: "Syntax error ESY0318: Class cannot be used as object."
---*/

const typedArrayConstructors = [
  Uint8Array,
  Int8Array,
  Uint16Array,
  Int16Array,
  Uint32Array,
  Int32Array,
  Uint8ClampedArray,
  Float32Array,
  Float64Array];

function checkEachTypedArray(fn) {
  typedArrayConstructors.forEach(fn);
}

checkEachTypedArray(function copyWithinArity(constructor) {
  arktest.assertEQ(new constructor([]).copyWithin.length, 2);
});


checkEachTypedArray(function copyWithinTargetAndStart(constructor) {
  // works with two arguments
  arktest.assertEQ([4, 5, 3, 4, 5],
                    new constructor([1, 2, 3, 4, 5]).copyWithin(0, 3));
  arktest.assertEQ([1, 4, 5, 4, 5],
                    new constructor([1, 2, 3, 4, 5]).copyWithin(1, 3));
  arktest.assertEQ([1, 3, 4, 5, 5],
                    new constructor([1, 2, 3, 4, 5]).copyWithin(1, 2));
  arktest.assertEQ([1, 2, 3, 4, 5],
                    new constructor([1, 2, 3, 4, 5]).copyWithin(2, 2));
});


checkEachTypedArray(function copyWithinTargetStartAndEnd(constructor) {
  // works with three arguments
  arktest.assertEQ(new constructor([1, 2, 3, 4, 5]).copyWithin(0, 3, 4),
                                    [4, 2, 3, 4, 5]);
  arktest.assertEQ(new constructor([1, 2, 3, 4, 5]).copyWithin(1, 3, 4),
                                    [1, 4, 3, 4, 5]);
  arktest.assertEQ(new constructor([1, 2, 3, 4, 5]).copyWithin(1, 2, 4),
                                    [1, 3, 4, 4, 5]);
});


checkEachTypedArray(function copyWithinNegativeRelativeOffsets(constructor) {
  // works with negative arguments
  arktest.assertEQ([4, 5, 3, 4, 5],
                    new constructor([1, 2, 3, 4, 5]).copyWithin(0, -2));
  arktest.assertEQ([4, 2, 3, 4, 5],
                    new constructor([1, 2, 3, 4, 5]).copyWithin(0, -2, -1));
  arktest.assertEQ([1, 3, 3, 4, 5],
                    new constructor([1, 2, 3, 4, 5]).copyWithin(-4, -3, -2));
  arktest.assertEQ([1, 3, 4, 4, 5],
                    new constructor([1, 2, 3, 4, 5]).copyWithin(-4, -3, -1));
  arktest.assertEQ([1, 3, 4, 5, 5],
                    new constructor([1, 2, 3, 4, 5]).copyWithin(-4, -3));
  // test with arguments equal to -this.length
  arktest.assertEQ([1, 2, 3, 4, 5],
                    new constructor([1, 2, 3, 4, 5]).copyWithin(-5, 0));
});


checkEachTypedArray(function mustBeTypedArray(constructor) {
  // throws on non-TypedArray values
  arktest.expectThrow(function() {
    return constructor.prototype.copyWithin.call(null, 0, 3);
  }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() {
    return constructor.prototype.copyWithin.call(undefined, 0, 3);
  }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() {
    return constructor.prototype.copyWithin.call(34, 0, 3);
  }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() {
    return constructor.prototype.copyWithin.call([1, 2, 3, 4, 5], 0, 3);
  }, ((e: Error): boolean => e instanceof TypeError));
});


checkEachTypedArray(function copyWithinStartLessThanTarget(constructor) {
  // test with target > start on 2 arguments
  arktest.assertEQ([1, 2, 3, 1, 2],
                    new constructor([1, 2, 3, 4, 5]).copyWithin(3, 0));

  // test with target > start on 3 arguments
  arktest.assertEQ([1, 2, 3, 1, 2],
                    new constructor([1, 2, 3, 4, 5]).copyWithin(3, 0, 4));
});

checkEachTypedArray(function copyWithinNonIntegerRelativeOffsets(constructor) {
  // test on fractional arguments
  arktest.assertEQ([4, 5, 3, 4, 5],
                    new constructor([1, 2, 3, 4, 5]).copyWithin(0.2, 3.9));
});


checkEachTypedArray(function copyWithinNegativeZeroTarget(constructor) {
  // test with -0
  arktest.assertEQ([4, 5, 3, 4, 5],
                    new constructor([1, 2, 3, 4, 5]).copyWithin(-0, 3));
});


checkEachTypedArray(function copyWithinTargetOutsideStart(constructor) {
  // test with arguments more than this.length
  arktest.assertEQ([1, 2, 3, 4, 5],
                    new constructor([1, 2, 3, 4, 5]).copyWithin(0, 7));

  // test with arguments less than -this.length
  arktest.assertEQ([1, 2, 3, 4, 5],
                    new constructor([1, 2, 3, 4, 5]).copyWithin(-7, 0));
});


checkEachTypedArray(function copyWithinEmptyArray(constructor) {
  // test on empty array
  arktest.assertEQ([], new constructor([]).copyWithin(0, 3));
});


checkEachTypedArray(function copyWithinTargetCutOff(constructor) {
  // test with target range being shorter than end - start
  arktest.assertEQ([1, 2, 2, 3, 4], [1, 2, 3, 4, 5].copyWithin(2, 1, 4));
});


checkEachTypedArray(function copyWithinOverlappingRanges(constructor) {
  // test overlapping ranges
  let arr = [1, 2, 3, 4, 5];
  arr.copyWithin(2, 1, 4);
  arktest.assertEQ([1, 2, 2, 2, 3], arr.copyWithin(2, 1, 4));
});


checkEachTypedArray(function copyWithinDefaultEnd(constructor) {
  // undefined as third argument
  arktest.assertEQ([4, 5, 3, 4, 5],
                    new constructor([1, 2, 3, 4, 5]).copyWithin(0, 3, undefined));
});


checkEachTypedArray(function copyWithinLargeArray(constructor) {
  const large = 10000;

  // test on a large array
  let arr = new constructor(large);
  arktest.assertEQ(arr, arr.copyWithin(45, 9000));

  let expected = new Array(large);
  // test on numbers
  for (let i = 0; i < large; i++) {
    arr[i] = Math.random() * 100;  // May be cast to an int
    expected[i] = arr[i];
    if (i >= 9000) {
      expected[(i - 9000) + 45] = arr[i];
    }
  }
  arktest.assertEQ(expected, arr.copyWithin(45, 9000));

  // test array length remains same
  arktest.assertEQ(large, arr.length);
});


checkEachTypedArray(function copyWithinNullEnd(constructor) {
  // test null on third argument is converted to +0
  arktest.assertEQ([1, 2, 3, 4, 5],
                    new constructor([1, 2, 3, 4, 5]).copyWithin(0, 3, null));
});


checkEachTypedArray(function copyWithinMinusInfinityTarget(constructor) {
  let arr = new constructor([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
  let expected = [6, 7, 8, 9, 10, 6, 7, 8, 9, 10];

  arktest.assertEQ(expected, arr.copyWithin(-Infinity, 5));
  arktest.assertEQ(10, arr.length);
});


checkEachTypedArray(function copyWithinPositiveInfinityTarget(constructor) {
  let arr = new constructor([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
  let expected = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  arktest.assertEQ(expected, arr.copyWithin(+Infinity, 5));
  arktest.assertEQ(10, arr.length);
});


checkEachTypedArray(function copyWithinMinusInfinityStart(constructor) {
  let arr = new constructor([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
  let expected = [1, 2, 3, 4, 5, 1, 2, 3, 4, 5];

  arktest.assertEQ(expected, arr.copyWithin(5, -Infinity));
  arktest.assertEQ(10, arr.length);
});


checkEachTypedArray(function copyWithinPositiveInfinityStart(constructor) {
  let arr = new constructor([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
  let expected = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  arktest.assertEQ(expected, arr.copyWithin(5, +Infinity));
  arktest.assertEQ(10, arr.length);
});


checkEachTypedArray(function copyWithinMinusInfinityEnd(constructor) {
  let arr = new constructor([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
  let expected = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  arktest.assertEQ(expected, arr.copyWithin(5, 0, -Infinity));
  arktest.assertEQ(10, arr.length);
});


checkEachTypedArray(function copyWithinPositiveInfinityEnd(constructor) {
let arr = new constructor([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
  let expected = [1, 2, 3, 4, 5, 1, 2, 3, 4, 5];

  arktest.assertEQ(expected, arr.copyWithin(5, 0, +Infinity));
  arktest.assertEQ(10, arr.length);
});

checkEachTypedArray(function parametersNotCalledIfDetached(constructor) {
  const tmp = {
    [Symbol.toPrimitive]() {
      arktest.assertTrue(false, 'Parameter should not be processed when ' +
                        'array.[[ViewedArrayBuffer]] is detached.');
      return 0;
    }
  };

  const array = new constructor([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
  ArkTools.arrayBufferDetach(array.buffer);

  arktest.expectThrow(() => array.copyWithin(tmp, tmp, tmp), ((e: Error): boolean => e instanceof TypeError));
  arktest.assertEQ(0, array.length, 'array.[[ViewedArrayBuffer]] is detached');
});
