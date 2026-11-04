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

// arktsid: last_index_of_boolean_array_returns_last_match
// description: Array.prototype.lastIndexOf - element to be retrieved is own data property on an Array

function main(): void {
    let a1: boolean[] = [true, true, true];
    let a2: boolean[] = [true, true, false];
    let a3: boolean[] = [true, false, false];
    arktest.assertEQ(a1.lastIndexOf(true), 2, '[true, true, true].lastIndexOf(true)');
    arktest.assertEQ(a2.lastIndexOf(true), 1, '[true, true, false].lastIndexOf(true)');
    arktest.assertEQ(a3.lastIndexOf(true), 0, '[true, false, false].lastIndexOf(true)');
}