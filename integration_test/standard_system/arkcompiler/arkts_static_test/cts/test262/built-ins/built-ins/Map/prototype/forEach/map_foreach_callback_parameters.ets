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

// arktsid: map_foreach_callback_parameters
// description: Map.forEach invokes callback with value, key, map
// Conversion notes: test262 B|direct, 1:1 migration.

function main(): void {
    let m = new Map<string, int>();
    m.set('a', 1);
    m.set('b', 2);
    let seen: int = 0;
    m.forEach((value: int, key: string, map: Map<string, int>): void => {
        seen++;
    });
    arktest.assertEQ(seen, 2, 'callback called twice');
}