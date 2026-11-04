/*
* Copyright (c) 2021-2026 Huawei Device Co., Ltd.
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
/**
 * @id EXP2_17_08_003_PASS_DO_WHILE_LOOP
 * @expect compile-pass
 * @section 17.8
 * @design 验证 do-while 循环在 ArkTS 中编译通过
 * @note 正向用例：验证 do-while 循环的标准用法编译通过
 */
function testDoWhileLoop(): void {
  let count: number = 0
  do {
    count = count + 1
  } while (count < 5)

  // do-while executes at least once
  let executed: boolean = false
  let neverTrue: boolean = false
  do {
    executed = true
  } while (neverTrue)

  // do-while with break
  let j: number = 0
  do {
    j = j + 1
    if (j >= 3) {
      break
    }
  } while (true)
}
