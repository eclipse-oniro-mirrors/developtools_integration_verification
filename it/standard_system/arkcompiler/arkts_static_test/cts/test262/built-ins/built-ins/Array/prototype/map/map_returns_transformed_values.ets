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

// arktsid: map_returns_transformed_values
// description: Array.prototype.map returns new Array with values the result of callbackfn

function main(): void {
    let src: int[] = [1, 2, 3, 4, 5];
    let res: int[] = src.map((val: int): int => { return val + 10; });
    arktest.assertEQ(res[0], 11, 'res[0]');
    arktest.assertEQ(res[1], 12, 'res[1]');
    arktest.assertEQ(res[2], 13, 'res[2]');
    arktest.assertEQ(res[3], 14, 'res[3]');
    arktest.assertEQ(res[4], 15, 'res[4]');
}