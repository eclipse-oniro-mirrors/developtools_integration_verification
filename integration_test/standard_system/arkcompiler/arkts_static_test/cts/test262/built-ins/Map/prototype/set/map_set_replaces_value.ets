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

// arktsid: map_set_replaces_value
// description: Map.set replaces an existing value
// Conversion notes: test262 B|direct, 1:1 migration.

function main(): void {
    let m = new Map<string, int>();
    m.set('item', 1);
    m.set('item', 42);
    arktest.assertEQ(m.get('item'), 42, 'replaced value');
    arktest.assertEQ(m.size, 1, 'size unchanged');
}