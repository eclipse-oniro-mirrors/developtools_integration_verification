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

// arktsid: for_update_expressions
// description: For-loop update expressions support increment, multiplication, division, and decrement

function main(): void {
    {
        let i: int = 0;
        for (i = 0; i < 10; ++i) {
        }
        arktest.assertEQ(i, 10);
    }

    {
        let i: int = 1;
        let j: int = 0;
        for (i = 1; i < 10; i *= 2) {
            ++j;
        }
        arktest.assertEQ(i, 16);
        arktest.assertEQ(j, 4);
    }

    {
        let i: double = 16.0;
        let j: int = 0;
        for (i = 16.0; i > 1.0; i = i / 2.0) {
            ++j;
        }
        arktest.assertEQ(i, 1.0);
        arktest.assertEQ(j, 4);
    }

    {
        let i: int = 10;
        let j: int = 0;
        for (i = 10; i > 1; --i) {
            ++j;
        }
        arktest.assertEQ(i, 1);
        arktest.assertEQ(j, 9);
    }

    {
        let i: int = 2;
        let j: int = 0;
        for (i = 2; i < 10; i *= i) {
            ++j;
        }
        arktest.assertEQ(i, 16);
        arktest.assertEQ(j, 2);
    }
}
