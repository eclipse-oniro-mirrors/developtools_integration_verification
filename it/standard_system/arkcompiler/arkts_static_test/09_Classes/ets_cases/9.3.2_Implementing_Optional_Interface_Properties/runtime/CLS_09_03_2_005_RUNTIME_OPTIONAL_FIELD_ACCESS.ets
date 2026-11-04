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
 * @id CLS_09_03_2_005_RUNTIME_OPTIONAL_FIELD_ACCESS
 * @expect runtime
 * @section 9.3.2
 * @design optional字段运行时访问验�?
 * @note 运行时用例：验证optional字段的读取和赋�?
 */
interface IOpt5 {
  val?: number
}
class COpt5 implements IOpt5 {
  val?: number = 42
}

function main(): void {
  let c = new COpt5()
  if (c.val != 42) {
    throw new Error("c.val should be 42")
  }
  c.val = 100
  if (c.val != 100) {
    throw new Error("c.val should be 100")
  }
  console.log("Optional field access verified")
}
