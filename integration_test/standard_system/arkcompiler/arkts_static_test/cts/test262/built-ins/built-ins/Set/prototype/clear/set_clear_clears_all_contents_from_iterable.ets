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
// arktsid: set_clear_clears_all_contents_from_iterable
// description: Set.prototype.clear removes all entries added from the iterable constructor

function main(): void {
    let s = new Set<int>([1, 2, 3]);
    arktest.assertEQ(s.size, 3, 'size before clear');
    let result = s.clear();
    arktest.assertEQ(s.size, 0, 'size after clear');
    arktest.assertTrue(s.has(1) === false, 'has(1) false after clear');
    arktest.assertTrue(s.has(2) === false, 'has(2) false after clear');
    arktest.assertTrue(s.has(3) === false, 'has(3) false after clear');
}