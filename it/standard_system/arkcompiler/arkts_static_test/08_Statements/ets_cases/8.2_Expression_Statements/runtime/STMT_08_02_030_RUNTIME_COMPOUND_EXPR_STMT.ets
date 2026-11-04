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
 * @id STMT_08_02_030_RUNTIME_COMPOUND_EXPR_STMT
 * @expect runtime
 * @section 8.2
 * @design 复合赋值作为表达式语句

 * @note 运行时用例：实际执行验证复合赋值语句
 */
function main(): void {
  let x: int = 10
  x += 5
  if (x != 15) { throw new Error("assertion: 10+5=15") }
  x *= 2
  if (x != 30) { throw new Error("assertion: 15*2=30") }
  console.log("verified")
}
