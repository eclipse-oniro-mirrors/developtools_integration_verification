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

// arktsid: for_of_parenthesized_lhs
// description: A parenthesized identifier may be the left-hand side of for-of

function main(): void {
    let x: int = 0;
    let count: int = 0;
    for ((x) of [23]) {
        arktest.assertEQ(x, 23);
        ++count;
    }
    arktest.assertEQ(count, 1);
}
