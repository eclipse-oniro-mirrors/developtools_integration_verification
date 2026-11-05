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

// arktsid: map_constructor
// description: Map constructor creates empty Map; with iterable initializes entries
// Migrated from test262: built-ins/Map constructor tests

function main(): void {
    // Empty Map
    let m1 = new Map<string, int>();
    arktest.assertEQ(m1.size, 0);

    // Map from array of entries
    let entries: [string, int][] = [['a', 1], ['b', 2], ['c', 3]];
    let m2 = new Map<string, int>(entries);
    arktest.assertEQ(m2.size, 3);
}