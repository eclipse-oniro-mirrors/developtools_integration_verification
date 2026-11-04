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
 * @id LEX_02_01_036_PASS_CHAR_TYPE_CONTEXTS
 * @expect compile-pass
 * @section 2.1
 * @design 测试因子checklist: 基础类型与转换 - char类型在不同上下文中的使用（赋值、参数、返回值、数组元素）
 * @note 正向用例：验证char类型在各种上下文中正确使用
 */
function 接受字符(c: char): char {
  return c
}

function 返回字符(): char {
  return c'A'
}

function main(): void {
  let c1: char = c'A'
  let c2: char = c'\u0042'
  let c3: char = c'\x43'
  let c4: char = 接受字符(c1)
  let c5: char = 返回字符()
  let 数组: char[] = [c1, c2, c3]
  let 第一个: char = 数组[0]
}