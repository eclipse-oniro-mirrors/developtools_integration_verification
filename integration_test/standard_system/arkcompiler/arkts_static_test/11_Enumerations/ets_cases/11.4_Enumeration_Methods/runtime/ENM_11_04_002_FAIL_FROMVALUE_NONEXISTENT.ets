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
 * @id ENM_11_04_002_FAIL_FROMVALUE_NONEXISTENT
 * @expect runtime
 * @section 11.4
 * @design fromValue 不存在的值应抛运行时错误
 * @runtime-throws=Error
 * @note 运行时用例：spec 原例 Color.fromValue(6)
 */
enum C2 { Red, Green, Blue = 5 }

function main(): void {
  let x: C2 = C2.fromValue(6)
  console.log(x)
}