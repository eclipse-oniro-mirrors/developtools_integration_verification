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

// arktsid: try_statement_without_exception
// description: A try statement without an exception executes its try and finally blocks

function main(): void {
    let first: int = 0;
    try {
        first = 1;
    } catch (e) {
        arktest.assertTrue(false);
    }
    arktest.assertEQ(first, 1);

    let second: int = 0;
    try {
        second = 1;
    } finally {
        second = 2;
    }
    arktest.assertEQ(second, 2);

    let third: int = 0;
    try {
        third = 1;
    } catch (e) {
        arktest.assertTrue(false);
    } finally {
        third = 2;
    }
    arktest.assertEQ(third, 2);
}
