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

// arktsid: indexof_boolean_returns_first_match
// description: Array.prototype.indexOf - element to be retrieved is own data property on an Array

function main(): void {
    let a: boolean[] = [true, true, true];
    let b: boolean[] = [false, true, true];
    let c: boolean[] = [false, false, true];
    arktest.assertEQ(a.indexOf(true), 0, '[true, true, true].indexOf(true)');
    arktest.assertEQ(b.indexOf(true), 1, '[false, true, true].indexOf(true)');
    arktest.assertEQ(c.indexOf(true), 2, '[false, false, true].indexOf(true)');
}