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
 * @id LEX_02_02_029_RT_CONTROL_FLOW_WHITESPACE
 * @expect runtime
 * @section 2.2
 * @design 测试因子checklist: 控制流 - 验证if/for/while中空白和注释不影响运行时结果
 * @note 运行时用例：实际执行验证控制流中词法元素不影响语义
 */
function main(): void {
  let 总和: number = 0

  // for循环中的注释
  for (let i: number = 0; i < 5; i++ /* 递增 */) {
    总和 = 总和 + i
  }
  if (总和 !== 10) { throw new Error("control flow: for loop sum mismatch, got " + 总和.toString()) }

  // while循环中的注释
  let 计数: number = 0
  let 累积: number = 1
  while (计数 < 3) /* 条件注释 */ {
    累积 = 累积 * 2
    计数 = 计数 + 1
  }
  if (累积 !== 8) { throw new Error("control flow: while loop mismatch, got " + 累积.toString()) }

  // if-else中的注释
  let 值: number = 5
  if (值 > 3 /* 条件 */) {
    值 = 值 + 10
  } else {
    值 = 值 - 1
  }
  if (值 !== 15) { throw new Error("control flow: if-else mismatch, got " + 值.toString()) }
}