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
 * @id LEX_02_02_030_PASS_CONTROL_FLOW_WHITESPACE
 * @expect compile-pass
 * @section 2.2
 * @design 测试因子checklist: 控制流 - 词法输入元素在if/for/while/switch中的空白和注释组合
 * @note 正向用例：验证控制流语句中空白和注释不影响语义
 */
function main(): void {
  // if 语句中的注释和空白
  let x: number = 10
  if (x > 5 /* 条件注释 */) {
    let 结果: number = x + 1
  }

  // for 循环中的注释
  let 总和: number = 0
  for (let i: number = 0; i < 5; i++ /* 递增注释 */) {
    总和 = 总和 + i
  }

  // while 循环中的空白
  let 计数: number = 0
  while (计数 < 3) {
    计数 = 计数 + 1
  }

  // switch 中的注释
  let 值: number = 2
  switch (值) {
    case 1:
      break
    case 2: /* case注释 */
      break
    default:
      break
  }
}