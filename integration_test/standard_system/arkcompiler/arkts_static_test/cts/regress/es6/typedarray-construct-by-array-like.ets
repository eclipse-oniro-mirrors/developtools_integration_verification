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
expected_out_1: "Semantic error ESE0301: Can't resolve array type"
---*/

let tests = [];

// Tests that will be called with each TypedArray constructor.

tests.push(function TestConstructSmallObject(constr) {
  let myObject = { 0: 5, 1: 6, length: 2 };

  let arr = new constr(myObject);

  arktest.assertEQ(2, arr.length);
  arktest.assertEQ(5, arr[0]);
  arktest.assertEQ(6, arr[1]);
});

tests.push(function TestConstructLargeObject(constr) {
  let myObject = {};
  const n = 128;
  for (let i = 0; i < n; i++) {
    myObject[i] = i;
  }
  myObject.length = n;

  let arr = new constr(myObject);

  arktest.assertEQ(n, arr.length);
  for (let i = 0; i < n; i++) {
    arktest.assertEQ(i, arr[i]);
  }
});

tests.push(function TestConstructFromArrayWithSideEffects(constr) {
  let arr = [{ valueOf() { arr[1] = 20; return 1; }}, 2];

  let ta = new constr(arr);

  arktest.assertEQ(1, ta[0]);
  arktest.assertEQ(2, ta[1]);
});

tests.push(function TestConstructFromArrayWithSideEffectsHoley(constr) {
  let arr = [{ valueOf() { arr[1] = 20; return 1; }}, 2, , 4];

  let ta = new constr(arr);

  arktest.assertEQ(1, ta[0]);
  arktest.assertEQ(2, ta[1]);
  // ta[2] will be the default value, but we aren't testing that here.
  arktest.assertEQ(4, ta[3]);
});

tests.push(function TestConstructFromArrayHoleySmi(constr) {
  let arr = [0, 1, , 3];

  let ta = new constr(arr);

  arktest.assertEQ([0, 1, defaultValue(constr), 3], ta);
});

tests.push(function TestConstructFromArrayHoleyDouble(constr) {
  let arr = [0.0, 1.0, , 3.0];

  let ta = new constr(arr);

  arktest.assertEQ([0, 1, defaultValue(constr), 3], ta);
});

tests.push(function TestConstructFromArrayHoleySmiWithOtherPrototype(constr) {
  let arr = [0, 1, , 3];
  Object.setPrototypeOf(arr, { 2: 2 });

  let ta = new constr(arr);

  arktest.assertEQ([0, 1, 2, 3], ta);
});

tests.push(function TestConstructFromArrayWithProxyPrototype(constr) {
  let arr = [0, 1, , 3];
  let proxy = new Proxy([], {
    get: function(target, name) {
      if (name === Symbol.iterator) {
        return undefined;
      }
      if (name == 2) { return 2; }
      return target[name];
    }
  });
  Object.setPrototypeOf(arr, proxy);

  let ta = new constr(arr);

  arktest.assertEQ([0, 1, 2, 3], ta);
});

tests.push(function TestConstructFromArrayHoleySmiWithSubclass(constr) {
  class SubArray extends Array {}
  let arr = new SubArray(0, 1);
  arr[3] = 3;

  let ta = new constr(arr);

  arktest.assertEQ([0, 1, defaultValue(constr), 3], ta);
});

tests.push(function TestConstructFromArrayNoIteratorWithGetter(constr) {
  let arr = [1, 2, 3];
  arr[Symbol.iterator] = undefined;

  Object.defineProperty(arr, '2', {
    get() {
      return 22;
    }
  });

  let ta = new constr(arr);

  arktest.assertEQ([1, 2, 22], ta);
});

tests.push(function TestConstructFromArrayNullIterator(constr) {
  let arr = [1, 2, 3];
  arr[Symbol.iterator] = null;

  let ta = new Uint8Array(arr);

  arktest.assertEQ([1, 2, 3], ta);
});

tests.push(function TestConstructFromArrayUndefinedIterator(constr) {
  let arr = [1, 2, 3];
  arr[Symbol.iterator] = undefined;

  let ta = new Uint8Array(arr);

  arktest.assertEQ([1, 2, 3], ta);
});

tests.push(function TestConstructFromArrayNonCallableIterator(constr) {
  let arr = [1, 2, 3];
  arr[Symbol.iterator] = 1;

  arktest.expectThrow(() => new Uint8Array(arr), ((e: Error): boolean => e instanceof TypeError));
});

tests.push(function TestConstructFromArray(constr) {
  let n = 64;
  const jsArray = [];
  for (let i = 0; i < n; i++) {
    jsArray[i] = i;
  }

  let arr = new constr(jsArray);

  arktest.assertEQ(n, arr.length);
  for (let i = 0; i < n; i++) {
    arktest.assertEQ(i, arr[i]);
  }
});

tests.push(function TestConstructFromTypedArray(constr) {
  let n = 64;
  let ta = new constr(n);
  for (let i = 0; i < ta.length; i++) {
    ta[i] = i;
  }

  let arr = new constr(ta);

  arktest.assertEQ(n, arr.length);
  for (let i = 0; i < n; i++) {
    arktest.assertEQ(i, arr[i]);
  }
});

tests.push(function TestTypedArrayMaxLength(constr) {
  const maxLength = ArkTools.arrayBufferMaxByteLength() / constr.BYTES_PER_ELEMENT;
  let myObject = { 0: 5, 1: 6, length: maxLength + 1 };

  arktest.expectThrow(() => new constr(myObject), ((e: Error): boolean => e instanceof RangeError));
});

tests.push(function TestProxyHoleConverted(constr) {
  let source = {0: 0, 2: 2, length: 3};
  let proxy = new Proxy(source, {});

  let converted = new constr(proxy);

  arktest.assertEQ([0, defaultValue(constr), 2], converted);
});

tests.push(function TestProxyToObjectValueOfCalled(constr) {
  let thrower = { valueOf: function() { throw new TypeError(); } };
  let source = {0: 0, 1: thrower, length: 2};
  let proxy = new Proxy(source, {});

  arktest.expectThrow(() => new constr(proxy), ((e: Error): boolean => e instanceof TypeError));
});

tests.push(function TestObjectValueOfCalled(constr) {
  let thrower = { valueOf: function() { throw new TypeError(); } };

  const obj = {0: 0, 1: thrower, length: 2};
  arktest.expectThrow(() => new constr(obj), ((e: Error): boolean => e instanceof TypeError));
});

tests.push(function TestSmiPackedArray(constr) {
  let ta = new constr([1, 2, 3, 4, 127]);

  arktest.assertEQ(5 * constr.BYTES_PER_ELEMENT, ta.byteLength);
  arktest.assertEQ([1, 2, 3, 4, 127], ta);
});

tests.push(function TestOffsetIsUsed(constr) {
  testOffsetIsUsedRunner(constr, 4);
  testOffsetIsUsedRunner(constr, 16);
  testOffsetIsUsedRunner(constr, 32);
  testOffsetIsUsedRunner(constr, 128);
});

tests.push(function TestLengthIsNonSmiNegativeNumber(constr) {
  let ta = new constr({length: -ArkTools.maxSmi() - 2});

  arktest.assertEQ(0, ta.length);
});

// Helpers for above tests.

function testOffsetIsUsedRunner(constr, n) {
  const buffer = new ArrayBuffer(constr.BYTES_PER_ELEMENT * n);

  const wholeTa = new constr(buffer);
  arktest.assertEQ(n, wholeTa.length);
  for (let i = 0; i < wholeTa.length; i++) {
    wholeTa[i] = i;
  }

  const halfTa = new constr(buffer, constr.BYTES_PER_ELEMENT * n / 2);
  arktest.assertEQ(n / 2, halfTa.length);

  let arr = new constr(halfTa);

  arktest.assertEQ(n / 2, arr.length);
  for (let i = 0; i < arr.length; i++) {
    arktest.assertEQ(n / 2 + i, arr[i]);
  }
}

function defaultValue(constr) {
  if (constr == Float32Array || constr == Float64Array) { return NaN; }
  return 0;
}

tests.forEach(f => test(f));


function test(func) {
  func(Uint8Array);
  func(Int8Array);
  func(Uint16Array);
  func(Int16Array);
  func(Uint32Array);
  func(Int32Array);
  func(Float32Array);
  func(Float64Array);
  func(Uint8ClampedArray);
}

// Other, standalone tests.

(function TestUint8ClampedIsNotBitCopied() {
  let arr = new Int8Array([-1.0, 0, 1.1, 255, 256]);
  arktest.assertEQ([-1, 0, 1, -1, 0], arr);
  const expected = new Uint8ClampedArray([0, 0, 1, 0, 0]);

  let converted = new Uint8ClampedArray(arr);

  arktest.assertEQ([0, 0, 1, 0, 0], converted);
})();

(function TestInt8ArrayCopying() {
  let source = new Uint8Array([0, 1, 127, 128, 255, 256]);
  arktest.assertEQ([0, 1, 127, 128, 255, 0], source);

  let converted = new Int8Array(source);

  arktest.assertEQ([0, 1, 127, -128, -1, 0], converted);
})();

(function TestInt16ArrayCopying() {
  let source = new Uint16Array([0, 1, 32767, 32768, 65535, 65536]);
  arktest.assertEQ([0, 1, 32767, 32768, 65535, 0], source);

  let converted = new Int16Array(source);

  arktest.assertEQ([0, 1, 32767, -32768, -1, 0], converted);
})();

(function TestInt32ArrayCopying() {
  let source =
      new Uint32Array([0, 1, 2147483647, 2147483648, 4294967295, 4294967296]);
  arktest.assertEQ([0, 1, 2147483647, 2147483648, 4294967295, 0], source);

  let converted = new Int32Array(source);

  arktest.assertEQ([0, 1, 2147483647, -2147483648, -1, 0], converted);
})();
