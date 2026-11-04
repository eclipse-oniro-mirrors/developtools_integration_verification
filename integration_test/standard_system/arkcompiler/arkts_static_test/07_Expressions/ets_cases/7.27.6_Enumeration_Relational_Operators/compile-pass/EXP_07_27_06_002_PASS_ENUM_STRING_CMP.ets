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
 * @id EXP_07_27_06_002_PASS_ENUM_STRING_CMP
 * @expect compile-pass
 * @section 7.27.6
 * @design 同枚举类型（string 基类型）关系比较
 * @note 正向用例：验证该特性编译通过的正确用法。
 */
enum Status { OK = 'ok', ERROR = 'error' }
function testEnumStringCmp(): void {
  let a: Status = Status.OK; let b: Status = Status.ERROR
  let r: boolean = a < b
  console.log(r.toString())
}
