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

// arktsid: nested_for_of_independent
// description: Nested for-of statements operate independently

function main(): void {
    let outerCount: int = 0;
    for (const outerValue of [3, 7]) {
        arktest.assertEQ(outerValue, outerCount == 0 ? 3 : 7);
        let innerCount: int = 0;
        for (const innerValue of [3, 7]) {
            arktest.assertEQ(innerValue, innerCount == 0 ? 3 : 7);
            ++innerCount;
        }
        arktest.assertEQ(innerCount, 2);
        ++outerCount;
    }
    arktest.assertEQ(outerCount, 2);
}
