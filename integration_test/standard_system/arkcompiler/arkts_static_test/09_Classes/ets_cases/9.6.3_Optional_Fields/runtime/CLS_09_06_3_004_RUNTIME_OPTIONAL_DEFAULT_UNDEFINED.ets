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
 * @id CLS_09_06_3_004_RUNTIME_OPTIONAL_DEFAULT_UNDEFINED
 * @expect runtime
 * @section 9.6.3
 * @design optional字段默认值undefined验证
 * @note 运行时用例：验证optional字段无初始化器时值为undefined
 */
class OptDefault {
  val?: string
}
function main(): void {
  let o = new OptDefault()
  if (o.val != undefined) { throw new Error("o.val should be undefined") }
  console.log("Optional default undefined verified")
}
