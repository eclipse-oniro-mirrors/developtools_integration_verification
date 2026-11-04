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
 * @id LEX_02_02_027_RT_PARAM_CONTEXT
 * @expect runtime
 * @section 2.2
 * @design 测试因子checklist: 参数/返回值上下文 - 验证注释在参数传递中不影响运行时结果
 * @note 运行时用例：实际执行验证参数间注释不影响计算
 */
function 加法(a: number, b: number): number {
  return a + b
}

function 乘法(a: number, b: number): number {
  return a * b
}

function main(): void {
  let 结果1: number = 加法(10, 20)
  if (结果1 !== 30) { throw new Error("param context: addition mismatch, got " + 结果1.toString()) }

  let 结果2: number = 乘法(5, 4)
  if (结果2 !== 20) { throw new Error("param context: multiplication mismatch, got " + 结果2.toString()) }

  let 链式: number = 加法(乘法(3, 4), 乘法(5, 6))
  if (链式 !== 42) { throw new Error("param context: chained call mismatch, got " + 链式.toString()) }
}