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
// arktsid: map_foreach_deleted_then_readded
// description: Deleted and then re-added entry during forEach is visited (at its new position)
// Conversion notes: verification that delete+re-add is a new logical entry iterated at new position.

function main(): void {
    let m = new Map<string, string>();
    m.set('foo', 'a');
    m.set('bar', 'b');

    let count: int = 0;
    let keys: string[] = [];
    let vals: string[] = [];

    m.forEach((value: string, key: string): void => {
        if (count === 0) {
            m.delete('foo');
            m.set('foo', 'baz');
        }
        keys.push(key);
        vals.push(value);
        count++;
    });

    arktest.assertEQ(count, 3, 'three iterations: foo, bar, re-added foo');
    arktest.assertEQ(m.size, 2);

    arktest.assertEQ(keys[0], 'foo');
    arktest.assertEQ(vals[0], 'a');
    arktest.assertEQ(keys[1], 'bar');
    arktest.assertEQ(vals[1], 'b');
    arktest.assertEQ(keys[2], 'foo');
    arktest.assertEQ(vals[2], 'baz');
}