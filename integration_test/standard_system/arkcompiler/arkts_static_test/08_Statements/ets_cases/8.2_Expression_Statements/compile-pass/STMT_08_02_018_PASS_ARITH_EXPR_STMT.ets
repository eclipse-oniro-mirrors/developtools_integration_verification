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
 * @id STMT_08_02_018_PASS_ARITH_EXPR_STMT
 * @expect compile-pass
 * @section 8.2
 * @design 算术表达式作为语句
 * @note 正向用例：验证该特性编译通过的正确用法。
 */
function testArithExprStmt(): void {
  let x: int = 5
  x + 3
  x * 2
  x - 1
  console.log(x.toString())
}
