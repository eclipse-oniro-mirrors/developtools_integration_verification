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
 * @id CLS_09_06_4_005_RUNTIME_INITIALIZER_EVAL
 * @expect runtime
 * @section 9.6.4
 * @design 初始化器表达式求值运行时验证
 * @note 运行时用例：验证初始化器在实例创建时执行
 */
class InitEval {
  val: int = InitEval.compute()
  static compute(): int { return 42 }
}
function main(): void {
  let e = new InitEval()
  if (e.val != 42) { throw new Error("e.val should be 42") }
  console.log("Initializer eval verified")
}
