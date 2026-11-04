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
 * @id TYP_03_22_006_RUNTIME_CHAR_DEFAULT
 * @expect runtime
 * @section 3.22
 * @design char 默认值为 c'\u0000'
 * @note 运行时用例：补充 value type char 默认值验证
 */
function main(): void {
  let c: char
  if (c != c'\u0000') throw new Error("char default should be NUL")
  console.log("char default verified")
}
