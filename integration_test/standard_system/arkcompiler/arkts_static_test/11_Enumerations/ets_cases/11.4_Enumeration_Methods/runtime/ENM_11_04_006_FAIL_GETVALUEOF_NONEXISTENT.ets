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
 * @id ENM_11_04_006_FAIL_GETVALUEOF_NONEXISTENT
 * @expect runtime
 * @section 11.4
 * @design getValueOf 不存在的名字应抛运行时错误
 * @runtime-throws=Error
 * @note 运行时用例
 */
enum C6 { Red, Green, Blue }

function main(): void {
  let x: C6 = C6.getValueOf("NonExistent")
  console.log(x)
}