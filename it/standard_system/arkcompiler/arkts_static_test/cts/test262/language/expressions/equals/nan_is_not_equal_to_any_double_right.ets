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

// arktsid: S11.9.1_A4.1_T2
// description: If y is NaN, loose equality x == y is false for any double x

function main(): void {
    let nan: double = Number.NaN;
    arktest.assertEQ(1.0 == nan, false);
    arktest.assertEQ(-1.0 == nan, false);
    arktest.assertEQ(nan == nan, false);
    arktest.assertEQ(Number.POSITIVE_INFINITY == nan, false);
    arktest.assertEQ(Number.NEGATIVE_INFINITY == nan, false);
    arktest.assertEQ(Number.MAX_VALUE == nan, false);
    arktest.assertEQ(Number.MIN_VALUE == nan, false);
}
