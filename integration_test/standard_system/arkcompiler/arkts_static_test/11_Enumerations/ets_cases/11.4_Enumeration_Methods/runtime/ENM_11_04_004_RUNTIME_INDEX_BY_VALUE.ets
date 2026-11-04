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
 * @id ENM_11_04_004_RUNTIME_INDEX_BY_VALUE
 * @expect runtime
 * @section 11.4
 * @design 通过枚举值索枚举名: Color[c]
 * @note 运行时用例
 */
enum C4 { Red, Green = 10, Blue }

function main(): void {
  let c: C4 = C4.Green
  let memberName: string = C4[c]
  if (memberName != "Green") throw new Error("index by value should be Green")
  console.log("enum index by value verified")
}