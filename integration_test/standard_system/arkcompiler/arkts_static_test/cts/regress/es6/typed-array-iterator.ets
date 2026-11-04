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
expected_out_1: "Syntax error ESY0318: Class cannot be used as object."
---*/

let constructors = [Uint8Array, Int8Array,
                    Uint16Array, Int16Array,
                    Uint32Array, Int32Array,
                    Float32Array, Float64Array,
                    Uint8ClampedArray];

const typedArrayPrototype = Uint8Array.prototype.__proto__;

arktest.assertTrue(typedArrayPrototype.hasOwnProperty('entries'));
arktest.assertTrue(typedArrayPrototype.hasOwnProperty('values'));
arktest.assertTrue(typedArrayPrototype.hasOwnProperty('keys'));
arktest.assertTrue(typedArrayPrototype.hasOwnProperty(Symbol.iterator));

arktest.assertFalse(typedArrayPrototype.propertyIsEnumerable('entries'));
arktest.assertFalse(typedArrayPrototype.propertyIsEnumerable('values'));
arktest.assertFalse(typedArrayPrototype.propertyIsEnumerable('keys'));
arktest.assertFalse(typedArrayPrototype.propertyIsEnumerable(Symbol.iterator));

arktest.assertFalse(Array.prototype.entries === typedArrayPrototype.entries);
arktest.assertFalse(Array.prototype[Symbol.iterator] === typedArrayPrototype.values);
arktest.assertFalse(Array.prototype.keys === typedArrayPrototype.keys);
arktest.assertFalse(Array.prototype[Symbol.iterator] === typedArrayPrototype[Symbol.iterator]);
