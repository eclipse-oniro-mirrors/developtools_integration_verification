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


// This tests the interaction between the MapIterator protector and SetIterator
// protector.

/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0170: Type 'Map<K,V>' is generic but type argument were not provided."
---*/

const map = new Map([[1,2], [2,3], [3,4]]);
arktest.assertTrue(ArkTools.mapIteratorProtector());

let set = new Set([1,2,3]);
arktest.assertTrue(ArkTools.setIteratorProtector());

// This changes ArkTools.iteratorPrototype%. No more tests should be run after this in
// the same instance.
const iterator = set.keys();
// iterator object --> ArkTools.setIteratorPrototype% --> ArkTools.iteratorPrototype%
iterator.__proto__.__proto__[Symbol.iterator] =
  () => ({next: () => ({done: true})});

arktest.assertFalse(ArkTools.mapIteratorProtector());
arktest.assertEQ([[1,2], [2,3], [3,4]], [...map]);
arktest.assertEQ([], [...map.entries()]);
arktest.assertEQ([], [...map.keys()]);
arktest.assertEQ([], [...map.values()]);

arktest.assertFalse(ArkTools.setIteratorProtector());
arktest.assertEQ([], [...set.entries()]);
arktest.assertEQ([1,2,3], [...set]);
arktest.assertEQ([], [...set.keys()]);
arktest.assertEQ([], [...set.values()]);
arktest.assertEQ([], [...iterator]);
