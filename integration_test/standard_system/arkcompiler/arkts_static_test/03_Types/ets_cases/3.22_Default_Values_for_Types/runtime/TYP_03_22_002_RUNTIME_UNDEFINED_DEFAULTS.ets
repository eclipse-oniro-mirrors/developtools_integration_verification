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
 * @id TYP_03_22_002_RUNTIME_UNDEFINED_DEFAULTS
 * @expect runtime
 * @section 3.22
 * @design Any/void/undefined 默认值为 undefined
 * @note 运行时用例：spec 原例
 */
function main(): void {
  let o1: Any
  let o2: void
  let o3: undefined

  if (o1 !== undefined) throw new Error("Any default should be undefined")
  if (o2 !== undefined) throw new Error("void default should be undefined")
  if (o3 !== undefined) throw new Error("undefined default should be undefined")
  console.log("Undefined defaults verified")
}