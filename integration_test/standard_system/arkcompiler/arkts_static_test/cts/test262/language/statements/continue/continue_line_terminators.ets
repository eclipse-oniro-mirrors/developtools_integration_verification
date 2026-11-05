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

// arktsid: continue_line_terminators
// description: Line terminators between continue and a following expression end continue

function main(): void {
    let count: int = 0;
    let marker: int = 0;
    for (let i: int = 0; i < 4; ++i) {
        for (let j: int = 0; j < 1; ++j) {
            ++count;
            if (i == 0) {
                continue
marker;
            }
            if (i == 1) {
                continue
marker;
            }
            if (i == 2) {
                continue marker;
            }
            continue marker;
        }
    }
    arktest.assertEQ(count, 4);
    arktest.assertEQ(marker, 0);
}
