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
 * @id TYP_03_22_001_RUNTIME_VALUE_DEFAULTS
 * @expect runtime
 * @section 3.22
 * @design 值类型默认值验证
 * @note 运行时用例：每个值类型默认值按 spec 验证
 */
function main(): void {
  let a: int
  let b: byte
  let c: short
  let d: long
  let e: float
  let f: double
  let g: number
  let h: boolean

  if (a != 0) throw new Error("int default should be 0")
  if (b != 0) throw new Error("byte default should be 0")
  if (c != 0) throw new Error("short default should be 0")
  if (d != 0) throw new Error("long default should be 0")
  if (e != 0.0f) throw new Error("float default should be 0.0")
  if (f != 0.0) throw new Error("double default should be 0.0")
  if (h != false) throw new Error("boolean default should be false")
  console.log("Value types defaults verified")
}