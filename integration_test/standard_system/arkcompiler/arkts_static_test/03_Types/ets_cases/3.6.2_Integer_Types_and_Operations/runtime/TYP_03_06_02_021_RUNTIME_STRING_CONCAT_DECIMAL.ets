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
 * @id TYP_03_06_02_021_RUNTIME_STRING_CONCAT_DECIMAL
 * @expect runtime
 * @section 3.6.2
 * @design 字符串拼接整数转 decimal 形式（spec 明确）
 * @note 运行时用例：integer + string 结果验证
 */
function main(): void {
  let i: int = 42
  let s1: string = "value=" + i
  if (s1 != "value=42") {
    throw new Error("int concat failed: " + s1)
  }

  let neg: int = -100
  let s2: string = "n=" + neg
  if (s2 != "n=-100") {
    throw new Error("negative int concat failed: " + s2)
  }

  let lo: long = 1234567890
  let s3: string = "long=" + lo
  if (s3 != "long=1234567890") {
    throw new Error("long concat failed: " + s3)
  }

  // 表达式拼接
  let s4: string = "result=" + (10 + 20)
  if (s4 != "result=30") {
    throw new Error("expr concat failed: " + s4)
  }

  console.log("String concat decimal verified")
}