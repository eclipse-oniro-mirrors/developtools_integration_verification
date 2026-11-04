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
 * @id TYP_03_11_019_RUNTIME_VOID_ARRAY
 * @expect runtime
 * @section 3.11
 * @design void[] 运行时仅包含 undefined
 * @note 运行时用例：Array<void>
 */
function main(): void {
  let a1: void[] = [undefined]
  let a2: Array<void> = [undefined, undefined]

  if (a1.length != 1 || a1[0] !== undefined) {
    throw new Error("void[] failed")
  }
  if (a2.length != 2 || a2[1] !== undefined) {
    throw new Error("Array<void> failed")
  }

  console.log("void array verified")
}