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
 * @id TYP_03_06_04_014_RUNTIME_STRING_CONCAT
 * @expect runtime
 * @section 3.6.4
 * @design boolean + string 拼接生成 "true"/"false"
 * @note 运行时用例：拼接结果验证
 */
function main(): void {
  let s1: string = "flag=" + true
  if (s1 != "flag=true") {
    throw new Error("true concat failed: " + s1)
  }

  let s2: string = "flag=" + false
  if (s2 != "flag=false") {
    throw new Error("false concat failed: " + s2)
  }

  let s3: string = (1 < 2) + " result"
  if (s3 != "true result") {
    throw new Error("expr concat failed: " + s3)
  }

  console.log("Boolean string concat verified")
}