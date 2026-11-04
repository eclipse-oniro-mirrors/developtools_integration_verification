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
 * @id CON_06_03_01_015_FAIL_STRING_ENUM_RELATIONAL
 * @expect compile-fail
 * @section 6.3.1
 * @design string枚举不能在numeric context中进行关系运算
 * @note 反向用例：原文件错测boolean<=long，已修正为string enum <
 *       D类: 编译器实际允许string enum <比较，违反spec §6.3
 */
enum StringEnum015 { A = 'hello', B = 'world' }
function testStringEnumRelationalFail(): void {
  let r: boolean = StringEnum015.A < StringEnum015.B
}
