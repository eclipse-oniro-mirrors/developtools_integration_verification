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
// arktsid: map_foreach_added_values_visited
// description: New keys added during forEach execution are visited by the iteration
// Conversion notes: Dynamic result objects replaced with typed arrays for tracking.

function main(): void {
    let m = new Map<string, int>();
    m.set('foo', 0);
    m.set('bar', 1);

    let count: int = 0;
    let keys: string[] = [];
    let vals: int[] = [];

    m.forEach((value: int, key: string): void => {
        if (count === 0) {
            m.set('baz', 2);
        }
        keys.push(key);
        vals.push(value);
        count++;
    });

    arktest.assertEQ(count, 3, 'all three entries visited');
    arktest.assertEQ(m.size, 3);

    arktest.assertEQ(keys[0], 'foo');
    arktest.assertEQ(vals[0], 0);
    arktest.assertEQ(keys[1], 'bar');
    arktest.assertEQ(vals[1], 1);
    arktest.assertEQ(keys[2], 'baz');
    arktest.assertEQ(vals[2], 2);
}