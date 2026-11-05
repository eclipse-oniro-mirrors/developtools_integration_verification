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

const intArrayConstructors = [
  Uint8Array,
  Int8Array,
  Uint16Array,
  Int16Array,
  Uint32Array,
  Int32Array,
  Uint8ClampedArray
];

const floatArrayConstructors = [
  Float32Array,
  Float64Array
];

const typedArrayConstructors = [...intArrayConstructors, ...floatArrayConstructors];

for (let constructor of typedArrayConstructors) {
  arktest.assertEQ(1, constructor.prototype.fill.length);

  arktest.assertEQ([], new constructor([]).fill(8));
  arktest.assertEQ([8, 8, 8, 8, 8], new constructor([0, 0, 0, 0, 0]).fill(8));
  arktest.assertEQ([0, 8, 8, 8, 8], new constructor([0, 0, 0, 0, 0]).fill(8, 1));
  arktest.assertEQ([0, 0, 0, 0, 0], new constructor([0, 0, 0, 0, 0]).fill(8, 10));
  arktest.assertEQ([8, 8, 8, 8, 8], new constructor([0, 0, 0, 0, 0]).fill(8, -5));
  arktest.assertEQ([0, 8, 8, 8, 0], new constructor([0, 0, 0, 0, 0]).fill(8, 1, 4));
  arktest.assertEQ([0, 8, 8, 8, 0], new constructor([0, 0, 0, 0, 0]).fill(8, 1, -1));
  arktest.assertEQ([0, 8, 8, 8, 8], new constructor([0, 0, 0, 0, 0]).fill(8, 1, 42));
  arktest.assertEQ([0, 0, 8, 8, 8], new constructor([0, 0, 0, 0, 0]).fill(8, -3, 42));
  arktest.assertEQ([0, 0, 8, 8, 0], new constructor([0, 0, 0, 0, 0]).fill(8, -3, 4));
  arktest.assertEQ([0, 0, 0, 8, 0], new constructor([0, 0, 0, 0, 0]).fill(8, -2, -1));
  arktest.assertEQ([0, 0, 0, 0, 0], new constructor([0, 0, 0, 0, 0]).fill(8, -1, -3));
  arktest.assertEQ([8, 8, 8, 8, 0], new constructor([0, 0, 0, 0, 0]).fill(8, 0, 4));

  arktest.assertEQ([0, 0, 0, 0, 0], new constructor([0, 0, 0, 0, 0]).fill(8, Infinity));
  arktest.assertEQ([8, 8, 8, 8, 8], new constructor([0, 0, 0, 0, 0]).fill(8, -Infinity));
  arktest.assertEQ([8, 8, 8, 8, 8], new constructor([0, 0, 0, 0, 0]).fill(8, 0, Infinity));
  arktest.assertEQ([0, 0, 0, 0, 0], new constructor([0, 0, 0, 0, 0]).fill(8, 0, -Infinity));

  // Test exceptions
  arktest.expectThrow('constructor.prototype.fill.call(null)', ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow('constructor.prototype.fill.call(undefined)', ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow('constructor.prototype.fill.call([])', ((e: Error): boolean => e instanceof TypeError));

  arktest.assertEQ([0, 0, 0, 0, 0], new constructor([0, 0, 0, 0, 0]).fill(false));
  arktest.assertEQ([1, 1, 1, 1, 1], new constructor([0, 0, 0, 0, 0]).fill(true));
  arktest.assertEQ([0, 0, 0, 0, 0], new constructor([0, 0, 0, 0, 0]).fill(null));
  arktest.assertEQ([8, 8, 8, 8, 8], new constructor([0, 0, 0, 0, 0]).fill('8'));

  // Test ToNumber
  let n = 1;
  arktest.assertEQ([1, 1], new constructor(2).fill({ valueOf() { return n++; } }));
  arktest.assertEQ(2, n);
  const s = [];
  const p = new Proxy({}, { get(t,k) { s.push(k.toString()); return Reflect.get(t,k)} });
  new constructor(3).fill(p);
  arktest.assertEQ(['Symbol(Symbol.toPrimitive)', 'valueOf', 'toString', 'Symbol(Symbol.toStringTag)'], s);

  // Shadowing length doesn't affect fill, unlike Array.prototype.fill
  const a = new constructor([2, 2]);
  Object.defineProperty(a, 'length', {value: 1});
  a.fill(3);
  arktest.assertEQ([3, 3], [a[0], a[1]]);
  Array.prototype.fill.call(a, 4);
  arktest.assertEQ([4, 3], [a[0], a[1]]);

  // Detached Operation
  const tmp = {
    [Symbol.toPrimitive]() {
      arktest.assertTrue(false, 'Parameter should not be processed when ' +
                        'array.[[ViewedArrayBuffer]] is detached.');
      return 0;
    }
  };
  const array = new constructor([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
  ArkTools.arrayBufferDetach(array.buffer);
  arktest.expectThrow(() => array.fill(tmp), ((e: Error): boolean => e instanceof TypeError));

  // Exercise fast paths.
  arktest.assertEQ([0, 0, 0, 0], new constructor(4).fill(0));
}

const signed = [Int8Array, Int16Array, Int32Array, Float32Array, Float64Array];
for (let constructor of signed) {
  arktest.assertEQ([-1, -1, -1, -1], new constructor(4).fill(-1));
}
arktest.assertEQ([0xFF, 0xFF, 0xFF], new Uint8Array(3).fill(-1));
arktest.assertEQ([0xFFFF, 0xFFFF, 0xFFFF], new Uint16Array(3).fill(-1));
arktest.assertEQ([0xFFFF_FFFF, 0xFFFF_FFFF], new Uint32Array(2).fill(-1));

for (let constructor of intArrayConstructors) {
  arktest.assertEQ([0, 0, 0, 0, 0], new constructor([0, 0, 0, 0, 0]).fill(undefined));
  arktest.assertEQ([0, 0, 0, 0, 0], new constructor([0, 0, 0, 0, 0]).fill());
  arktest.assertEQ([0, 0, 0, 0, 0], new constructor([0, 0, 0, 0, 0]).fill('abcd'));
}

for (let constructor of floatArrayConstructors) {
  arktest.assertEQ([NaN, NaN, NaN, NaN, NaN], new constructor([0, 0, 0, 0, 0]).fill(undefined));
  arktest.assertEQ([NaN, NaN, NaN, NaN, NaN], new constructor([0, 0, 0, 0, 0]).fill());
  arktest.assertEQ([NaN, NaN, NaN, NaN, NaN], new constructor([0, 0, 0, 0, 0]).fill('abcd'));
}

// Clamping
arktest.assertEQ([0, 0, 0, 0, 0], new Uint8ClampedArray([0, 0, 0, 0, 0]).fill(-10));
arktest.assertEQ([255, 255, 255, 255, 255], new Uint8ClampedArray([0, 0, 0, 0, 0]).fill(1000));

arktest.assertEQ([1, 1, 1, 1, 1], new Uint8ClampedArray([0, 0, 0, 0, 0]).fill(0.50001));
arktest.assertEQ([0, 0, 0, 0, 0], new Uint8ClampedArray([0, 0, 0, 0, 0]).fill(0.50000));
arktest.assertEQ([0, 0, 0, 0, 0], new Uint8ClampedArray([0, 0, 0, 0, 0]).fill(0.49999));
// Check round half to even
arktest.assertEQ([2, 2, 2, 2, 2], new Uint8ClampedArray([0, 0, 0, 0, 0]).fill(1.50000));
arktest.assertEQ([2, 2, 2, 2, 2], new Uint8ClampedArray([0, 0, 0, 0, 0]).fill(2.50000));
arktest.assertEQ([3, 3, 3, 3, 3], new Uint8ClampedArray([0, 0, 0, 0, 0]).fill(2.50001));
// Check infinity clamping.
arktest.assertEQ([0, 0, 0, 0, 0], new Uint8ClampedArray([0, 0, 0, 0, 0]).fill(-Infinity));
arktest.assertEQ([255, 255, 255, 255, 255], new Uint8ClampedArray([0, 0, 0, 0, 0]).fill(Infinity));
