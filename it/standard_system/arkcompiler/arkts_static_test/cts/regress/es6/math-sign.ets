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
expected_out_1: "Semantic error ESE0127: No matching call signature for isNaN(...)"
---*/

arktest.assertEQ('Infinity', String(1/Math.sign(0)));
arktest.assertEQ('-Infinity', String(1/Math.sign(-0)));
arktest.assertEQ(1, Math.sign(100));
arktest.assertEQ(-1, Math.sign(-199));
arktest.assertEQ(1, Math.sign(100.1));
const signStringIsNaN: boolean = Number.isNaN(Math.sign('abc'));
arktest.assertTrue(signStringIsNaN);
const signObjectIsNaN: boolean = Number.isNaN(Math.sign({}));
arktest.assertTrue(signObjectIsNaN);
arktest.assertEQ(0, Math.sign([]));
arktest.assertEQ(1, Math.sign([1]));
arktest.assertEQ(-1, Math.sign([-100.1]));
const signArrayIsNaN: boolean = Number.isNaN(Math.sign([1, 1]));
arktest.assertTrue(signArrayIsNaN);
arktest.assertEQ(1, Math.sign({ toString: function() { return '100'; } }));
arktest.assertEQ(1, Math.sign({ toString: function() { return 100; } }));
arktest.assertEQ(-1, Math.sign({ valueOf: function() { return -1.1; } }));
arktest.assertEQ(-1, Math.sign({ valueOf: function() { return '-1.1'; } }));
arktest.assertEQ(-1, Math.sign(-Infinity));
arktest.assertEQ(1, Math.sign(Infinity));
arktest.assertEQ(-1, Math.sign('-Infinity'));
arktest.assertEQ(1, Math.sign('Infinity'));
