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

Object.getOwnPropertyDescriptor(() => {}, 'length');

// Test array functions do not cause infinite loops when length is negative,
// max_value, etc.

// ArrayToString

let o = { length: Number.MIN_VALUE };
let result = Array.prototype.toString.call(o);
arktest.assertEQ('[object Object]', result);

// ArrayToLocaleString

let o = { length: Number.MIN_VALUE };
let result = Array.prototype.toLocaleString.call(o);
arktest.assertEQ('', result);

// ArrayJoin

let o = { length: Number.MIN_VALUE };
let result = Array.prototype.join.call(o);
arktest.assertEQ(0, result.length);

// ArrayPush

let o = { length: Number.MIN_VALUE };
Array.prototype.push.call(o, 1);
arktest.assertEQ(1, o.length);
arktest.assertEQ(1, o[0]);

let o = { length: Number.MAX_VALUE };
arktest.expectThrow(() => Array.prototype.push.call(o, 1), ((e: Error): boolean => e instanceof TypeError));

// ArrayPop

let o = { length: 0 };
Array.prototype.pop.call(o);
arktest.assertEQ(0, o.length);

let o = { length: Number.MIN_VALUE };
Array.prototype.pop.call(o);
arktest.assertEQ(0, o.length);

let o = { length: Number.MAX_VALUE };
Array.prototype.pop.call(o);
arktest.assertEQ(o.length, Number.MAX_SAFE_INTEGER - 1);

// ArrayReverse

let o = { 0: 'foo', length: Number.MIN_VALUE }
let result = Array.prototype.reverse.call(o);
arktest.assertEQ('object', typeof(result));
arktest.assertEQ(Number.MIN_VALUE, result.length);
arktest.assertEQ(Number.MIN_VALUE, o.length);

// ArrayShift

let o = { 0: 'foo', length: Number.MIN_VALUE }
let result = Array.prototype.shift.call(o);
arktest.assertEQ(undefined, result);
arktest.assertEQ(0, o.length);

// ArrayUnshift

let o = { length: 0 };
Array.prototype.unshift.call(o);
arktest.assertEQ(0, o.length);

let o = { length: 0 };
Array.prototype.unshift.call(o, 'foo');
arktest.assertEQ('foo', o[0]);
arktest.assertEQ(1, o.length);

let o = { length: Number.MIN_VALUE };
Array.prototype.unshift.call(o);
arktest.assertEQ(0, o.length);

let o = { length: Number.MIN_VALUE };
Array.prototype.unshift.call(o, 'foo');
arktest.assertEQ('foo', o[0]);
arktest.assertEQ(1, o.length);

// ArraySplice

let o = { length: Number.MIN_VALUE };
Array.prototype.splice.call(o);
arktest.assertEQ(0, o.length);

let o = { length: Number.MIN_VALUE };
Array.prototype.splice.call(o, 0, 10, ['foo']);
arktest.assertEQ(['foo'], o[0]);
arktest.assertEQ(1, o.length);

let o = { length: Number.MIN_VALUE };
Array.prototype.splice.call(o, -1);
arktest.assertEQ(0, o.length);

let o = { length: Number.MAX_SAFE_INTEGER };
Array.prototype.splice.call(o, -1);
arktest.assertEQ(Number.MAX_SAFE_INTEGER - 1, o.length);

// ArraySlice

let o = { length: Number.MIN_VALUE };
let result = Array.prototype.slice.call(o);
arktest.assertEQ(0, result.length);

let o = { length: Number.MIN_VALUE };
let result = Array.prototype.slice.call(o, Number.MAX_VALUE);
arktest.assertEQ(0, result.length);

let o = { length: Number.MAX_VALUE };
let result = Array.prototype.slice.call(o, Number.MAX_VALUE - 1);
arktest.assertEQ(0, result.length);

// ArrayIndexOf

let o = { length: Number.MIN_VALUE };
let result = Array.prototype.indexOf.call(o);
arktest.assertEQ(-1, result);

let o = { length: Number.MAX_SAFE_INTEGER }
o[Number.MAX_SAFE_INTEGER - 1] = 'foo'
let result = Array.prototype.indexOf.call(o,
    'foo', Number.MAX_SAFE_INTEGER - 2);
arktest.assertEQ(Number.MAX_SAFE_INTEGER - 1, result);

let o = { length: Number.MAX_SAFE_INTEGER };
o[Number.MAX_SAFE_INTEGER - 1] = 'foo';
let result = Array.prototype.indexOf.call(o, 'foo', -1);
arktest.assertEQ(Number.MAX_SAFE_INTEGER - 1, result);

// ArrayLastIndexOf

let o = { length: Number.MIN_VALUE };
let result = Array.prototype.lastIndexOf.call(o);
arktest.assertEQ(-1, result);

let o = { length: Number.MAX_SAFE_INTEGER }
o[Number.MAX_SAFE_INTEGER - 1] = 'foo'
let result = Array.prototype.lastIndexOf.call(o,
    'foo', Number.MAX_SAFE_INTEGER);
arktest.assertEQ(Number.MAX_SAFE_INTEGER - 1, result);

let o = { length: Number.MAX_SAFE_INTEGER };
o[Number.MAX_SAFE_INTEGER - 1] = 'foo';
let result = Array.prototype.lastIndexOf.call(o, 'foo', -1);
arktest.assertEQ(Number.MAX_SAFE_INTEGER - 1, result);

// ArrayFilter

const func = function(v) { return v; }

let o = { length: Number.MIN_VALUE };
Array.prototype.filter.call(o, func);
arktest.assertEQ(Number.MIN_VALUE, o.length);

// ArrayForEach

let o = { length: Number.MIN_VALUE };
Array.prototype.forEach.call(o, func);
arktest.assertEQ(Number.MIN_VALUE, o.length);

// ArraySome

let o = { length: Number.MIN_VALUE };
Array.prototype.some.call(o, func);
arktest.assertEQ(Number.MIN_VALUE, o.length);

// ArrayEvery

let o = { length: Number.MIN_VALUE };
Array.prototype.every.call(o, func);
arktest.assertEQ(Number.MIN_VALUE, o.length);

// ArrayMap

let o = { length: Number.MIN_VALUE };
Array.prototype.map.call(o, func);
arktest.assertEQ(Number.MIN_VALUE, o.length);

// ArrayReduce

let o = { length: Number.MIN_VALUE };
Array.prototype.reduce.call(o, func, 0);
arktest.assertEQ(Number.MIN_VALUE, o.length);

// ArrayReduceRight

let o = { length: Number.MIN_VALUE };
Array.prototype.reduceRight.call(o, func, 0);
arktest.assertEQ(Number.MIN_VALUE, o.length);

// ArrayFill

let o = { length: Number.MIN_VALUE };
Array.prototype.fill(o, 0);
arktest.assertEQ(Number.MIN_VALUE, o.length);
