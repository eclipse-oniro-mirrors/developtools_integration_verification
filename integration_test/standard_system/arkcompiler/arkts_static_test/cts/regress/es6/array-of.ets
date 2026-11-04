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
expected_out_1: "Semantic error ESE655063: Generic function of requires explicit type arguments when used as a value."
---*/

let of = Array.of;


// Based on Mozilla Array.of() tests at http://dxr.mozilla.org/mozilla-central/source/js/src/jit-test/tests/collections



// Array.of makes real arrays.

function check(a) {
    arktest.assertEQ(Object.getPrototypeOf(a), Array.prototype);
    arktest.assertEQ(Array.isArray(a), true);
    a[9] = 9;
    arktest.assertEQ(a.length, 10);
}


check(Array.of());
check(Array.of(0));
check(Array.of(0, 1, 2));
const f = Array.of;
check(f());


// Array.of basics

let a = Array.of();

arktest.assertEQ(a.length, 0);
a = Array.of(undefined, null, 3.14, []);
arktest.assertEQ(a, [undefined, null, 3.14, []]);
a = [];
for (let i = 0; i < 1000; i++) {
    a[i] = i;
    }
arktest.assertEQ(Array.of.apply(null, a), a);


// Array.of does not leave holes

arktest.assertEQ(Array.of(undefined), [undefined]);
arktest.assertEQ(Array.of(undefined, undefined), [undefined, undefined]);
arktest.assertEQ(Array.of.apply(null, [,,undefined]), [undefined, undefined, undefined]);
arktest.assertEQ(Array.of.apply(null, Array(4)), [undefined, undefined, undefined, undefined]);


// Array.of can be transplanted to other classes.

let hits = 0;
function Bag() {
    hits++;
}
Bag.of = Array.of;

hits = 0;
let actual = Bag.of('zero', 'one');
arktest.assertEQ(hits, 1);

hits = 0;
const expected = new Bag;
expected[0] = 'zero';
expected[1] = 'one';
expected.length = 2;
arktest.assertEQ(areSame(actual, expected), true);

hits = 0;
actual = Array.of.call(Bag, 'zero', 'one');
arktest.assertEQ(hits, 1);
arktest.assertEQ(areSame(actual, expected), true);

function areSame(object, array) {
    let result = object.length == array.length;
    for (let i = 0; i < object.length; i++) {
        result = result && object[i] == array[i];
    }
    return result;
}


// Array.of does not trigger prototype setters.
// (It defines elements rather than assigning to them.)

let status = 'pass';
Object.defineProperty(Array.prototype, '0', {set: function(v) {status = 'FAIL 1'}});
arktest.assertEQ(Array.of(1)[0], 1);
arktest.assertEQ(status, 'pass');

Object.defineProperty(Bag.prototype, '0', {set: function(v) {status = 'FAIL 2'}});
arktest.assertEQ(Bag.of(1)[0], 1);
arktest.assertEQ(status, 'pass');


// Array.of passes the number of arguments to the constructor it calls.

let hits = 0;

function herd(n) {
    arktest.assertEQ(arguments.length, 1);
    arktest.assertEQ(n, 5);
    hits++;
}

herd.of = Array.of;
herd.of('sheep', 'cattle', 'elephants', 'whales', 'seals');
arktest.assertEQ(hits, 1);


// Array.of calls a "length" setter if one is present.

let hits = 0;
let lastObj = null;
let lastVal = undefined;
function setter(v) {
    hits++;
    lastObj = this;
    lastVal = v;
}

// when the setter is on the new object
function pack() {
    Object.defineProperty(this, 'length', {set: setter});
}
pack.of = Array.of;
const pack = pack.of('wolves', 'cards', 'cigarettes', 'lies');
arktest.assertEQ(lastObj, pack);
arktest.assertEQ(lastVal, 4);

// when the setter is on the new object's prototype
function bevy() {}
Object.defineProperty(bevy.prototype, 'length', {set: setter});
bevy.of = Array.of;
const bevy = bevy.of('quail');
arktest.assertEQ(lastObj, bevy);
arktest.assertEQ(lastVal, 1);


// Array.of does a strict assignment to the new object's .length.
// The assignment is strict even if the code we're calling from is not strict.

function Empty() {}
Empty.of = Array.of;
Object.defineProperty(Empty.prototype, 'length', {get: function() { return 0; }});

const nothing = new Empty;
nothing.length = 2;  // no exception; this is not a strict mode assignment

arktest.expectThrow(function() { Empty.of(); }, ((e: Error): boolean => e instanceof TypeError));


// Check superficial features of Array.of.

const desc = Object.getOwnPropertyDescriptor(Array, 'of');

arktest.assertEQ(desc.configurable, true);
arktest.assertEQ(desc.enumerable, false);
arktest.assertEQ(desc.writable, true);
arktest.assertEQ(Array.of.length, 0);
arktest.expectThrow(
  function() { new Array.of() },
  ((e: Error): boolean => e instanceof TypeError)
);  // not a constructor

// When the this-value passed in is not a constructor, the result is an array.
[
  undefined,
  null,
  false,
  'cow',
  NaN,
  67,
  Infinity,
  -Infinity,
  Math.cos, // builtin functions with no [[Construct]] slot
  Math.cos.bind(Math) // bound builtin functions with no [[Construct]] slot
].forEach(function(val) {
    arktest.assertEQ(Array.isArray(Array.of.call(val, val)), true);
});


(function testBoundConstructor() {
  const boundFn = (function() {}).bind(null);
  const instance = Array.of.call(boundFn, 1, 2, 3);
  arktest.assertEQ(instance.length, 3);
  arktest.assertEQ(instance instanceof boundFn, true);
  arktest.assertEQ(Array.isArray(instance), false);
})();

(function testDefinesOwnProperty() {
  // Assert that [[DefineOwnProperty]] is used in ArrayFrom, meaning a
  // setter isn't called, and a failed [[DefineOwnProperty]] will throw.
  let setterCalled = 0;
  function exotic() {
    Object.defineProperty(this,  '0', {
      get: function() { return 2; },
      set: function() { setterCalled++; }
    });
  }
  // Non-configurable properties can't be overwritten with DefineOwnProperty
  arktest.expectThrow(function () { Array.of.call(exotic, 1); }, ((e: Error): boolean => e instanceof TypeError));
  // The setter wasn't called
  arktest.assertEQ(0, setterCalled);

  // Check that array properties defined are writable, enumerable, configurable
  function ordinary() { }
  const x = Array.of.call(ordinary, 2);
  const xlength = Object.getOwnPropertyDescriptor(x, 'length');
  arktest.assertEQ(1, xlength.value);
  arktest.assertEQ(true, xlength.writable);
  arktest.assertEQ(true, xlength.enumerable);
  arktest.assertEQ(true, xlength.configurable);
  const x0 = Object.getOwnPropertyDescriptor(x, 0);
  arktest.assertEQ(2, x0.value);
  arktest.assertEQ(true, xlength.writable);
  arktest.assertEQ(true, xlength.enumerable);
  arktest.assertEQ(true, xlength.configurable);
})();

(function testElementsKind() {
  // Check that Array.of returns PACKED elements.
  let arr = Array.of(1, 2, 3);
  arktest.assertTrue(ArkTools.hasFastPackedElements(arr));
  arktest.assertTrue(ArkTools.hasSmiElements(arr));

  let arr = Array.of(1, 2.5, 3);
  arktest.assertTrue(ArkTools.hasFastPackedElements(arr));
  arktest.assertTrue(ArkTools.hasDoubleElements(arr));

  const arr = Array.of.call(Array, Array(65536));
  arktest.assertTrue(ArkTools.hasFastPackedElements(arr));
  arktest.assertTrue(ArkTools.hasObjectElements(arr));
})();
