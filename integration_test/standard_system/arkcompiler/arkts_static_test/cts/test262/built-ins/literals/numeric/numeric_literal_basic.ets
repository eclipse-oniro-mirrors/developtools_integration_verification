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
// arktsid: numeric_literal_basic
// description: Integer, hex, octal, binary, and float numeric literals

function main(): void {
    // Integer literals
    arktest.assertEQ(0, 0);
    arktest.assertEQ(42, 42);
    arktest.assertEQ(-1, -1);

    // Hex literals
    arktest.assertEQ(0xFF, 255);
    arktest.assertEQ(0x10, 16);

    // Float literals
    let d: double = 3.14;
    arktest.assertTrue(d > 3.13);
    arktest.assertTrue(d < 3.15);

    let neg: double = -0.5;
    arktest.assertTrue(neg < 0.0);
}
