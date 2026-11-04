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

// arktsid: for_await_accepted_as_for_of
// description: ArkTS accepts the for-await syntax and iterates the array as a for-of loop
// Conversion notes: test262 的 for-await-of 用例期望异步迭代协议；ArkTS 实测接受 `for await (let x of arr)` 语法并按 for-of 迭代数组（静默接受，见 §D）

function main(): void {
    let sum: int = 0;
    for await (let x of [1, 2, 3]) {
        sum += x;
    }
    arktest.assertEQ(sum, 6);
}
