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
expected_out_1: "Semantic error ESE0170: Type 'Set<K>' is generic but type argument were not provided."
---*/

const set = new Set([1,2,3]);

arktest.assertEQ([1,2,3], [...set]);
arktest.assertEQ([[1,1],[2,2],[3,3]], [...set.entries()]);
arktest.assertEQ([1,2,3], [...set.keys()]);
arktest.assertEQ([1,2,3], [...set.values()]);
arktest.assertTrue(ArkTools.setIteratorProtector());
arktest.assertTrue(ArkTools.mapIteratorProtector());

set[Symbol.iterator] = () => ({next: () => ({done: true})});

arktest.assertFalse(ArkTools.setIteratorProtector());
arktest.assertTrue(ArkTools.mapIteratorProtector());
arktest.assertEQ([], [...set]);
arktest.assertEQ([[1,1],[2,2],[3,3]], [...set.entries()]);
arktest.assertEQ([1,2,3], [...set.keys()]);
arktest.assertEQ([1,2,3], [...set.values()]);
