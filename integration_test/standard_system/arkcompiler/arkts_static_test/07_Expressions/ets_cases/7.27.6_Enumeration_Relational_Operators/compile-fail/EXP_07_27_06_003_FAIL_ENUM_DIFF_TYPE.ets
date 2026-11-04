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
 * @id EXP_07_27_06_003_FAIL_ENUM_DIFF_TYPE
 * @expect compile-fail
 * @section 7.27.6
 * @design 不同枚举类型关系比较应产生编译错误
 * @note 反向用例：验证该场景应产生编译时错误。
 */
enum E1 { A, B }
enum E2 { C, D }
function testEnumDiffTypeFail(): void {
  let a: E1 = E1.A; let b: E2 = E2.C
  let bad: boolean = a < b; console.log(bad.toString())
}
