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
 * @id EXP2_17_03_007_PASS_VALUEARRAY_BYTE_LITERAL
 * @expect compile-pass
 * @section 17.3
 * @design Valuebyte[] 使用数组字面量创建：验证 byte 值类型数组声明和初始化
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testValueArrayByteLiteral(): void {
  let a: Valuebyte[] = [1, 2, 3]
  console.log(a[0])
  console.log(a[1])
  console.log(a[2])
  console.log(a.length)
}
