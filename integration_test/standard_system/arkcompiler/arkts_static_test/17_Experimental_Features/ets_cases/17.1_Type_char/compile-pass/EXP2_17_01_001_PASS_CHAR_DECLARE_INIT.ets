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
 * @id EXP2_17_01_001_PASS_CHAR_DECLARE_INIT
 * @expect compile-pass
 * @section 17.1
 * @design char 类型变量声明与初始化：验证 char 类型变量可以正确声明并用 char 字面量初始化
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testCharDeclareInit(): void {
  let a: char = c'a'
  let z: char = c'Z'
  let zero: char = c'0'
  let space: char = c' '
  let exclam: char = c'!'
  console.log(a)
  console.log(z)
  console.log(zero)
  console.log(space)
  console.log(exclam)
}
