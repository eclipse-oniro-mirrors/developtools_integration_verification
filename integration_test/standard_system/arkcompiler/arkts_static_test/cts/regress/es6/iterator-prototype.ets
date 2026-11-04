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

let arrayIteratorPrototype = [].entries().__proto__;
const iteratorPrototype = arrayIteratorPrototype.__proto__;

arktest.assertEQ(Object.prototype, Object.getPrototypeOf(iteratorPrototype));
arktest.assertTrue(Object.isExtensible(iteratorPrototype));
arktest.assertEQ(12, Object.getOwnPropertyNames(iteratorPrototype).length);
arktest.assertEQ(2, Object.getOwnPropertySymbols(iteratorPrototype).length);
arktest.assertEQ(Symbol.iterator,
             Object.getOwnPropertySymbols(iteratorPrototype)[0]);

let descr = Object.getOwnPropertyDescriptor(iteratorPrototype, Symbol.iterator);
arktest.assertTrue(descr.configurable);
arktest.assertFalse(descr.enumerable);
arktest.assertTrue(descr.writable);

const iteratorFunction = descr.value;
arktest.assertEQ('function', typeof iteratorFunction);
arktest.assertEQ(0, iteratorFunction.length);
arktest.assertEQ('[Symbol.iterator]', iteratorFunction.name);

const obj = {};
arktest.assertEQ(obj, iteratorFunction.call(obj));
arktest.assertEQ(iteratorPrototype, iteratorPrototype[Symbol.iterator]());

const mapIteratorPrototype = new Map().entries().__proto__;
const setIteratorPrototype = new Set().values().__proto__;
const stringIteratorPrototype = 'abc'[Symbol.iterator]().__proto__;
arktest.assertEQ(iteratorPrototype, mapIteratorPrototype.__proto__);
arktest.assertEQ(iteratorPrototype, setIteratorPrototype.__proto__);
arktest.assertEQ(iteratorPrototype, stringIteratorPrototype.__proto__);

const typedArrays = [
  Float32Array,
  Float64Array,
  Int16Array,
  Int32Array,
  Int8Array,
  Uint16Array,
  Uint32Array,
  Uint8Array,
  Uint8ClampedArray,
];

for (let constructor of typedArrays) {
  let array = new constructor();
  const iterator = array[Symbol.iterator]();
  arktest.assertEQ(iteratorPrototype, iterator.__proto__.__proto__);
}

function* gen() {}
arktest.assertEQ(iteratorPrototype, gen.prototype.__proto__.__proto__);
const g = gen();
arktest.assertEQ(gen.prototype, g.__proto__);
arktest.assertEQ(iteratorPrototype, g.__proto__.__proto__.__proto__);
