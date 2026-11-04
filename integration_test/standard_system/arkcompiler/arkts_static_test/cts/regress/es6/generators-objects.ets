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


// Test instantations of generators.

// Generators shouldn't allocate stack slots.  This test will abort in debug
// mode if generators have stack slots.

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0135: Nested functions are not allowed."
---*/

function testContextAllocation() {
  function* g1(a, b, c) { yield 1; return [a, b, c]; }
  function* g2() { yield 1; return arguments; }
  function* g3() { yield 1; return this; }
  function* g4() { const x = 10; yield 1; return x; }
  // Temporary variable context allocation
  function* g5(l) { 'use strict'; yield 1; for (let x in l) { yield x; } }

  g1();
  g2();
  g3();
  g4();
  g5(['foo']);
}
testContextAllocation();


// Test the properties and prototype of a generator object.
function testGeneratorObject() {
  function* G() { yield 1; }

  let iter = G();
  arktest.assertEQ(G.prototype, Object.getPrototypeOf(iter));
  arktest.assertTrue(iter instanceof G);
  arktest.assertEQ('[object Generator]', String(iter));
  arktest.assertEQ([], Object.getOwnPropertyNames(iter));
  arktest.assertTrue(iter !== G());
  arktest.assertEQ('[object Generator]', Object.prototype.toString.call(iter));
  const gf = iter.__proto__.constructor;
  arktest.assertEQ('[object GeneratorFunction]', Object.prototype.toString.call(gf));

  // generators are not constructable.
  arktest.expectThrow(()=>new G());
}
testGeneratorObject();


// Test the methods of generator objects.
function testGeneratorObjectMethods() {
  function* g() { yield 1; }
  let iter = g();

  function testNonGenerator(nonGenerator) {
    arktest.expectThrow(function() { iter.next.call(nonGenerator); }, ((e: Error): boolean => e instanceof TypeError));
    arktest.expectThrow(
      function() { iter.next.call(nonGenerator, 1); },
      ((e: Error): boolean => e instanceof TypeError)
    );
    arktest.expectThrow(
      function() { iter.throw.call(nonGenerator, 1); },
      ((e: Error): boolean => e instanceof TypeError)
    );
  }

  testNonGenerator(1);
  testNonGenerator({});
  testNonGenerator(function(){});
  testNonGenerator(g);
  testNonGenerator(g.prototype);
}
testGeneratorObjectMethods();


function testPrototype() {
  function* g() { }

  let gPrototype = g.prototype;
  arktest.assertEQ([], Reflect.ownKeys(gPrototype));

  let generatorPrototype = Object.getPrototypeOf(gPrototype);
  arktest.assertEQ(generatorPrototype, Object.getPrototypeOf(g).prototype);

  arktest.assertEQ(gPrototype, Object.getPrototypeOf(g()));

  // Custom object as .prototype
  {
    let proto = {};
    g.prototype = proto;
    arktest.assertEQ(proto, Object.getPrototypeOf(g()));
  }

  // Custom non-object as .prototype
  g.prototype = null;
  arktest.assertEQ(generatorPrototype, Object.getPrototypeOf(g()));
}
testPrototype();


function testComputedPropertyNames() {
  function* f1() { return {[yield]: 42} }
  let g1 = f1();
  g1.next();
  arktest.assertEQ(42, g1.next('a').value.a);

  function* f2() { return {['a']: yield} }
  let g2 = f2();
  g2.next();
  arktest.assertEQ(42, g2.next(42).value.a);
}
testComputedPropertyNames();
