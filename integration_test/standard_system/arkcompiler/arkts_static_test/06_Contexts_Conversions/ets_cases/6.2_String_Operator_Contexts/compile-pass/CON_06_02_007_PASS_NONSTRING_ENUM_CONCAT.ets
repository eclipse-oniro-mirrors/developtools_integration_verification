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
 * @id CON_06_02_007_PASS_NONSTRING_ENUM_CONCAT
 * @expect compile-pass
 * @section 6.2
 * @design String context: 非 string 值枚举 + string，通过 toString() 转换
 * @note 正向用例：验证该特性编译通过的正确用法
 */
enum Status {
  Active,
  Inactive,
  Pending
}

function testNonStringEnumConcat(): void {
  let s1: string = 'status: ' + Status.Active
  let s2: string = Status.Pending + ' status'
}
