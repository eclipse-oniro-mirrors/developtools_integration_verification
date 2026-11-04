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

// arktsid: S11.9.5_A4.1_T1
// description: If x is NaN, strict inequality x !== y is true for any double y

function main(): void {
    let nan: double = Number.NaN;
    arktest.assertEQ(nan !== 1.0, true);
    arktest.assertEQ(nan !== nan, true);
    arktest.assertEQ(nan !== Number.POSITIVE_INFINITY, true);
    arktest.assertEQ(nan !== Number.NEGATIVE_INFINITY, true);
    arktest.assertEQ(nan !== Number.MAX_VALUE, true);
    arktest.assertEQ(nan !== Number.MIN_VALUE, true);
}
