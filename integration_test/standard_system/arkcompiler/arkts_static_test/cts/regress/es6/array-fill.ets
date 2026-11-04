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
expected_out_1: "Semantic error ESE0124: Expected 1 arguments, got 0."
---*/

let values: int[] = [1]; values.fill();


const condition: boolean = Array.prototype.fill.length === 1;
arktest.assertTrue(condition);

arktest.assertEQ([].fill(8), []);
arktest.assertEQ([0, 0, 0, 0, 0].fill(), [undefined, undefined, undefined, undefined, undefined]);
arktest.assertEQ([0, 0, 0, 0, 0].fill(8), [8, 8, 8, 8, 8]);
arktest.assertEQ([0, 0, 0, 0, 0].fill(8, 1), [0, 8, 8, 8, 8]);
arktest.assertEQ([0, 0, 0, 0, 0].fill(8, 10), [0, 0, 0, 0, 0]);
arktest.assertEQ([0, 0, 0, 0, 0].fill(8, -5), [8, 8, 8, 8, 8]);
arktest.assertEQ([0, 0, 0, 0, 0].fill(8, 1, 4), [0, 8, 8, 8, 0]);
arktest.assertEQ([0, 0, 0, 0, 0].fill(8, 1, -1), [0, 8, 8, 8, 0]);
arktest.assertEQ([0, 0, 0, 0, 0].fill(8, 1, 42), [0, 8, 8, 8, 8]);
arktest.assertEQ([0, 0, 0, 0, 0].fill(8, -3, 42), [0, 0, 8, 8, 8]);
arktest.assertEQ([0, 0, 0, 0, 0].fill(8, -3, 4), [0, 0, 8, 8, 0]);
arktest.assertEQ([0, 0, 0, 0, 0].fill(8, -2, -1), [0, 0, 0, 8, 0]);
arktest.assertEQ([0, 0, 0, 0, 0].fill(8, -1, -3), [0, 0, 0, 0, 0]);
arktest.assertEQ([0, 0, 0, 0, 0].fill(8, undefined, 4), [8, 8, 8, 8, 0]);
arktest.assertEQ([ ,  ,  ,  , 0].fill(8, 1, 3), [, 8, 8, , 0]);

// If the range is empty, the array is not actually modified and
// should not throw, even when applied to a frozen object.
arktest.assertEQ(Object.freeze([1, 2, 3]).fill(0, 0, 0), [1, 2, 3]);

// Test exceptions
arktest.expectThrow('Object.freeze([0]).fill()', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.fill.call(null)', ((e: Error): boolean => e instanceof TypeError));
arktest.expectThrow('Array.prototype.fill.call(undefined)', ((e: Error): boolean => e instanceof TypeError));

function testFillObjectWithAccessors() {
  const kLength = 5;

  let log = [];

  let object = {
    length: kLength,
    get 1() {
      log.push('get 1');
      return this.foo;
    },

    set 1(val) {
      log.push('set 1 ' + val);
      this.foo = val;
    }
  };

  Array.prototype.fill.call(object, 42);

  ArkTools.heapObjectVerify(object);
  arktest.assertEQ(kLength, object.length);
  arktest.assertEQ(['set 1 42'], log);

  for (let i = 0; i < kLength; ++i) {
    arktest.assertEQ(42, object[i]);
  }
}
testFillObjectWithAccessors();

function testFillObjectWithMaxNumberLength() {
  const kMaxSafeInt = 2 ** 53 - 1;
  let object = {};
  object.length = kMaxSafeInt;

  Array.prototype.fill.call(object, 42, 2 ** 53 - 4);

  ArkTools.heapObjectVerify(object);
  arktest.assertEQ(kMaxSafeInt, object.length);
  arktest.assertEQ(42, object[kMaxSafeInt - 3]);
  arktest.assertEQ(42, object[kMaxSafeInt - 2]);
  arktest.assertEQ(42, object[kMaxSafeInt - 1]);
}
testFillObjectWithMaxNumberLength();

function testFillObjectWithPrototypeAccessors() {
  const kLength = 5;
  let log = [];
  let proto = {
    get 1() {
      log.push('get 0');
      return this.foo;
    },

    set 1(val) {
      log.push('set 1 ' + val);
      this.foo = val;
    }
  };

  let object = { __proto__: proto, 0:0, 2:2, length: kLength};

  Array.prototype.fill.call(object, '42');

  ArkTools.heapObjectVerify(object);
  arktest.assertEQ(kLength, object.length);
  arktest.assertEQ(['set 1 42'], log);
  arktest.assertTrue(object.hasOwnProperty(0));
  arktest.assertFalse(object.hasOwnProperty(1));
  arktest.assertTrue(object.hasOwnProperty(2));
  arktest.assertTrue(object.hasOwnProperty(3));
  arktest.assertTrue(object.hasOwnProperty(4));

  for (let i = 0; i < kLength; ++i) {
    arktest.assertEQ('42', object[i]);
  }
}
testFillObjectWithPrototypeAccessors();

function testFillSealedObject() {
  let object = { length: 42 };
  Object.seal(object);

  arktest.expectThrow(() => Array.prototype.fill.call(object), ((e: Error): boolean => e instanceof TypeError));
}
testFillSealedObject();

function testFillFrozenObject() {
  let object = { length: 42 };
  Object.freeze(object);

  arktest.expectThrow(() => Array.prototype.fill.call(object), ((e: Error): boolean => e instanceof TypeError));
}
testFillFrozenObject();

(() => {
let values: int[] = [1]; values.fill();

function callAndAssertFill(object, testValue, harnessValue, from, to) {
  let value = arguments.length > 2 ? testValue : harnessValue;

  Array.prototype.fill.call(object, value, from, to);

  ArkTools.heapObjectVerify(object);
  assertArrayHasValueInRange(object, value, from, to);
}

function assertArrayHasValueInRange(obj, value, from, to) {
  for (let i = from; i < to; ++i) {
    arktest.assertEQ(value, obj[i]);
  }
}

let i = 0;
function pristineArray(str) {
  return eval(str + '//' + (i++));
}

let tests = {
  ARRAY_PACKED_ELEMENTS(value, from, to) {
    let array = pristineArray(
        `["Some string", {}, /foobar/, "Another string", {}]`);
    arktest.assertTrue(ArkTools.hasObjectElements(array));
    arktest.assertFalse(ArkTools.hasHoleyElements(array));

    callAndAssertFill(array, '42', ...arguments);
  },

  ARRAY_HOLEY_ELEMENTS(value, from, to) {
    let array = pristineArray(`["Some string", , {}, , "Another string"]`);
    arktest.assertTrue(ArkTools.hasObjectElements(array));
    arktest.assertTrue(ArkTools.hasHoleyElements(array));

    callAndAssertFill(array, '42', ...arguments);
  },

  ARRAY_PACKED_SMI_ELEMENTS(value, from, to) {
    let array = pristineArray(`[0, -42, 5555, 23, 6]`);
    arktest.assertTrue(ArkTools.hasSmiElements(array));
    arktest.assertFalse(ArkTools.hasHoleyElements(array));

    callAndAssertFill(array, 42, ...arguments);
  },

  ARRAY_HOLEY_SMI_ELEMENTS(value, from, to) {
    let array = pristineArray(`[0, , 5555, , 6]`);
    arktest.assertTrue(ArkTools.hasSmiElements(array));
    arktest.assertTrue(ArkTools.hasHoleyElements(array));

    callAndAssertFill(array, 42, ...arguments);
  },

  ARRAY_PACKED_DOUBLE_ELEMENTS(value, from, to) {
    let array = pristineArray(`[3.14, 7.00001, NaN, -25.3333, 1.0]`);
    arktest.assertTrue(ArkTools.hasDoubleElements(array));
    arktest.assertFalse(ArkTools.hasHoleyElements(array));

    callAndAssertFill(array, 42.42, ...arguments);
  },

  ARRAY_HOLEY_DOUBLE_ELEMENTS(value, from, to) {
    let array = pristineArray(`[3.14, , , , 1.0]`);
    arktest.assertTrue(ArkTools.hasDoubleElements(array));
    arktest.assertTrue(ArkTools.hasHoleyElements(array));

    callAndAssertFill(array, 42.42, ...arguments);
  },

  ARRAY_DICTIONARY_ELEMENTS(value, from, to) {
    let array = pristineArray(`[0, , 2, 3, 4]`);
    Object.defineProperty(array, 1, { get() { return this.foo; },
                                      set(val) { this.foo = val; }});
    arktest.assertTrue(ArkTools.hasDictionaryElements(array));

    callAndAssertFill(array, '42', ...arguments);
  }

};

function runTest(test) {
  test();
  test(undefined);
  test(undefined, 1);
  test(undefined, 1, 4);
}

function runTests(tests) {
  Object.keys(tests).forEach(test => runTest(tests[test]));
}

runTests(tests);

Array.prototype.__proto__ = {
  __proto__: Array.prototype.__proto__
};

runTests(tests);
})();
