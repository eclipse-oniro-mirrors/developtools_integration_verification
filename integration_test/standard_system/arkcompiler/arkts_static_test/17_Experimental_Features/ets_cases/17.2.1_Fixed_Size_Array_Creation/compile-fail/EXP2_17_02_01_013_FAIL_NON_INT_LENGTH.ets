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
 * @id EXP2_17_02_01_013_FAIL_NON_INT_LENGTH
 * @expect compile-fail
 * @section 17.2.1
 * @design FixedArray 构造函数第一个参数长度必须为 int 类型：传入非 int 类型（如 float）应产生编译时错误
 * @note 反向用例：验证该场景应产生编译时错误。constructor(len: int, elem: T) 要求 len 为 int
 */
function testNonIntLength(): void {
  let a = new Fixedstring[](3.5, "a")
  console.log(a.length)
}
