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
 * @id TYP_03_06_03_008_PASS_STRING_CONCAT
 * @expect compile-pass
 * @section 3.6.3
 * @design 字符串拼接：浮点 + string，浮点转 decimal（无信息损失）
 * @note 正向用例：spec §3.6.3 字符串拼接规则
 */
function testStringConcat(): void {
  let f: float = 3.14f
  let d: double = 2.718281828

  let s1: string = "f=" + f
  let s2: string = "d=" + d
  let s3: string = f + " is float"
  let s4: string = d + " is double"

  let s5: string = "result=" + (f * 2)
}