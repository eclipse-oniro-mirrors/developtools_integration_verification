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
 * @id STMT_08_06_026_RUNTIME_LABELED_LOOP_BREAK
 * @expect runtime
 * @section 8.6
 * @design 带 label 的循环 break 运行时验证

 * @note 运行时用例：实际执行验证labeled break
 */
function main(): void {
  let a: int = 0
  outer: for (let i: int = 0; i < 10; i++) {
    for (let j: int = 0; j < 10; j++) {
      a++
      if (i == 0 && j == 2) break outer
    }
  }
  if (a != 3) { throw new Error("assertion: break outer after 3 iterations") }
  console.log("verified")
}
