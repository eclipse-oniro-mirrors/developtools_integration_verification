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

(function TestBufferByteLengthNonSmi() {
  let nonSmiByteLength = ArkTools.maxSmi() + 1;

  let buffer = new ArrayBuffer(nonSmiByteLength);

  let arr = new Uint16Array(buffer);

  arktest.assertEQ(nonSmiByteLength, arr.byteLength);
  arktest.assertEQ(nonSmiByteLength / 2, arr.length);

  arr = new Uint32Array(buffer);
  arktest.assertEQ(nonSmiByteLength, arr.byteLength);
  arktest.assertEQ(nonSmiByteLength / 4, arr.length);
})();

(function TestByteOffsetNonSmi() {
  let nonSmiByteLength = ArkTools.maxSmi() + 11;

  let buffer = new ArrayBuffer(nonSmiByteLength);

  const whole = new Uint16Array(buffer);

  arktest.assertEQ(nonSmiByteLength, whole.byteLength);
  arktest.assertEQ(nonSmiByteLength / 2, whole.length);

  let arr = new Uint16Array(buffer, nonSmiByteLength - 10, 5);

  arktest.assertEQ(nonSmiByteLength, arr.buffer.byteLength);
  arktest.assertEQ(10, arr.byteLength);
  arktest.assertEQ(5, arr.length);
})();

(() => {
(function TestBufferByteLengthNonSmi() {
  const sourceBufferLength = ArkTools.maxSmi() + 1;
  const sourceBuffer = new ArrayBuffer(sourceBufferLength);
  const source = new Uint16Array(sourceBuffer);
  arktest.assertEQ(sourceBufferLength, sourceBuffer.byteLength);
  arktest.assertEQ(sourceBufferLength / 2, source.length);

  const targetBufferLength = ArkTools.maxSmi() - 1;
  const targetBuffer = new ArrayBuffer(targetBufferLength);
  const target = new Uint16Array(targetBuffer);
  arktest.assertEQ(targetBufferLength, targetBuffer.byteLength);
  arktest.assertEQ(targetBufferLength / 2, target.length);

  arktest.expectThrow(() => target.set(source), ((e: Error): boolean => e instanceof RangeError));
})();
})();
