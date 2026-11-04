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
 * @id CLS_09_06_3_005_RUNTIME_OPTIONAL_WITH_VALUE
 * @expect runtime
 * @section 9.6.3
 * @design optional字段赋值后访问验证
 * @note 运行时用例：验证optional字段赋值后正确读取
 */
class OptValue {
  val?: number
}
function main(): void {
  let o = new OptValue()
  o.val = 42
  if (o.val != 42) { throw new Error("o.val should be 42") }
  console.log("Optional with value verified")
}
