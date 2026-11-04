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

// arktsid: map_set_get_has
// description: Map.set stores key-value pairs; Map.get retrieves values; Map.has checks key existence
// Migrated from test262: built-ins/Map prototype tests

function main(): void {
    let m = new Map<string, int>();

    // set returns the Map (enables chaining)
    m.set('a', 1);
    arktest.assertEQ(m.size, 1);

    // get returns stored value
    arktest.assertEQ(m.get('a'), 1);

    // has returns true for existing key
    arktest.assertEQ(m.has('a'), true);

    // get returns undefined for missing key
    arktest.assertEQ(m.get('missing'), undefined);

    // has returns false for missing key
    arktest.assertEQ(m.has('missing'), false);

    // set overwrites existing key
    m.set('a', 100);
    arktest.assertEQ(m.get('a'), 100);
    arktest.assertEQ(m.size, 1); // size unchanged
}