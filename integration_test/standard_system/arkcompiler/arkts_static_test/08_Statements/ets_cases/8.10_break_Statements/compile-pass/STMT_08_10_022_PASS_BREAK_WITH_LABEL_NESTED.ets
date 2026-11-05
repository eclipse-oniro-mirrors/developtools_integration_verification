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
 * @id STMT_08_10_022_PASS_BREAK_WITH_LABEL_NESTED
 * @expect compile-pass
 * @section 8.10
 * @design 嵌套循环中使用带 label 的 break
 * @note 正向用例：验证该特性编译通过的正确用法。
 */
function testBreakWithLabelNested(): void {
  let a: int = 0
  outer: for (let i: int = 0; i < 3; i++) {
    for (let j: int = 0; j < 3; j++) { a++; if (j == 1) break outer } }
  console.log(a.toString())
}
