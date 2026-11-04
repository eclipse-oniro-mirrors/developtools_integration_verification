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

// arktsid: s7_9_2_a1_t7
// description: A line break before a call expression does not insert a semicolon

function c(a: int): int {
    return 2 * a;
}

function main(): void {
    let a: int = 1;
    let b: int = 2;
    let d: int = 4;
    let e: int = 5;
    a = b + c(
        d + e
    );
    arktest.assertEQ(a, 20);
}
