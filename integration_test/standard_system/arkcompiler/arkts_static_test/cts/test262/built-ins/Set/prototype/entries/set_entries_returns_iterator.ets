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
// arktsid: set_entries_returns_iterator
// description: Set.prototype.entries returns an iterator yielding [value, value] pairs in insertion order

function main(): void {
    let s = new Set<int>([1, 2, 3]);
    let it = s.entries();
    let r1 = it.next();
    arktest.assertTrue(r1.done === false, 'first not done');
    let p1: [int, int] | undefined = r1.value;
    if (p1 !== undefined) {
        arktest.assertEQ(p1[0], 1, 'first key');
        arktest.assertEQ(p1[1], 1, 'first value');
    }
    let r2 = it.next();
    let p2: [int, int] | undefined = r2.value;
    if (p2 !== undefined) {
        arktest.assertEQ(p2[0], 2, 'second key');
    }
    it.next();
    let r4 = it.next();
    arktest.assertTrue(r4.done === true, 'fourth done after exhaustion');
}