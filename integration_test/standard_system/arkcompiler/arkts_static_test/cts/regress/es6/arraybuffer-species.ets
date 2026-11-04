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

// ArrayBuffer.prototype.slice makes subclass and checks length

/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0192: Must call super constructor"
---*/

class MyArrayBuffer extends ArrayBuffer { }
arktest.assertEQ(MyArrayBuffer, new MyArrayBuffer(0).slice().constructor);

class MyShortArrayBuffer extends ArrayBuffer {
  constructor(length) { super(length - 1); }
}
arktest.expectThrow(() => new MyShortArrayBuffer(5).slice(0, 4), ((e: Error): boolean => e instanceof TypeError));

class SingletonArrayBuffer extends ArrayBuffer {
  constructor(...args) {
    if (SingletonArrayBuffer.cached) { return SingletonArrayBuffer.cached; }
    super(...args);
    SingletonArrayBuffer.cached = this;
  }
}
arktest.expectThrow(() => new SingletonArrayBuffer(5).slice(0, 4), ((e: Error): boolean => e instanceof TypeError));

class NonArrayBuffer extends ArrayBuffer {
  constructor() {
    return {};
  }
}
arktest.expectThrow(() => new NonArrayBuffer(5).slice(0, 4), ((e: Error): boolean => e instanceof TypeError));

// Species fallback is ArrayBuffer
class UndefinedArrayBuffer extends ArrayBuffer { }
UndefinedArrayBuffer.prototype.constructor = undefined;
arktest.assertEQ(ArrayBuffer, new UndefinedArrayBuffer(0).slice().constructor);
