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
 * @id TYP_03_06_02_009_PASS_STRING_CONCAT
 * @expect compile-pass
 * @section 3.6.2
 * @design 字符串拼接：integer + string，整数转 decimal
 * @note 正向用例：spec §3.6.2 字符串拼接规则
 */
function testStringConcat(): void {
  let i: int = 42
  let lo: long = 1000000000
  let by: byte = 7
  let sh: short = 300

  let s1: string = "value: " + i
  let s2: string = "long: " + lo
  let s3: string = i + " is the answer"
  let s4: string = "byte=" + by + " short=" + sh

  // 表达式中
  let s5: string = "result=" + (i * 2)
}