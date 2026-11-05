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

// arktsid: break_label_from_catch
// description: A labelled break in a for-of catch block exits the outer loop

function main(): void {
    let count: int = 0;
    outer: while (true) {
        for (const value of [1]) {
            try {
                throw new Error('break');
            } catch (e) {
                ++count;
                break outer;
            }
        }
    }
    arktest.assertEQ(count, 1);
}
