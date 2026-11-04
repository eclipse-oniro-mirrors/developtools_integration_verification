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


// Tests for spreading primitive strings.

/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0143: Unresolved reference ArkTools"
---*/

arktest.assertEQ([...''].length, 0);

let str = 'ott';
arktest.assertEQ(['o', 't', 't'], [...str]);
const initialStringIteratorProtector: boolean = ArkTools.stringIteratorProtector();
arktest.assertTrue(initialStringIteratorProtector);

str[Symbol.iterator] = {};
// Symbol.iterator can't be set on primitive strings, so it shouldn't invalidate
// the protector.
arktest.assertTrue(ArkTools.stringIteratorProtector());

// This changes the String Iterator prototype. No more tests should be run after
// this in the same instance.
const iterator = str[Symbol.iterator]();
iterator.__proto__.next = () => ({value : undefined, done : true});

arktest.assertFalse(ArkTools.stringIteratorProtector());
arktest.assertEQ([], [...str]);
