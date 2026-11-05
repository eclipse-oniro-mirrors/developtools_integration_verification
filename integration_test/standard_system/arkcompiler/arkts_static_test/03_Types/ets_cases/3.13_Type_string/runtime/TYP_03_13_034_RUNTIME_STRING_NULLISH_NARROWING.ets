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
 * @id TYP_03_13_034_RUNTIME_STRING_NULLISH_NARROWING
 * @expect runtime
 * @section 3.13
 * @design 验证 string | null / string | undefined 的 nullish 收窄
 * @note 运行时用例：验证 instanceof 和 === null / === undefined 收窄后安全访问
 */
function main(): void {
  let sn: string | null = null
  if (sn === null) {
    // nullish branch, safe
  } else {
    throw new Error("should be null")
  }
  sn = "hello"
  if (sn === null) {
    throw new Error("should not be null")
  }
  if (sn !== "hello") throw new Error("sn assert failed")

  let su: string | undefined = undefined
  if (su === undefined) {
    // nullish branch, safe
  } else {
    throw new Error("should be undefined")
  }
  su = "world"
  if (su === undefined) {
    throw new Error("should not be undefined")
  }
  if (su !== "world") throw new Error("su assert failed")

  console.log("verified")
}