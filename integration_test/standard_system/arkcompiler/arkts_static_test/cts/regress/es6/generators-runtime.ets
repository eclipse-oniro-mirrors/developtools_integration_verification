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

// Test aspects of the generator runtime.

// See:
// http://people.mozilla.org/~jorendorff/es6-draft.html#sec-generatorfunction-objects

/*---
tags: [compile-only, negative]
expected_out_1: >-
  Syntax error ESY0314: Generator functions are not supported, please use
  async/await mechanism for multitasking
---*/

function f() { 'use strict'; }
function* g() { yield 1; }
let generatorFunctionPrototype = Object.getPrototypeOf(g);
const generatorFunction = generatorFunctionPrototype.constructor;
const generatorObjectPrototype = generatorFunctionPrototype.prototype;
const iteratorPrototype = Object.getPrototypeOf(generatorObjectPrototype);

// A generator function should have the same set of properties as any
// other function.
function testGeneratorFunctionInstance() {
  let fOwnPropertyNames = Object.getOwnPropertyNames(f);
  const gOwnPropertyNames = Object.getOwnPropertyNames(g);

  fOwnPropertyNames.sort();
  gOwnPropertyNames.sort();

  arktest.assertEQ(fOwnPropertyNames, gOwnPropertyNames);
  let i;
  for (i = 0; i < fOwnPropertyNames.length; i++) {
    const prop = fOwnPropertyNames[i];
    const fDesc = Object.getOwnPropertyDescriptor(f, prop);
    const gDesc = Object.getOwnPropertyDescriptor(g, prop);
    arktest.assertEQ(fDesc.configurable, gDesc.configurable, prop);
    arktest.assertEQ(fDesc.writable, gDesc.writable, prop);
    arktest.assertEQ(fDesc.enumerable, gDesc.enumerable, prop);
  }
}
testGeneratorFunctionInstance();


// Generators have an additional object interposed in the chain between
// themselves and Function.prototype.
function testGeneratorFunctionPrototype() {
  // Sanity check.
  arktest.assertEQ(Object.getPrototypeOf(f), Function.prototype);
  arktest.assertFalse(generatorFunctionPrototype === Function.prototype);
  arktest.assertEQ(Function.prototype,
             Object.getPrototypeOf(generatorFunctionPrototype));
  arktest.assertEQ(generatorFunctionPrototype,
             Object.getPrototypeOf(function* () {}));
  arktest.assertEQ('object', typeof generatorFunctionPrototype);

  let constructorDesc = Object.getOwnPropertyDescriptor(
      generatorFunctionPrototype, 'constructor');
  arktest.assertTrue(constructorDesc !== undefined);
  arktest.assertEQ(generatorFunction, constructorDesc.value);
  arktest.assertFalse(constructorDesc.writable);
  arktest.assertFalse(constructorDesc.enumerable);
  arktest.assertTrue(constructorDesc.configurable);

  let prototypeDesc = Object.getOwnPropertyDescriptor(
      generatorFunctionPrototype, 'prototype');
  arktest.assertTrue(prototypeDesc !== undefined);
  arktest.assertEQ(generatorObjectPrototype, prototypeDesc.value);
  arktest.assertFalse(prototypeDesc.writable);
  arktest.assertFalse(prototypeDesc.enumerable);
  arktest.assertTrue(prototypeDesc.configurable);
}
testGeneratorFunctionPrototype();


// Functions that we associate with generator objects are actually defined by
// a common prototype.
function testGeneratorObjectPrototype() {
  arktest.assertEQ(iteratorPrototype,
             Object.getPrototypeOf(generatorObjectPrototype));
  arktest.assertEQ(generatorObjectPrototype,
             Object.getPrototypeOf((function*(){yield 1}).prototype));

  const expectedPropertyNames = ['next', 'return', 'throw', 'constructor'];
  const foundPropertyNames =
      Object.getOwnPropertyNames(generatorObjectPrototype);

  expectedPropertyNames.sort();
  foundPropertyNames.sort();

  arktest.assertEQ(expectedPropertyNames, foundPropertyNames);

  let constructorDesc = Object.getOwnPropertyDescriptor(
      generatorObjectPrototype, 'constructor');
  arktest.assertTrue(constructorDesc !== undefined);
  arktest.assertFalse(constructorDesc.writable);
  arktest.assertFalse(constructorDesc.enumerable);
  arktest.assertTrue(constructorDesc.configurable);

  const nextDesc = Object.getOwnPropertyDescriptor(generatorObjectPrototype,
      'next');
  arktest.assertTrue(nextDesc !== undefined);
  arktest.assertTrue(nextDesc.writable);
  arktest.assertFalse(nextDesc.enumerable);
  arktest.assertTrue(nextDesc.configurable);

  const throwDesc = Object.getOwnPropertyDescriptor(generatorObjectPrototype,
      'throw');
  arktest.assertTrue(throwDesc !== undefined);
  arktest.assertTrue(throwDesc.writable);
  arktest.assertFalse(throwDesc.enumerable);
  arktest.assertTrue(throwDesc.configurable);
}
testGeneratorObjectPrototype();


// This tests the object that would be called "generatorFunction", if it were
// like "Function".
function testGeneratorFunction() {
  arktest.assertEQ(generatorFunctionPrototype, generatorFunction.prototype);
  arktest.assertTrue(g instanceof generatorFunction);

  arktest.assertEQ(Function, Object.getPrototypeOf(generatorFunction));
  arktest.assertTrue(g instanceof Function);

  arktest.assertEQ('function* g() { yield 1; }', g.toString());

  // Not all functions are generators.
  arktest.assertTrue(f instanceof Function);  // Sanity check.
  arktest.assertTrue(!(f instanceof generatorFunction));

  arktest.assertTrue((new generatorFunction()) instanceof generatorFunction);
  arktest.assertTrue(generatorFunction() instanceof generatorFunction);

  // ES6 draft 04-14-15, section 25.2.2.2
  let prototypeDesc = Object.getOwnPropertyDescriptor(generatorFunction,
      'prototype');
  arktest.assertFalse(prototypeDesc.writable);
  arktest.assertFalse(prototypeDesc.enumerable);
  arktest.assertFalse(prototypeDesc.configurable);
}
testGeneratorFunction();


function testPerGeneratorPrototype() {
  arktest.assertTrue((function*(){}).prototype !== (function*(){}).prototype);
  arktest.assertTrue((function*(){}).prototype !== g.prototype);
  arktest.assertEQ(generatorObjectPrototype, Object.getPrototypeOf(g.prototype));
  arktest.assertTrue(!(g.prototype instanceof Function));
  arktest.assertEQ(typeof (g.prototype), 'object');

  arktest.assertEQ([], Object.getOwnPropertyNames(g.prototype));
}
testPerGeneratorPrototype();
