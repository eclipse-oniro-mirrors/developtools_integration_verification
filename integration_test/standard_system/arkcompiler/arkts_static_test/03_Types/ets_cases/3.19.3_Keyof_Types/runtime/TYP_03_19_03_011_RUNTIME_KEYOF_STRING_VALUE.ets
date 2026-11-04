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
 * @id TYP_03_19_03_011_RUNTIME_KEYOF_STRING_VALUE
 * @expect runtime
 * @section 3.19.3
 * @design keyof 值运行时表现为 string 字符串
 * @note 运行时用例：keyof 类型变量可参与字符串比较和拼接
 */
class R11 {
  field: number = 0
  method(): void {}
}
type KeysOfR11 = keyof R11

function main(): void {
  let k: KeysOfR11 = "field"
  if (k != "field") {
    throw new Error("key should be field")
  }
  let s: string = "key=" + k
  if (s != "key=field") {
    throw new Error("key string concat failed")
  }
  k = "method"
  if (k != "method") {
    throw new Error("key should be method")
  }
  console.log("keyof string value verified")
}