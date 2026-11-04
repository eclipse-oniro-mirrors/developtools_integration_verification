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
 * @id EXP2_17_01_02_007_FAIL_CHAR_EQ_STRING
 * @expect compile-fail
 * @section 17.1.2
 * @design char 与 string 的比较应产生编译时错误（spec: 不兼容的类型比较）
 * @note 反向用例：验证该场景应产生编译时错误
 */
function testCharEqStringFail(): void {
  let c: char = c'a'
  let result: boolean = c == 'a'
  console.log(result)
}
