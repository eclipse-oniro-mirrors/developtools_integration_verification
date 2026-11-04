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
 * @id CON_06_03_015_FAIL_STRING_ENUM_ARITHMETIC
 * @expect compile-fail
 * @section 6.3
 * @design string 基类型枚举参与算术: string enum + int, 非数值枚举不可用于数值上下文
 * @note 反向用例：string 枚举用于数值上下文应编译失败
 */
enum Color {
  Red = 'red',
  Blue = 'blue'
}

function testStringEnumArithmeticFail(): void {
  let r: int = Color.Red + 1
}
