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
 * @id CLS_09_03_2_006_RUNTIME_DEFAULT_ACCESSOR_UNDEFINED
 * @expect runtime
 * @section 9.3.2
 * @design 默认accessor返回undefined验证
 * @note 运行时用例：验证不实现可选属性时默认返回undefined
 */
interface IOpt6 {
  n?: number
}
class COpt6 implements IOpt6 {
}

function main(): void {
  let c = new COpt6()
  let v = c.n
  if (v != undefined) {
    throw new Error("c.n should be undefined")
  }
  console.log("Default accessor undefined verified")
}
