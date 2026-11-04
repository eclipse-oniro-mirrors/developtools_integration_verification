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
// arktsid: map_is_constructor
// description: Map is a constructor — new Map() creates a Map instance

function main(): void {
    // Map can be constructed with new
    let m: Map<string, int> = new Map<string, int>();
    arktest.assertEQ(m.size, 0, 'new Map() creates empty Map');

    let entries: [string, int][] = [['a', 1], ['b', 2]];
    let m2: Map<string, int> = new Map<string, int>(entries);
    arktest.assertEQ(m2.size, 2, 'new Map(entries) creates Map with entries');
    arktest.assertEQ(m2.get('a'), 1, 'entry a');
    arktest.assertEQ(m2.get('b'), 2, 'entry b');
}