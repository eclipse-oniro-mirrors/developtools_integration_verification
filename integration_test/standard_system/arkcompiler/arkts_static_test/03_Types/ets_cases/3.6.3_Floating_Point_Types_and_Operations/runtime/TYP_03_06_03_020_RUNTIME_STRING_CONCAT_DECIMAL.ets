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
 * @id TYP_03_06_03_020_RUNTIME_STRING_CONCAT_DECIMAL
 * @expect runtime
 * @section 3.6.3
 * @design 字符串拼接：浮点转 decimal（无信息损失）
 * @note 运行时用例：spec §3.6.3 字符串拼接规则
 */
function main(): void {
  let f: float = 3.14f
  let s1: string = "f=" + f
  if (s1.length < 4) {
    throw new Error("float concat result too short: " + s1)
  }

  let d: double = 2.5
  let s2: string = "d=" + d
  if (s2 != "d=2.5") {
    throw new Error("d=2.5 concat failed: " + s2)
  }

  // 表达式拼接
  let s3: string = "result=" + (1.0 + 2.0)
  if (s3 != "result=3" && s3 != "result=3.0") {
    throw new Error("expr concat unexpected: " + s3)
  }

  console.log("Float string concat verified")
}