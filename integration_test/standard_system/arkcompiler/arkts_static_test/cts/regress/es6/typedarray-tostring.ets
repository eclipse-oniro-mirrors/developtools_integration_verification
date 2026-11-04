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

// Array's toString should call the object's own join method, if one exists and
// is callable. Otherwise, just use the original Object.toString function.


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
  const success = '[test success]';
  let expectedThis;
  function testJoin() {
    arktest.assertEQ(0, arguments.length);
    arktest.assertEQ(expectedThis, this);
    return success;
  }


  // On an Array object.

  // Default case.
  const a1 = new constructor([1, 2, 3]);
  arktest.assertEQ('1,2,3', a1.toString());
  arktest.assertEQ('1,2,3', a1.join());
  arktest.assertEQ('1,2,3', a1.toLocaleString());

  // Non-standard "join" function is called correctly.
  let a2 = new constructor([1, 2, 3]);
  a2.join = testJoin;
  expectedThis = a2;
  arktest.assertEQ(success, a2.toString());
  arktest.assertEQ(success, a2.join());
  arktest.assertEQ('1,2,3', a2.toLocaleString());

  // Non-callable join function is ignored and Object.prototype.toString is
  // used instead.
  const a3 = new constructor([1, 2, 3]);
  a3.join = 'not callable';
  arktest.assertEQ(0, a3.toString().search(/\[object .+Array\]/));

  // Non-existing join function is treated same as non-callable.
  const a4 = new constructor([1, 2, 3]);
  a4.__proto__ = { toString: constructor.prototype.toString };
  // No join on Array.
  arktest.assertEQ(0, a3.toString().search(/\[object .+Array\]/));


  // On a non-Array object, throws.
  const o1 = {length: 3, 0: 1, 1: 2, 2: 3,
            toString: constructor.prototype.toString,
            join: constructor.prototype.join,
            toLocaleString: constructor.prototype.toLocaleString};
  arktest.expectThrow(function() { o1.join() }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { o1.toString() }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { o1.toLocaleString() }, ((e: Error): boolean => e instanceof TypeError));
  // toString is OK if join not from here:
  o1.join = Array.prototype.join;
  arktest.assertEQ('1,2,3', o1.join());
  arktest.assertEQ('1,2,3', o1.toString());
  arktest.expectThrow(function() { o1.toLocaleString() }, ((e: Error): boolean => e instanceof TypeError));

  arktest.assertEQ(o1.toString, Array.prototype.toString);

  // Redefining length does not change result
  const a5 = new constructor([1, 2, 3])
  Object.defineProperty(a5, 'length', { value: 2 });
  arktest.assertEQ('1,2,3', a5.join());
  arktest.assertEQ('1,2,3', a5.toString());
  arktest.assertEQ('1,2,3', a5.toLocaleString());
  arktest.assertEQ('1,2', Array.prototype.join.call(a5));
  arktest.assertEQ('1,2,3', Array.prototype.toString.call(a5));
  arktest.assertEQ('1,2', Array.prototype.toLocaleString.call(a5));

  (function TestToLocaleStringCalls() {
    let log = [];
    let pushArgs = (label) => (...args) => log.push(label, args);

    let numberToLocaleString = Number.prototype.toLocaleString;
    Number.prototype.toLocaleString = pushArgs('Number');

    // According to the ECMA-402 specification, the optional arguments locales
    // and options must be passed.  Without the ECMA-402 internationalization
    // API, the optional arguments must not be passed.
    const noArgs = (typeof Intl !== 'object') ? [] : [undefined, undefined];
    (new constructor([1, 2])).toLocaleString();
    arktest.assertEQ(['Number', noArgs, 'Number', noArgs], log);

    Number.prototype.toLocaleString = numberToLocaleString;
  })();

  // Detached Operation
  // When ES6 version, join() and toString() will throw an exception.
  // After testing on the browser, the current version no longer shows
  // any abnormalities.
  const array = new constructor([1, 2, 3]);
  ArkTools.arrayBufferDetach(array.buffer);
  arktest.expectNoThrow(() => array.join());
  arktest.expectThrow(() => array.toLocalString(), ((e: Error): boolean => e instanceof TypeError));
  arktest.expectNoThrow(() => array.toString());
}
