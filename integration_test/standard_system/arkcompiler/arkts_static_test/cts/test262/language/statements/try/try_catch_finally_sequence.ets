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

// arktsid: try_catch_finally_sequence
// description: try, catch, and finally execute in the specified sequence

function main(): void {
    let first: int = 0;
    try {
        first += 1;
        throw new Error('first');
    } catch (e) {
        first *= 2;
    }
    arktest.assertEQ(first, 2);

    let second: int = 0;
    try {
        second += 1;
    } finally {
        second *= 2;
    }
    arktest.assertEQ(second, 2);

    let third: int = 0;
    try {
        third = 1;
        throw new Error('third');
    } catch (e) {
        third *= 2;
    } finally {
        third += 1;
    }
    arktest.assertEQ(third, 3);

    let fourth: int = 0;
    try {
        fourth = 1;
    } catch (e) {
        fourth *= 3;
    } finally {
        fourth += 1;
    }
    arktest.assertEQ(fourth, 2);
}
