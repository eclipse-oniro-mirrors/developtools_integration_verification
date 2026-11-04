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
 * @id TYP_03_22_007_RUNTIME_NULLISH_FIELD_DEFAULTS
 * @expect runtime
 * @section 3.22
 * @design 可赋值 undefined 的 nullish 字段默认值为 undefined
 * @note 运行时用例：验证 string|undefined 和 optional 字段
 */
class DefaultNullishFields {
  name: string | undefined
  flag?: boolean
}
function main(): void {
  let obj = new DefaultNullishFields()
  if (obj.name !== undefined) throw new Error("name should default to undefined")
  if (obj.flag !== undefined) throw new Error("flag should default to undefined")
  console.log("nullish field defaults verified")
}
