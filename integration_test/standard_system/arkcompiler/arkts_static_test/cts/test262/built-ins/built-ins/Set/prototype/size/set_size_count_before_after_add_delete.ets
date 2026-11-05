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

// arktsid: set_size_count_before_after_add_delete
// description: Set.size reflects add and delete
// Conversion notes: test262 B|direct, 1:1 migration.

function main(): void {
    let s = new Set<int>();
    arktest.assertEQ(s.size, 0, 'initial size 0');
    s.add(1);
    s.add(2);
    arktest.assertEQ(s.size, 2, 'after add size 2');
    s.delete(1);
    arktest.assertEQ(s.size, 1, 'after delete size 1');
}