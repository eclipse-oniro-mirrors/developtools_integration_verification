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
 * @id STMT_08_05_005_PASS_IF_WITHOUT_BLOCK
 * @expect compile-pass
 * @section 8.5
 * @design if/else 不带块语句（无 {}），只跟一条语句；不创建块级作用域
 * @note 正向用例：if/else 单语句无块写法
 */
function testIfWithoutBlock(): void {
  let x: int = 0

  // if 不带块，单语句
  if (true) x = 1
  if (false) x = 2

  // if-else 不带块，单语句
  if (true) x = 3
  else x = 4

  // 嵌套 if 不带块（dangling else 绑定到最近 if）
  if (true)
    if (false) x = 5
    else x = 6

  // 条件表达式为关系运算
  let a: int = 10
  let b: int = 20
  if (a < b) x = 7
  if (a == b) x = 8
  else x = 9
}
