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

// arktsid: x_before_continue
// description: Shadowed bindings remain correct before continue

function main(): void {
    do {
        let x: int = 4;
        arktest.assertEQ(x, 4);
        {
            let x: int = 5;
            arktest.assertEQ(x, 5);
            continue;
            arktest.assertTrue(false);
        }
    } while (false);
}
