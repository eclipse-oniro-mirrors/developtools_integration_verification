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

// arktsid: map_delete_clear
// description: Map.delete removes entry and returns boolean; Map.clear empties the Map
// Migrated from test262: built-ins/Map prototype delete/clear tests

function main(): void {
    let m = new Map<string, int>();
    m.set('a', 1);
    m.set('b', 2);
    m.set('c', 3);
    arktest.assertEQ(m.size, 3);

    // delete returns true for existing key
    arktest.assertEQ(m.delete('b'), true);
    arktest.assertEQ(m.size, 2);
    arktest.assertEQ(m.has('b'), false);

    // delete returns false for non-existing key
    arktest.assertEQ(m.delete('nonexistent'), false);
    arktest.assertEQ(m.size, 2);

    // clear empties the Map
    m.clear();
    arktest.assertEQ(m.size, 0);
    arktest.assertEQ(m.has('a'), false);
}