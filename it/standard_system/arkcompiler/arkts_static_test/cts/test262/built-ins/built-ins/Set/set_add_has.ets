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

// arktsid: set_add_has
// description: Set.add stores values (ignores duplicates); Set.has checks membership
// Migrated from test262: built-ins/Set prototype tests

function main(): void {
    let s = new Set<int>();

    // add returns the Set
    s.add(1);
    arktest.assertEQ(s.size, 1);

    // has returns true for existing element
    arktest.assertEQ(s.has(1), true);

    // has returns false for missing element
    arktest.assertEQ(s.has(42), false);

    // add duplicate does not change size
    s.add(1);
    arktest.assertEQ(s.size, 1);

    // add different values
    s.add(2);
    s.add(3);
    arktest.assertEQ(s.size, 3);
    arktest.assertEQ(s.has(2), true);
    arktest.assertEQ(s.has(3), true);
}
