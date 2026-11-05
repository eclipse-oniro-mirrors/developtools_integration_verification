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
 * @id CON_06_03_009_PASS_ENUM_MULTIPLICATIVE
 * @expect compile-pass
 * @section 6.3
 * @design 数值基类型枚举参与乘法运算: enum * int
 * @note 正向用例：验证枚举在数值上下文的乘法运算编译通过
 */
enum Factor {
  One = 1,
  Two = 2,
  Three = 3
}

function testEnumMultiplicative(): void {
  let r1: int = Factor.Two * 5
  let r2: int = 10 * Factor.Three
  let r3: int = Factor.Three / Factor.One
}
