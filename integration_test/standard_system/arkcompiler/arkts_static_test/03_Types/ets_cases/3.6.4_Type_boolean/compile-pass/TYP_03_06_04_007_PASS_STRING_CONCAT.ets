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
 * @id TYP_03_06_04_007_PASS_STRING_CONCAT
 * @expect compile-pass
 * @section 3.6.4
 * @design boolean + string 拼接，boolean 转 "true"/"false"
 * @note 正向用例：spec §3.6.4 字符串拼接
 */
function testStringConcat(): void {
  let t: boolean = true
  let f: boolean = false

  let s1: string = "flag=" + t
  let s2: string = f + " is false"
  let s3: string = "result=" + (1 < 2)
}