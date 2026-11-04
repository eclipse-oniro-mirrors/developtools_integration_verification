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
 * @id TYP_03_01_018_FAIL_VALUE_OVERFLOW
 * @expect compile-fail
 * @section 3.1
 * @design 数值类型声明字面量溢出应编译失败: byte(128/-129)、short(32768/-32769)、int(2147483648)、long(max+1)
 * @note 反向用例：验证该场景应产生编译时错误
 */
function testOverflowFail(): void {
  let b: byte = 128
  let b2: byte = -129
  let s: short = 32768
  let s2: short = -32769
  let i: int = 2147483648
  let l: long = 9223372036854775808
}