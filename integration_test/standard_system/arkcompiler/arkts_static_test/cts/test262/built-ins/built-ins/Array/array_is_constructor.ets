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

// arktsid: array_is_constructor
// description: Array is a constructor — new Array() creates an array instance

function main(): void {
    // Array can be constructed with new
    let a: int[] = [];
    arktest.assertEQ(a.length, 0, 'new Array() creates empty array');

    let b: int[] = [1, 2, 3];
    arktest.assertEQ(b.length, 3, 'new Array(e1, e2, e3) creates array with elements');
    arktest.assertEQ(b[0], 1, 'b[0]');
    arktest.assertEQ(b[1], 2, 'b[1]');
    arktest.assertEQ(b[2], 3, 'b[2]');
}