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

// arktsid: continue_in_for_loop
// description: Continue skips the first five iterations of a for loop

function main(): void {
    let result: string = '';
    for (let index: int = 0; index < 10; ++index) {
        if (index < 5) {
            continue;
        }
        result += index.toString();
    }
    arktest.assertEQ(result, '56789');
}
