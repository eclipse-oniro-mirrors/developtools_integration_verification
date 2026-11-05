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
expected_out_1: "Semantic error ESE0087: Property 'prototype' does not exist on type 'String'"
---*/

function testStringPrototypeIterator() {
  const hasStringIterator: boolean = String.prototype.hasOwnProperty(Symbol.iterator);
  arktest.assertTrue(hasStringIterator);
  arktest.assertFalse(''.hasOwnProperty(Symbol.iterator));
  arktest.assertFalse(''.propertyIsEnumerable(Symbol.iterator));
}
testStringPrototypeIterator();


function assertIteratorResult(value, done, result) {
  arktest.assertEQ({value: value, done: done}, result);
}


function testManualIteration() {
  let string = 'abc';
  let iterator = string[Symbol.iterator]();
  assertIteratorResult('a', false, iterator.next());
  assertIteratorResult('b', false, iterator.next());
  assertIteratorResult('c', false, iterator.next());
  assertIteratorResult(void 0, true, iterator.next());
  assertIteratorResult(void 0, true, iterator.next());
}
testManualIteration();


function testSurrogatePairs() {
  let lo = '\uD834';
  let hi = '\uDF06';
  let pair = lo + hi;
  let string = 'abc' + pair + 'def' + lo + pair + hi + lo;
  let iterator = string[Symbol.iterator]();
  assertIteratorResult('a', false, iterator.next());
  assertIteratorResult('b', false, iterator.next());
  assertIteratorResult('c', false, iterator.next());
  assertIteratorResult(pair, false, iterator.next());
  assertIteratorResult('d', false, iterator.next());
  assertIteratorResult('e', false, iterator.next());
  assertIteratorResult('f', false, iterator.next());
  assertIteratorResult(lo, false, iterator.next());
  assertIteratorResult(pair, false, iterator.next());
  assertIteratorResult(hi, false, iterator.next());
  assertIteratorResult(lo, false, iterator.next());
  assertIteratorResult(void 0, true, iterator.next());
  assertIteratorResult(void 0, true, iterator.next());
}
testSurrogatePairs();


function testStringIteratorPrototype() {
  let iterator = ''[Symbol.iterator]();
  const stringIteratorPrototype = iterator.__proto__;
  arktest.assertFalse(stringIteratorPrototype.hasOwnProperty('constructor'));
  arktest.assertEQ(stringIteratorPrototype.__proto__.__proto__, Object.prototype);
  arktest.assertEQ(['next'],
      Object.getOwnPropertyNames(stringIteratorPrototype));
  arktest.assertEQ('[object String Iterator]', '' + iterator);
  arktest.assertEQ('String Iterator', stringIteratorPrototype[Symbol.toStringTag]);
  const desc = Object.getOwnPropertyDescriptor(
      stringIteratorPrototype, Symbol.toStringTag);
  arktest.assertTrue(desc.configurable);
  arktest.assertFalse(desc.writable);
  arktest.assertEQ('String Iterator', desc.value);
}
testStringIteratorPrototype();


function testForOf() {
  let lo = '\uD834';
  let hi = '\uDF06';
  let pair = lo + hi;
  let string = 'abc' + pair + 'def' + lo + pair + hi + lo;
  const expected = ['a', 'b', 'c', pair, 'd', 'e', 'f', lo, pair, hi, lo];

  let i = 0;
  for (let char of string) {
    arktest.assertEQ(expected[i++], char);
  }

  arktest.assertEQ(expected.length, i);
}
testForOf();


function testNonOwnSlots() {
  let iterator = ''[Symbol.iterator]();
  const object = {__proto__: iterator};

  arktest.expectThrow(function() { object.next(); }, ((e: Error): boolean => e instanceof TypeError));
}
testNonOwnSlots();


function testSlicedStringRegression() {
  let longString = 'abcdefhijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  let slicedString = longString.substring(1);
  let iterator = slicedString[Symbol.iterator]();
}
testSlicedStringRegression();


(function(){
  const str = '\uD83C\uDF1F\u5FCD\u8005\u306E\u653B\u6483\uD83C\uDF1F';
  const arr = [...str];
  arktest.assertEQ(['\uD83C\uDF1F', '\u5FCD', '\u8005', '\u306E', '\u653B',
                '\u6483', '\uD83C\uDF1F'], arr);
  arktest.assertEQ(7, arr.length);
})();
