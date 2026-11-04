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
 * @id EXP_07_27_05_002_PASS_CHAR_CMP_VAR
 * @expect compile-pass
 * @section 7.27.5
 * @design char 变量关系比较
 *  * @note 正向用例：验证该特性编译通过的正确用法
 */
function testCharCmpVar(): void {
  let a: char = c'x'
  let b: char = c'y'
  let r: boolean = a < b
  console.log(r.toString())
}
