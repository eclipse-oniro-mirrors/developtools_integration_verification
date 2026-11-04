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
 * @id CON_06_04_04_008_FAIL_STRING_ENUM_TO_NONSTRING_UNION
 * @expect compile-fail
 * @section 6.4.4
 * @design string 枚举→int|double 联合: 联合中无 string，应编译失败
 * @note 反向用例：联合必须包含 string 才能接收 string enum
 */
enum Label { A = 'a', B = 'b' }

function testStringEnumToNonStringUnionFail(): void {
  let e: Label = Label.A
  let u: int | double = e
}
