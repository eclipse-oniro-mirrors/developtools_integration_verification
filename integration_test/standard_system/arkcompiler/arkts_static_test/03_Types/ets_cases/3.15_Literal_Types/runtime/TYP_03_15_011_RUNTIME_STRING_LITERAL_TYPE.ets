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
 * @id TYP_03_15_011_RUNTIME_STRING_LITERAL_TYPE
 * @expect runtime
 * @section 3.15
 * @design 验证字符串字面量类型运行时行为
 * @note 运行时用例：实际执行验证 string literal type 操作
 */
function main(): void {
  let a: "string literal" = "string literal"
  let b: string = a + a

  if (a !== "string literal") throw new Error("a assert failed")
  if (b !== "string literalstring literal") throw new Error("b assert failed")

  console.log("verified")
}
