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

// arktsid: try_use_continue_n_label_construction
// description: Continue labels and automatic semicolon insertion

function main(): void {
    label1: for (let i: int = 0; i <= 0; ++i) {
        for (let j: int = 0; j <= 1; ++j) {
            if (j == 0) {
                continue label1;
            } else {
                arktest.assertTrue(false);
            }
        }
    }

    let result: boolean = false;
    label2: for (let i: int = 0; i <= 1; ++i) {
        for (let j: int = 0; j <= 1; ++j) {
            if (j == 0) {
                continue;
            } else {
                result = true;
            }
        }
    }
    arktest.assertTrue(result);
}
