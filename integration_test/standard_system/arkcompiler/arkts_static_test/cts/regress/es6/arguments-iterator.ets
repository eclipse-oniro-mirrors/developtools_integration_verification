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
expected_out_1: "Semantic error ESE0143: Unresolved reference arguments"
---*/

function testDirectArgumentsIteratorProperty() {
  const hasArgumentsIterator: boolean = arguments.hasOwnProperty(Symbol.iterator);
  arktest.assertTrue(hasArgumentsIterator);
  arktest.assertFalse(arguments.propertyIsEnumerable(Symbol.iterator));
  let descriptor = Object.getOwnPropertyDescriptor(arguments, Symbol.iterator);
  arktest.assertTrue(descriptor.writable);
  arktest.assertFalse(descriptor.enumerable);
  arktest.assertTrue(descriptor.configurable);
  arktest.assertEQ(descriptor.value, [][Symbol.iterator]);
  arktest.assertEQ(arguments[Symbol.iterator], [][Symbol.iterator]);
}
testDirectArgumentsIteratorProperty();


function testIndirectArgumentsIteratorProperty() {
  let o = arguments;
  arktest.assertTrue(o.hasOwnProperty(Symbol.iterator));
  arktest.assertFalse(o.propertyIsEnumerable(Symbol.iterator));
  arktest.assertEQ(o[Symbol.iterator], [][Symbol.iterator]);
}
testIndirectArgumentsIteratorProperty();


function checkIteratorResult(value, done, result) {
  arktest.assertEQ({value: value, done: done}, result);
}


function testDirectValues1(a, b, c) {
  let iterator = arguments[Symbol.iterator]();
  checkIteratorResult(a, false, iterator.next());
  checkIteratorResult(b, false, iterator.next());
  checkIteratorResult(c, false, iterator.next());
  checkIteratorResult(undefined, true, iterator.next());
}
testDirectValues1(1, 2, 3);


function testIndirectValues1(a, b, c) {
  let args = arguments;
  let iterator = args[Symbol.iterator]();
  checkIteratorResult(a, false, iterator.next());
  checkIteratorResult(b, false, iterator.next());
  checkIteratorResult(c, false, iterator.next());
  checkIteratorResult(undefined, true, iterator.next());
}
testIndirectValues1(1, 2, 3);


function testDirectValues2(a, b, c) {
  let iterator = arguments[Symbol.iterator]();
  checkIteratorResult(a, false, iterator.next());
  checkIteratorResult(b, false, iterator.next());
  checkIteratorResult(c, false, iterator.next());
  checkIteratorResult(undefined, true, iterator.next());

  arguments[3] = 4;
  arguments.length = 4;
  checkIteratorResult(undefined, true, iterator.next());
}
testDirectValues2(1, 2, 3);


function testIndirectValues2(a, b, c) {
  let args = arguments;
  let iterator = args[Symbol.iterator]();
  checkIteratorResult(a, false, iterator.next());
  checkIteratorResult(b, false, iterator.next());
  checkIteratorResult(c, false, iterator.next());
  checkIteratorResult(undefined, true, iterator.next());

  arguments[3] = 4;
  arguments.length = 4;
  checkIteratorResult(undefined, true, iterator.next());
}
testIndirectValues2(1, 2, 3);


function testDirectValues3(a, b, c) {
  let iterator = arguments[Symbol.iterator]();
  checkIteratorResult(a, false, iterator.next());
  checkIteratorResult(b, false, iterator.next());

  arguments.length = 2;
  checkIteratorResult(undefined, true, iterator.next());
}
testDirectValues3(1, 2, 3);


function testIndirectValues3(a, b, c) {
  let args = arguments;
  let iterator = args[Symbol.iterator]();
  checkIteratorResult(a, false, iterator.next());
  checkIteratorResult(b, false, iterator.next());

  arguments.length = 2;
  checkIteratorResult(undefined, true, iterator.next());
}
testIndirectValues3(1, 2, 3);


function testDirectValues4(a, b, c) {
  let iterator = arguments[Symbol.iterator]();
  checkIteratorResult(a, false, iterator.next());
  checkIteratorResult(b, false, iterator.next());
  checkIteratorResult(c, false, iterator.next());

  arguments.length = 4;
  checkIteratorResult(undefined, false, iterator.next());
  checkIteratorResult(undefined, true, iterator.next());
}
testDirectValues4(1, 2, 3);


function testIndirectValues4(a, b, c) {
  let args = arguments;
  let iterator = args[Symbol.iterator]();
  checkIteratorResult(a, false, iterator.next());
  checkIteratorResult(b, false, iterator.next());
  checkIteratorResult(c, false, iterator.next());

  arguments.length = 4;
  checkIteratorResult(undefined, false, iterator.next());
  checkIteratorResult(undefined, true, iterator.next());
}
testIndirectValues4(1, 2, 3);


function testForOf() {
  let i = 0;
  for (let value of arguments) {
    arktest.assertEQ(arguments[i++], value);
  }

  arktest.assertEQ(arguments.length, i);
}
testForOf(1, 2, 3, 4, 5);


function testAssignmentToIterator() {
  let i = 0;
  arguments[Symbol.iterator] = [].entries;
  for (let entry of arguments) {
    arktest.assertEQ([i, arguments[i]], entry);
    i++;
  }

  arktest.assertEQ(arguments.length, i);
}
testAssignmentToIterator(1, 2, 3, 4, 5);


// Regression test for crbug.com/521484.
function testAssignmentToIterator2() {
  let i = 0;
  arguments.__defineGetter__('callee', function(){});
  arguments.__defineGetter__('length', function(){ return 1 });
  arguments[Symbol.iterator] = [].entries;
  for (let entry of arguments) {
    arktest.assertEQ([i, arguments[i]], entry);
    i++;
  }

  arktest.assertEQ(arguments.length, i);
}
testAssignmentToIterator2(1, 2, 3, 4, 5);

function testArgumentsMutation() {
  let i = 0;
  for (let x of arguments) {
    arktest.assertEQ(arguments[i], x);
    arguments[i+1] *= 2;
    i++;
  }

  arktest.assertEQ(arguments.length, i);
}
testArgumentsMutation(1, 2, 3, 4, 5);


function testSloppyArgumentsAliasing(a0, a1, a2, a3, a4) {
  let i = 0;
  for (let x of arguments) {
    arktest.assertEQ(arguments[i], x);
    a0 = a1; a1 = a2; a3 = a4;
    i++;
  }

  arktest.assertEQ(arguments.length, i);
}
testSloppyArgumentsAliasing(1, 2, 3, 4, 5);


function testStrictArgumentsAliasing(a0, a1, a2, a3, a4) {
  'use strict';
  let i = 0;
  for (let x of arguments) {
    a0 = a1; a1 = a2; a3 = a4;
    arktest.assertEQ(arguments[i], x);
    i++;
  }

  arktest.assertEQ(arguments.length, i);
}
testStrictArgumentsAliasing(1, 2, 3, 4, 5);


function testArgumentsAsProto() {
  'use strict';

  let o = {__proto__:arguments};
  arktest.assertEQ([][Symbol.iterator], o[Symbol.iterator]);
  // Make o dict-mode.
  ArkTools.optimizeObjectForAddingMultipleProperties(o, 0);
  arktest.assertFalse(o.hasOwnProperty(Symbol.iterator));
  arktest.assertEQ([][Symbol.iterator], o[Symbol.iterator]);
  o[Symbol.iterator] = 10;
  arktest.assertTrue(o.hasOwnProperty(Symbol.iterator));
  arktest.assertEQ(10, o[Symbol.iterator]);
  arktest.assertEQ([][Symbol.iterator], arguments[Symbol.iterator]);

  // Frozen o.
  o = Object.freeze({__proto__:arguments});
  arktest.assertEQ([][Symbol.iterator], o[Symbol.iterator]);
  arktest.assertFalse(o.hasOwnProperty(Symbol.iterator));
  arktest.assertEQ([][Symbol.iterator], o[Symbol.iterator]);
  arktest.expectThrow(function () { o[Symbol.iterator] = 10 });
  arktest.assertFalse(o.hasOwnProperty(Symbol.iterator));
  arktest.assertEQ([][Symbol.iterator], o[Symbol.iterator]);
  arktest.assertEQ([][Symbol.iterator], arguments[Symbol.iterator]);
}
testArgumentsAsProto();
