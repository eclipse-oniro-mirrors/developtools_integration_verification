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

// This file only tests very simple descriptors that always have
// configurable, enumerable, and writable set to true.

// This is adapted from mjsunit/get-own-property-descriptor.js.

/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0143: Unresolved reference x"
---*/

function get() { return x; }
function set(x) { this.x = x; }

const obj = {x: 1};
obj.__defineGetter__('accessor', get);
obj.__defineSetter__('accessor', set);
let a = [];
a[1] = 42;
obj[1] = 42;

const descIsData = Reflect.getOwnPropertyDescriptor(obj, 'x');
arktest.assertTrue(descIsData.enumerable);
arktest.assertTrue(descIsData.writable);
arktest.assertTrue(descIsData.configurable);

const descIsAccessor = Reflect.getOwnPropertyDescriptor(obj, 'accessor');
arktest.assertTrue(descIsAccessor.enumerable);
arktest.assertTrue(descIsAccessor.configurable);
arktest.assertTrue(descIsAccessor.get == get);
arktest.assertTrue(descIsAccessor.set == set);

const descIsNotData = Reflect.getOwnPropertyDescriptor(obj, 'not-x');
arktest.assertTrue(descIsNotData == undefined);

const descIsNotAccessor = Reflect.getOwnPropertyDescriptor(obj, 'not-accessor');
arktest.assertTrue(descIsNotAccessor == undefined);

const descArray = Reflect.getOwnPropertyDescriptor(a, '1');
arktest.assertTrue(descArray.enumerable);
arktest.assertTrue(descArray.configurable);
arktest.assertTrue(descArray.writable);
arktest.assertEQ(descArray.value, 42);

const descObjectElement = Reflect.getOwnPropertyDescriptor(obj, '1');
arktest.assertTrue(descObjectElement.enumerable);
arktest.assertTrue(descObjectElement.configurable);
arktest.assertTrue(descObjectElement.writable);
arktest.assertEQ(descObjectElement.value, 42);

// String objects.
let a = Object('foobar');
for (let i = 0; i < a.length; i++) {
  const descStringObject = Reflect.getOwnPropertyDescriptor(a, i);
  arktest.assertTrue(descStringObject.enumerable);
  arktest.assertFalse(descStringObject.configurable);
  arktest.assertFalse(descStringObject.writable);
  arktest.assertEQ(descStringObject.value, a.substring(i, i+1));
}

// Support for additional attributes on string objects.
a.x = 42;
a[10] = 'foo';
const descStringProperty = Reflect.getOwnPropertyDescriptor(a, 'x');
arktest.assertTrue(descStringProperty.enumerable);
arktest.assertTrue(descStringProperty.configurable);
arktest.assertTrue(descStringProperty.writable);
arktest.assertEQ(descStringProperty.value, 42);

const descStringElement = Reflect.getOwnPropertyDescriptor(a, '10');
arktest.assertTrue(descStringElement.enumerable);
arktest.assertTrue(descStringElement.configurable);
arktest.assertTrue(descStringElement.writable);
arktest.assertEQ(descStringElement.value, 'foo');

// Test that elements in the prototype chain is not returned.
let proto = {};
proto[10] = 42;

const objWithProto = [];
objWithProto.prototype = proto;
objWithProto[0] = 'bar';
const descWithProto = Reflect.getOwnPropertyDescriptor(objWithProto, '10');
arktest.assertEQ(undefined, descWithProto);

// Test elements on global proxy object.
const global = (function() { return this; })();

global[42] = 42;

function elGetter() { return 239; };
function elSetter() {};
Object.defineProperty(global, '239', {get: elGetter, set: elSetter});

const descRegularElement = Reflect.getOwnPropertyDescriptor(global, '42');
arktest.assertEQ(42, descRegularElement.value);

const descAccessorElement = Reflect.getOwnPropertyDescriptor(global, '239');
arktest.assertEQ(elGetter, descAccessorElement.get);
arktest.assertEQ(elSetter, descAccessorElement.set);
