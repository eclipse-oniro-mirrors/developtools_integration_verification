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
 * @id STMT_08_02_027_RUNTIME_CHAINED_EXPR_STMT
 * @expect runtime
 * @section 8.2
 * @design 链式表达式语句执行

 * @note 运行时用例：实际执行验证链式表达式
 */
function main(): void {
  let x: int = 0
  x = 1 + 2 * 3
  if (x != 7) { throw new Error("assertion: 1+2*3=7") }
  console.log("verified")
}
