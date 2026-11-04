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

// arktsid: set_foreach_iterates_in_insertion_order
// description: Set.forEach iterates in insertion order
// Conversion notes: test262 B|direct, 1:1 migration.

function main(): void {
    let s = new Set<string>();
    s.add('a');
    s.add('b');
    let seen: string[] = [];
    s.forEach((v: string): void => {
        seen.push(v);
    });
    arktest.assertEQ(seen.length, 2, 'two values');
    arktest.assertEQ(seen[0], 'a', 'a first');
    arktest.assertEQ(seen[1], 'b', 'b second');
}