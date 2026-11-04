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

// arktsid: promise_all_empty_returns_new_array
// description: Promise.all([]) resolves with a new array distinct from the input array
// Conversion notes:
//  - Promise.all builds a fresh result array; the resolved value is never the same reference as the input array

function main(): int {
    let arg: int[] = [];
    Promise.all(arg).then((result: int[]): void => {
        arktest.assertNE(result, arg, 'result is a new array, not the same reference as arg');
    });
    return 0;
}