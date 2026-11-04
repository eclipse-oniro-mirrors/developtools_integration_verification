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
expected_out_1: "Syntax error ESY0320: Function expressions are not supported, use arrow functions instead"
---*/

(function TestThrowBeforeLengthToPrimitive() {
  // From 22.2.4.5 TypedArray ( buffer [ , byteOffset [ , length ] ] ), check
  // that step 7:
  //    If offset modulo elementSize ≠ 0, throw a RangeError exception.
  // happens before step 11:
  //    Let newLength be ? ToIndex(length).
  let expected = ['offset.toPrimitive'];
  let actual = [];
  let offset = {};
  offset[Symbol.toPrimitive] = function() {
    actual.push('offset.toPrimitive');
    return 1;
  };

  let length = {};
  length[Symbol.toPrimitive] = function() {
    actual.push('length.toPrimitive');
    return 1;
  };

  let buffer = new ArrayBuffer(16);

  arktest.expectThrow(function() {
    new Uint32Array(buffer, offset, length)
  }, ((e: Error): boolean => e instanceof RangeError));
  arktest.assertEQ(expected, actual);
})();

(function TestConstructByBufferToPrimitiveOrdering() {
  let expected = ['offset.toPrimitive', 'length.toPrimitive'];
  let actual = [];
  let offset = {};
  offset[Symbol.toPrimitive] = function() {
    actual.push('offset.toPrimitive');
    return 1;
  };

  let length = {};
  length[Symbol.toPrimitive] = function() {
    actual.push('length.toPrimitive');
    return 1;
  };

  let buffer = new ArrayBuffer(16);
  let arr = new Uint8Array(buffer, offset, length);

  arktest.assertEQ(expected, actual);
  arktest.assertEQ(1, arr.length);
})();

(function TestByteOffsetToIndexThrowsForNegative() {
  let buffer = new ArrayBuffer(16);
  arktest.expectThrow(function() {
    new Uint8Array(buffer, -1);
  }, ((e: Error): boolean => e instanceof RangeError));
})();

(function TestByArrayLikeObservableOrdering() {
  let expected = [
    'proxy.Symbol(Symbol.iterator)', 'proxy.length', 'proxy.0', 'proxy.1',
    'proxy.2'
  ];
  let actual = [];

  const a = [1, 2, 3];
  const proxy = new Proxy(a, {
    get: function(target, name) {
      actual.push('proxy.' + name.toString());
      if (name === Symbol.iterator) { return undefined; }
      return target[name];
    }
  });
  let arr = new Uint8Array(proxy);

  arktest.assertEQ(a.length, arr.length);
  arktest.assertEQ(expected, actual);
})();
