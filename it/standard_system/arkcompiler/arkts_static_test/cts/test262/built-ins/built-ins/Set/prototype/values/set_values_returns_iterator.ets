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
// arktsid: set_values_returns_iterator
// description: Set.prototype.values returns an iterator yielding values in insertion order

function main(): void {
    let s = new Set<int>([1, 2, 3]);
    let it = s.values();
    let r1 = it.next();
    arktest.assertTrue(r1.done === false, 'first not done');
    arktest.assertEQ(r1.value, 1, 'first value');
    let r2 = it.next();
    arktest.assertEQ(r2.value, 2, 'second value');
    let r3 = it.next();
    arktest.assertEQ(r3.value, 3, 'third value');
    let r4 = it.next();
    arktest.assertTrue(r4.done === true, 'fourth done after exhaustion');
}