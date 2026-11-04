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

// Based on Mozilla Array.of() tests at http://dxr.mozilla.org/mozilla-central/source/js/src/jit-test/tests/collections

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0318: Class cannot be used as object."
---*/

'use strict';

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


function testTypedArrayOf(constructor) {
  // ArkTools.typedArray%.of basics.
  let a = constructor.of();
  arktest.assertEQ(0, a.length);
  arktest.assertEQ(constructor.prototype, Object.getPrototypeOf(a));
  arktest.assertEQ(false, Array.isArray(a));

  // Items are coerced to numerical values.
  a = constructor.of(undefined, null, [], true, false, 3.14);

  // For typed arrays of floating point values, values are not rounded.
  if (constructor === Float32Array || constructor === Float64Array) {
    arktest.assertEQ(NaN, a[0]);
    arktest.assertEQ(0, a[1]);
    arktest.assertEQ(0, a[2]);
    arktest.assertEQ(1, a[3]);
    arktest.assertEQ(0, a[4]);
    arktest.assertEQ(true, Math.abs(a[5] - 3.14) < 1e-6);
  } else {
    arktest.assertEQ(0, a[0]);
    arktest.assertEQ(0, a[1]);
    arktest.assertEQ(0, a[2]);
    arktest.assertEQ(1, a[3]);
    arktest.assertEQ(0, a[4]);
    arktest.assertEQ(3, a[5]);
  }

  const aux = [];
  for (let i = 0; i < 100; i++) {
    aux[i] = i;
    }

  a = constructor.of.apply(constructor, aux);
  arktest.assertEQ(aux.length, a.length);
  arktest.assertEQ(aux, a);

  // ArkTools.typedArray%.of can be called on subclasses of TypedArrays
  let hits = 0;
  class Bag extends constructor {
    constructor(length) {
      super(length);
      arktest.assertEQ(arguments.length, 1);
      arktest.assertEQ(length, 2);
      hits++;
    }
  }

  hits = 0;
  a = Bag.of(5, 6);
  arktest.assertEQ(1, hits);
  arktest.assertEQ(2, a.length);
  arktest.assertEQ([5, 6], a);
  arktest.assertEQ(Bag.prototype, a.__proto__);

  hits = 0;
  const actual = constructor.of.call(Bag, 5, 6);
  arktest.assertEQ(1, hits);
  arktest.assertEQ(2, a.length);
  arktest.assertEQ([5, 6], a);
  arktest.assertEQ(Bag.prototype, a.__proto__);

  // ArkTools.typedArray%.of does not trigger prototype setters.
  // (It defines elements rather than assigning to them.)
  let status = 'pass';
  Object.defineProperty(constructor.prototype, '0', {
    set: function(v) { status = 'fail'; }
  });
  arktest.assertEQ(1, constructor.of(1)[0], 1);
  arktest.assertEQ('pass', status);

  // Note that ArkTools.typedArray%.of does not trigger "length" setter itself, as
  // it relies on the constructor to set "length" to the value passed to it.
  // If the constructor does not assign "length", the setter should not be
  // invoked.

  // Setter on the newly created object.
  class Pack extends constructor {
    constructor(length) {
      super(length);
      Object.defineProperty(this, 'length', {
        set: function (v) { status = 'fail'; }
      });
    }
  }
  const pack = Pack.of(5, 6, 7, 8);
  arktest.assertEQ('pass', status);

  // when the setter is on the new object's prototype
  class Bevy extends constructor {}
  Object.defineProperty(Bevy.prototype, 'length', {
    set: function (v) { status = 'fail'; }
  });
  const bevy = Bevy.of(3);
  arktest.assertEQ('pass', status);

  // Check superficial features of ArkTools.typedArray%.of.
  const desc = Object.getOwnPropertyDescriptor(constructor.__proto__, 'of');

  arktest.assertEQ(desc.configurable, true);
  arktest.assertEQ(desc.enumerable, false);
  arktest.assertEQ(desc.writable, true);
  arktest.assertEQ(constructor.of.length, 0);

  // ArkTools.typedArray%.of is not a constructor.
  arktest.expectThrow(function() { new constructor.of(); }, ((e: Error): boolean => e instanceof TypeError));

  // For receivers which are not constructors ArkTools.typedArray%.of does not
  // allocate a typed array using a default constructor, but throws an
  // exception. Note that this is different from Array.of, which uses
  // Array as default constructor.
  for (let x of [undefined, null, false, true, 'cow', 42, 3.14]) {
    arktest.expectThrow(function () { constructor.of.call(x); }, ((e: Error): boolean => e instanceof TypeError));
  }

  // Check if it's correctly accessing new typed array elements even after
  // garbage collection is invoked in ToNumber.
  const notNumber = {
    [Symbol.toPrimitive]() {
      ArkTools.gc();
      return 123;
    }
  };
  const dangerousArray = new Array(64).fill(notNumber);
  const a = constructor.of(...dangerousArray);
  for (let i = 0; i < 64; i++) {
    arktest.assertEQ(123, a[i]);
  }
}

for (let constructor of typedArrayConstructors) {
  testTypedArrayOf(constructor);
}
