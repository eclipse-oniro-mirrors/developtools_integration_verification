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

// arktsid: set_delete_clear
// description: Set.delete removes element and returns boolean; Set.clear empties the Set
// Migrated from test262: built-ins/Set prototype delete/clear tests

function main(): void {
    let s = new Set<int>();
    s.add(1);
    s.add(2);
    s.add(3);
    arktest.assertEQ(s.size, 3);

    // delete returns true for existing element
    arktest.assertEQ(s.delete(2), true);
    arktest.assertEQ(s.size, 2);
    arktest.assertEQ(s.has(2), false);

    // delete returns false for non-existing element
    arktest.assertEQ(s.delete(99), false);
    arktest.assertEQ(s.size, 2);

    // clear empties the Set
    s.clear();
    arktest.assertEQ(s.size, 0);
    arktest.assertEQ(s.has(1), false);
}
