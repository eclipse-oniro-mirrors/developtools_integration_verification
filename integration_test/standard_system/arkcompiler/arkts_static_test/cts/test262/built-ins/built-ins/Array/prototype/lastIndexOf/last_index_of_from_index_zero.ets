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

// arktsid: last_index_of_from_index_zero
// description: Array.prototype.lastIndexOf - value of 'fromIndex' is a number (value is 0)

function main(): void {
    let a1: int[] = [0, 100];
    let a2: int[] = [200, 0];
    arktest.assertEQ(a1.lastIndexOf(100, 0), -1, 'verify fromIndex is not more than 0');
    arktest.assertEQ(a2.lastIndexOf(200, 0), 0, 'verify fromIndex is not less than 0');
}