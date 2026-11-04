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

// arktsid: do_while_same_line
// description: Automatic semicolon insertion terminates a do-while statement

function main(): void {
    let x: int = 0;
    do {
        break;
    } while (false);
    x = 42;
    arktest.assertEQ(x, 42);

    x = 0;
    do {
        do {
            do {
            } while (x != 0);
        } while (x != 0);
    } while (x != 0);
    x = 39;
    arktest.assertEQ(x, 39);
}
