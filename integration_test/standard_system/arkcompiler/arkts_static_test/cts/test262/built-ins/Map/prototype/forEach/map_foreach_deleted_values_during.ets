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
// arktsid: map_foreach_deleted_values_during
// description: Map state with deleted values during forEach — deleted entry is not visited
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
            m.delete('bar');
        }
        keys.push(key);
        vals.push(value);
        count++;
    });

    arktest.assertEQ(keys.length, 1, 'only one entry visited');
    arktest.assertEQ(keys[0], 'foo');
    arktest.assertEQ(vals[0], 0);
}