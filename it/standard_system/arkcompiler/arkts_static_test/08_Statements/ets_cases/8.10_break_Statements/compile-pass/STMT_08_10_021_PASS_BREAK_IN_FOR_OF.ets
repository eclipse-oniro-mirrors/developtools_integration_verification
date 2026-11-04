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
 * @id STMT_08_10_021_PASS_BREAK_IN_FOR_OF
 * @expect compile-pass
 * @section 8.10
 * @design for-of 循环中使用 break
 * @note 正向用例：验证该特性编译通过的正确用法。
 */
function testBreakInForOf(): void {
  let arr: int[] = [1, 2, 3, 4, 5]
  let count: int = 0
  for (let x of arr) { count++; if (x == 3) break }
  console.log(count.toString())
}
