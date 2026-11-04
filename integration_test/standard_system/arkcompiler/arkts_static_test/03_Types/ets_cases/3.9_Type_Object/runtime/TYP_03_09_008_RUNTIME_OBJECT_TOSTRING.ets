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
 * @id TYP_03_09_008_RUNTIME_OBJECT_TOSTRING
 * @expect runtime
 * @section 3.9
 * @design Object.toString 返回字符串
 * @note 运行时用例
 */
class Custom8 {
  toString(): string { return "custom8" }
}

function main(): void {
  let o1: Object = "hello"
  if (o1.toString() != "hello") {
    throw new Error("string.toString failed")
  }

  let o2: Object = new Custom8()
  if (o2.toString() != "custom8") {
    throw new Error("custom toString failed")
  }

  console.log("Object.toString verified")
}