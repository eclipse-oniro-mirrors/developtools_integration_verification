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

// arktsid: pop_empty_returns_undefined
// description: If length is zero, pop returns undefined and length stays 0

function main(): void {
    let x: int[] = [];
    let r: int | undefined = x.pop();
    arktest.assertTrue(r === undefined, 'pop on empty returns undefined');
    arktest.assertEQ(x.length, 0, 'length stays 0');

    let y: int[] = [1, 2, 3];
    y.length = 0;
    let r2: int | undefined = y.pop();
    arktest.assertTrue(r2 === undefined, 'pop on length-0 array returns undefined');
    arktest.assertEQ(y.length, 0, 'y.length stays 0');
}