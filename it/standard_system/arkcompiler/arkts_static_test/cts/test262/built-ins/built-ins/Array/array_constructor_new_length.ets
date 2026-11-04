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

// arktsid: array_constructor_new_length
// description: Array constructor (with new) length with no args or at least two args

function main(): void {
    let a: int[] = [];
    arktest.assertEQ(a.length, 0, 'new Array().length is 0');

    let b: int[] = [0, 1, 0, 1];
    arktest.assertEQ(b.length, 4, 'new Array(0,1,0,1).length is 4');
}