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

// arktsid: embedded_if_else_without_outer_else
// description: Embedded if/else statements are allowed without an outer else

function main(): void {
    let selected: int = 0;
    if (true) {
        if (false) {
            selected = 1;
        } else {
            selected = 2;
        }
    }
    if (true) {
        if (true) {
            selected = 3;
        }
    }
    if (false) {
        selected = 4;
    }
    if (false) {
        selected = 5;
    }
    arktest.assertEQ(selected, 3);
}
