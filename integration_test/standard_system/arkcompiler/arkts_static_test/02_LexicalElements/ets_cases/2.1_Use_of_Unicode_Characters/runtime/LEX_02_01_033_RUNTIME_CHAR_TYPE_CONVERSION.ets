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
 * @id LEX_02_01_033_RUNTIME_CHAR_TYPE_CONVERSION
 * @expect runtime
 * @section 2.1
 * @design 测试因子checklist: 基础类型与转换 - char类型在不同上下文（赋值、参数、返回值、数组元素）中的行为验证
 * @note 运行时用例：实际执行验证char类型的类型转换和上下文行为
 */
function 接受字符参数(c: char): char {
  return c
}

function 返回字符(): char {
  return c'B'
}

function main(): void {
  let c1: char = c'A'
  let c2: char = c'\u0042'
  let c3: char = c'\x43'

  if (c1 !== c'A') { throw new Error("char assignment mismatch") }
  if (c2 !== c'B') { throw new Error("char \\u escape mismatch") }
  if (c3 !== c'C') { throw new Error("char \\x escape mismatch") }

  let c4: char = 接受字符参数(c1)
  if (c4 !== c'A') { throw new Error("char param pass mismatch") }

  let c5: char = 返回字符()
  if (c5 !== c'B') { throw new Error("char return value mismatch") }

  let 数组: char[] = [c1, c2, c3]
  if (数组[0] !== c'A') { throw new Error("char array element mismatch") }
  if (数组[1] !== c'B') { throw new Error("char array element mismatch") }
  if (数组[2] !== c'C') { throw new Error("char array element mismatch") }
}