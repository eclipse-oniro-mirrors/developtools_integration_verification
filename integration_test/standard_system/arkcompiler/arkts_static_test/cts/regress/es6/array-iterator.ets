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
expected_out_1: "Semantic error ESE0087: Property 'getOwnPropertyDescriptor' does not exist on type 'Object'"
---*/

Object.getOwnPropertyDescriptor(() => {}, 'x');

// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are
// met:
//
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above
//       copyright notice, this list of conditions and the following
//       disclaimer in the documentation and/or other materials provided
//       with the distribution.
//     * Neither the name of upstream project Inc. nor the names of its
//       contributors may be used to endorse or promote products derived
//       from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.



const NONE = 0;
const READ_ONLY = 1;
const DONT_ENUM = 2;
const DONT_DELETE = 4;


function assertHasOwnProperty(object, name, attrs) {
  arktest.assertTrue(object.hasOwnProperty(name));
  let desc = Object.getOwnPropertyDescriptor(object, name);
  arktest.assertEQ(desc.writable, !(attrs & READ_ONLY));
  arktest.assertEQ(desc.enumerable, !(attrs & DONT_ENUM));
  arktest.assertEQ(desc.configurable, !(attrs & DONT_DELETE));
}


function testArrayPrototype() {
  assertHasOwnProperty(Array.prototype, 'entries', DONT_ENUM);
  assertHasOwnProperty(Array.prototype, 'keys', DONT_ENUM);
  assertHasOwnProperty(Array.prototype, Symbol.iterator, DONT_ENUM);
  arktest.assertEQ('entries', Array.prototype.entries.name);
  arktest.assertEQ('keys', Array.prototype.keys.name);
  arktest.assertEQ('values', Array.prototype[Symbol.iterator].name);
}
testArrayPrototype();


function assertIteratorResult(value, done, result) {
  arktest.assertEQ({value: value, done: done}, result);
}


function testValues() {
  let array = ['a', 'b', 'c'];
  let iterator = array[Symbol.iterator]();
  assertIteratorResult('a', false, iterator.next());
  assertIteratorResult('b', false, iterator.next());
  assertIteratorResult('c', false, iterator.next());
  assertIteratorResult(void 0, true, iterator.next());

  array.push('d');
  assertIteratorResult(void 0, true, iterator.next());
}
testValues();


function testValuesMutate() {
  let array = ['a', 'b', 'c'];
  let iterator = array[Symbol.iterator]();
  assertIteratorResult('a', false, iterator.next());
  assertIteratorResult('b', false, iterator.next());
  assertIteratorResult('c', false, iterator.next());
  array.push('d');
  assertIteratorResult('d', false, iterator.next());
  assertIteratorResult(void 0, true, iterator.next());
}
testValuesMutate();


function testKeys() {
  let array = ['a', 'b', 'c'];
  let iterator = array.keys();
  assertIteratorResult(0, false, iterator.next());
  assertIteratorResult(1, false, iterator.next());
  assertIteratorResult(2, false, iterator.next());
  assertIteratorResult(void 0, true, iterator.next());

  array.push('d');
  assertIteratorResult(void 0, true, iterator.next());
}
testKeys();


function testKeysMutate() {
  let array = ['a', 'b', 'c'];
  let iterator = array.keys();
  assertIteratorResult(0, false, iterator.next());
  assertIteratorResult(1, false, iterator.next());
  assertIteratorResult(2, false, iterator.next());
  array.push('d');
  assertIteratorResult(3, false, iterator.next());
  assertIteratorResult(void 0, true, iterator.next());
}
testKeysMutate();


function testEntries() {
  let array = ['a', 'b', 'c'];
  let iterator = array.entries();
  assertIteratorResult([0, 'a'], false, iterator.next());
  assertIteratorResult([1, 'b'], false, iterator.next());
  assertIteratorResult([2, 'c'], false, iterator.next());
  assertIteratorResult(void 0, true, iterator.next());

  array.push('d');
  assertIteratorResult(void 0, true, iterator.next());
}
testEntries();


function testEntriesMutate() {
  let array = ['a', 'b', 'c'];
  let iterator = array.entries();
  assertIteratorResult([0, 'a'], false, iterator.next());
  assertIteratorResult([1, 'b'], false, iterator.next());
  assertIteratorResult([2, 'c'], false, iterator.next());
  array.push('d');
  assertIteratorResult([3, 'd'], false, iterator.next());
  assertIteratorResult(void 0, true, iterator.next());
}
testEntriesMutate();


function testArrayIteratorPrototype() {
  let array = [];
  let iterator = array.keys();

  const arrayIteratorPrototype = iterator.__proto__;

  arktest.assertEQ(arrayIteratorPrototype, array[Symbol.iterator]().__proto__);
  arktest.assertEQ(arrayIteratorPrototype, array.keys().__proto__);
  arktest.assertEQ(arrayIteratorPrototype, array.entries().__proto__);

  arktest.assertEQ(Object.prototype, arrayIteratorPrototype.__proto__.__proto__);

  arktest.assertFalse(arrayIteratorPrototype.hasOwnProperty('constructor'));
  arktest.assertEQ(['next'],
      Object.getOwnPropertyNames(arrayIteratorPrototype));
  assertHasOwnProperty(arrayIteratorPrototype, 'next', DONT_ENUM);
  arktest.assertFalse(arrayIteratorPrototype.hasOwnProperty(Symbol.iterator));

  arktest.assertEQ('[object Array Iterator]',
      Object.prototype.toString.call(iterator));
  arktest.assertEQ('Array Iterator', arrayIteratorPrototype[Symbol.toStringTag]);
  let desc = Object.getOwnPropertyDescriptor(
      arrayIteratorPrototype, Symbol.toStringTag);
  arktest.assertTrue(desc.configurable);
  arktest.assertFalse(desc.writable);
  arktest.assertEQ('Array Iterator', desc.value);
}
testArrayIteratorPrototype();


function testForArrayValues() {
  let buffer = [];
  let array = [0, 'a', true, false, null, /* hole */, undefined, NaN];
  let i = 0;
  for (let value of array[Symbol.iterator]()) {
    buffer[i++] = value;
  }

  arktest.assertEQ(8, buffer.length);

  for (let i = 0; i < buffer.length; i++) {
    arktest.assertEQ(array[i], buffer[i]);
  }
}
testForArrayValues();


function testForArrayKeys() {
  let buffer = [];
  let array = [0, 'a', true, false, null, /* hole */, undefined, NaN];
  let i = 0;
  for (let key of array.keys()) {
    buffer[i++] = key;
  }

  arktest.assertEQ(8, buffer.length);

  for (let i = 0; i < buffer.length; i++) {
    arktest.assertEQ(i, buffer[i]);
  }
}
testForArrayKeys();


function testForArrayEntries() {
  let buffer = [];
  let array = [0, 'a', true, false, null, /* hole */, undefined, NaN];
  let i = 0;
  for (let entry of array.entries()) {
    buffer[i++] = entry;
  }

  arktest.assertEQ(8, buffer.length);

  for (let i = 0; i < buffer.length; i++) {
    arktest.assertEQ(array[i], buffer[i][1]);
  }

  for (let i = 0; i < buffer.length; i++) {
    arktest.assertEQ(i, buffer[i][0]);
  }
}
testForArrayEntries();


function testForArray() {
  let buffer = [];
  let array = [0, 'a', true, false, null, /* hole */, undefined, NaN];
  let i = 0;
  for (let value of array) {
    buffer[i++] = value;
  }

  arktest.assertEQ(8, buffer.length);

  for (let i = 0; i < buffer.length; i++) {
    arktest.assertEQ(array[i], buffer[i]);
  }
}
testForArrayValues();


function testNonOwnSlots() {
  let array = [0];
  let iterator = array[Symbol.iterator]();
  let object = {__proto__: iterator};

  arktest.expectThrow(function() {
    object.next();
  }, ((e: Error): boolean => e instanceof TypeError));
}
testNonOwnSlots();

function testForDictionaryArray() {
  let array = [];
  array[1024] = 'c';
  arktest.assertTrue(ArkTools.hasDictionaryElements(array));
  let iterator = array[Symbol.iterator]();
  for (let i = 0; i < 1024; ++i) {
    assertIteratorResult(void 0, false, iterator.next());
  }
  assertIteratorResult('c', false, iterator.next());
  assertIteratorResult(void 0, true, iterator.next());
}
testForDictionaryArray();
