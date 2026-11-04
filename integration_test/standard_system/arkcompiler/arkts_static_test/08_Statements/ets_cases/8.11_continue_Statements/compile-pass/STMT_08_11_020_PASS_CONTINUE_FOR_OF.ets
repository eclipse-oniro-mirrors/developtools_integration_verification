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
 * @id STMT_08_11_020_PASS_CONTINUE_FOR_OF
 * @expect compile-pass
 * @section 8.11
 * @design for-of 循环中使用 continue
 * @note 正向用例：验证该特性编译通过的正确用法。
 */
function testContinueForOf(): void {
  let arr: int[] = [1, 2, 3, 4, 5]
  let sum: int = 0
  for (let x of arr) { if (x % 2 == 0) continue; sum = sum + x }
  console.log(sum.toString())
}
