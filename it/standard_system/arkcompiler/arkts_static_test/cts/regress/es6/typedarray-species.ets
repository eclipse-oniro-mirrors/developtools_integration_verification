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

// Subclasses of ArkTools.typedArray% construct themselves under map, etc

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
  Float64Array
];

for (let constructor of typedArrayConstructors) {
  class MyTypedArray extends constructor { }
  arktest.assertEQ(MyTypedArray, new MyTypedArray().map(()=>0).constructor);
  arktest.assertEQ(MyTypedArray, new MyTypedArray().filter(()=>{}).constructor);
  arktest.assertEQ(MyTypedArray, new MyTypedArray().slice().constructor);
}

// Subclasses can override @@species to return the another class

for (let constructor of typedArrayConstructors) {
  class MyTypedArray extends constructor { }
  class MyOtherTypedArray extends constructor {
    static get [Symbol.species]() { return MyTypedArray; }
  }
  arktest.assertEQ(MyTypedArray, new MyOtherTypedArray().map(()=>0).constructor);
  arktest.assertEQ(MyTypedArray, new MyOtherTypedArray().filter(()=>{}).constructor);
  arktest.assertEQ(MyTypedArray, new MyOtherTypedArray().slice().constructor);
}

// TypedArray too-short and non-TypedArray error checking

for (let constructor of typedArrayConstructors) {
  class MyShortTypedArray extends constructor {
    constructor(length) { super(length - 1); }
  }
  arktest.expectThrow(() => new MyShortTypedArray(5).map(()=>0), ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(() => new MyShortTypedArray(5).filter(()=>true), ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(() => new MyShortTypedArray(5).slice(), ((e: Error): boolean => e instanceof TypeError));

  class MyNonTypedArray extends constructor {
    static get [Symbol.species]() { return Array; }
  }
  arktest.expectThrow(() => new MyNonTypedArray().map(()=>0), ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(() => new MyNonTypedArray().filter(()=>{}), ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(() => new MyNonTypedArray().slice(), ((e: Error): boolean => e instanceof TypeError));
}

// Defaults when constructor or @@species is missing or non-constructor

for (let constructor of typedArrayConstructors) {
  class MyDefaultTypedArray extends constructor {
    static get [Symbol.species]() { return undefined; }
  }
  arktest.assertEQ(constructor, new MyDefaultTypedArray().map(()=>0).constructor);

  class MyOtherDefaultTypedArray extends constructor { }
  arktest.assertEQ(MyOtherDefaultTypedArray, new MyOtherDefaultTypedArray().map(()=>0).constructor);
  MyOtherDefaultTypedArray.prototype.constructor = undefined;
  arktest.assertEQ(constructor, new MyOtherDefaultTypedArray().map(()=>0).constructor);
}

// Exceptions propagated when getting constructor @@species throws

class SpeciesError extends Error { }
class ConstructorError extends Error { }

for (let constructor of typedArrayConstructors) {
  class MyThrowingArray extends constructor {
    static get [Symbol.species]() { throw new SpeciesError; }
  }
  arktest.expectThrow(() => new MyThrowingArray().map(()=>{}), SpeciesError);
  Object.defineProperty(MyThrowingArray.prototype, 'constructor', {
      get() { throw new ConstructorError; }
  });
  arktest.expectThrow(() => new MyThrowingArray().map(()=>{}), ConstructorError);
}
