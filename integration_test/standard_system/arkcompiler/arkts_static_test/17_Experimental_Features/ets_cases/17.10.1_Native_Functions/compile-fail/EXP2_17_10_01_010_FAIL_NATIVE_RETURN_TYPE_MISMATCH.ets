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
 * @id EXP2_17_10_01_010_FAIL_NATIVE_RETURN_TYPE_MISMATCH
 * @expect compile-fail
 * @section 17.10.1
 * @design 原生函数返回类型不匹配：验证将 native function 返回值赋给不兼容类型产生编译错误 ESE0318
 * @note 反向用例：验证该场景应产生编译时错误 - Type 'Int' cannot be assigned to type 'String'
 */
native function getNumber(): int
function testTypeMismatch(): void {
  let s: string = getNumber()
  console.log(s)
}
