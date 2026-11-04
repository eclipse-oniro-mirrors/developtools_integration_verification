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
 * @id LEX_02_09_05_021_RT_BOOLEAN_LOOP
 * @expect runtime
 * @section 2.9.5
 * @design 布尔在循环中运行时验证
 * @note runtime 用例：验证布尔在循环中的运行时行为
 */

function main(): void {
  // 布尔在 while 循环中
  let i = 0
  let sum1 = 0
  while (i < 5) {
    sum1 = sum1 + i
    i++
  }
  if (sum1 !== 10) { throw new Error("while loop failed, got " + sum1) }

  // 布尔在 for 循环中
  let sum2 = 0
  for (let j = 0; j < 5; j++) {
    sum2 = sum2 + j
  }
  if (sum2 !== 10) { throw new Error("for loop failed, got " + sum2) }

  // 布尔在 do-while 循环中
  let k = 0
  let sum3 = 0
  do {
    sum3 = sum3 + k
    k++
  } while (k < 5)
  if (sum3 !== 10) { throw new Error("do-while loop failed, got " + sum3) }
}
