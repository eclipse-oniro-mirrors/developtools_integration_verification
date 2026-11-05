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

// arktsid: set_add_will_not_add_duplicate_entry_normalizes_zero
// description: Set.add normalizes -0 and +0
// Conversion notes: test262 B|direct, 1:1 migration.

function main(): void {
    let s = new Set<int>();
    s.add(0);
    s.add(0);
    arktest.assertEQ(s.size, 1, 'zero normalized to one entry');
}