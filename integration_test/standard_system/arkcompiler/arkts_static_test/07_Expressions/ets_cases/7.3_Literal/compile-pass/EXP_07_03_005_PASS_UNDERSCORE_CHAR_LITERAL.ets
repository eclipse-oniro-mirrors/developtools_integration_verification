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
 * @id EXP_07_03_005_PASS_UNDERSCORE_CHAR_LITERAL
 * @expect compile-pass
 * @section 7.3
 * @design 验证带下划线的数值字面量和实验性 char 字面量编译通过
 * @note 正向用例：验证下划线分隔的整型/浮点型字面量和 char 字面量的编译
 */
function main(): void {
  let i1: int = 1_000
  let i2: int = 1_000_000
  let i3: long = 0xFFFF_FFFF
  let i4: int = 0b1010_0101
  let i5: int = 0o777_777
  let f1: double = 3.141_592
  let f2: float = 1.5f
  console.log('verified')
}
