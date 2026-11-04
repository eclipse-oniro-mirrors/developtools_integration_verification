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
 * @id TYP_03_22_003_RUNTIME_CLASS_FIELD_DEFAULTS
 * @expect runtime
 * @section 3.22
 * @design 类字段 T|undefined 默认值为 undefined
 * @note 运行时用例：spec 原例
 */
class A3 {
  f1: string | undefined
  f2?: boolean
}

function main(): void {
  let a = new A3()
  if (a.f1 !== undefined) throw new Error("f1 should be undefined")
  if (a.f2 !== undefined) throw new Error("f2 should be undefined")
  console.log("Class field defaults verified")
}