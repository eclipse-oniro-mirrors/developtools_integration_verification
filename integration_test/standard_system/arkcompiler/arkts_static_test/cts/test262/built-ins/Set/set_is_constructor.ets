/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
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

// arktsid: set_is_constructor
// description: Set is a constructor — new Set() creates a Set instance

function main(): void {
    // Set can be constructed with new (empty)
    let s: Set<int> = new Set<int>();
    arktest.assertEQ(s.size, 0, 'new Set() creates empty Set');

    // Set can be constructed with new (initial values)
    let s2: Set<int> = new Set<int>([1, 2, 3]);
    arktest.assertEQ(s2.size, 3, 'new Set([...]) creates Set with elements');
    arktest.assertTrue(s2.has(1), 'Set has element 1');
    arktest.assertTrue(s2.has(2), 'Set has element 2');
    arktest.assertTrue(s2.has(3), 'Set has element 3');
}