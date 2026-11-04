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

// arktsid: continue_label_from_try
// description: A labelled continue in a for-of try block resumes the outer loop

function main(): void {
    let count: int = 0;
    let run: boolean = true;
    outer: while (run) {
        run = false;
        for (const value of [1]) {
            try {
                ++count;
                continue outer;
            } catch (e) {
            }
        }
    }
    arktest.assertEQ(count, 1);
}
