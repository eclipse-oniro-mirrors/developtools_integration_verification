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
 * @id CLS_09_06_0008_RUNTIME_FIELD_INITIALIZER_EXEC
 * @expect runtime
 * @section 9.6
 * @design 字段初始化器表达式运行时验证
 * @note 运行时用例：验证初始化器在实例创建时求�?
 */
class InitExpr6 {
  a: int = 10 + 5
  b: string = "hello" + " world"
}
function main(): void {
  let obj = new InitExpr6()
  if (obj.a != 15) { throw new Error("obj.a should be 15") }
  if (obj.b != "hello world") { throw new Error("obj.b should be 'hello world'") }
  console.log("Field initializer exec verified")
}
