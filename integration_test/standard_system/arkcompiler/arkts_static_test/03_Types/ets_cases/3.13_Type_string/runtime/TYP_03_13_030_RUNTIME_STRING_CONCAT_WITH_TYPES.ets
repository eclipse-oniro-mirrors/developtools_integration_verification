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
 * @id TYP_03_13_030_RUNTIME_STRING_CONCAT_WITH_TYPES
 * @expect runtime
 * @section 3.13
 * @design 验证 string 与 number/boolean/null/undefined 的隐式转换拼接
 * @note 运行时用例：验证字符串上下文中各类型隐式转换结果
 */
function main(): void {
  let n: int = 42
  let pi: double = 3.14
  let b1: boolean = true
  let b2: boolean = false

  if (("value: " + n) !== "value: 42") throw new Error("string+int failed")
  if (("pi=" + pi) !== "pi=3.14") throw new Error("string+double failed")
  if (("flag: " + b1) !== "flag: true") throw new Error("string+bool true failed")
  if (("flag: " + b2) !== "flag: false") throw new Error("string+bool false failed")

  let nullable: string | null = null
  if (("val: " + nullable) !== "val: null") throw new Error("string+null failed")

  let undef: string | undefined = undefined
  if (("val: " + undef) !== "val: undefined") throw new Error("string+undefined failed")

  console.log("verified")
}