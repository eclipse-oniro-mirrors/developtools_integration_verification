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
 * @id TYP_03_06_04_011_RUNTIME_NEW_BOOLEAN_DEFAULT
 * @expect runtime
 * @section 3.6.4
 * @design new boolean 返回 false（spec §3.6.4 例子）
 * @note 运行时用例：spec 原例验证
 */
function main(): void {
  let a_boolean = new boolean()
  if (a_boolean != false) {
    throw new Error("new boolean should be false")
  }
  console.log("new boolean default verified")
}