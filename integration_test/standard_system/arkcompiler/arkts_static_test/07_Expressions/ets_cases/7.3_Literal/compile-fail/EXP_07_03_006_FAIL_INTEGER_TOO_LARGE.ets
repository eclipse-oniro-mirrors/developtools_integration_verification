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
 * @id EXP_07_03_006_FAIL_INTEGER_TOO_LARGE
 * @expect compile-fail
 * @section 7.3
 * @design 验证超出 long 范围的整数字面量产生编译时错误
 * @note 反向用例：整数字面量值超出 long 类型范围(> max(long))应产生编译时错误
 */
function main(): void {
  let x: long = 9223372036854775808
  console.log('' + x)
}
