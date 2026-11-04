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
 * @id LEX_02_02_027_PASS_PARAM_CONTEXT
 * @expect compile-pass
 * @section 2.2
 * @design 测试因子checklist: 参数/返回值上下文 - 词法输入元素在参数传递和返回值中的使用
 * @note 正向用例：验证注释和空白在函数参数、返回值、泛型参数中不影响语义
 */
function 计算(a: number, /* 参数间注释 */ b: number): number {
  return a + b // 行末注释
}

function 泛型函数<T>(值: T): T {
  return 值 // 泛型参数上下文
}

function main(): void {
  let 结果1: number = 计算(1, 2)
  let 结果2: number = 计算(
    3,   /* 换行+注释 */
    4
  )
  let 结果3: string = 泛型函数<string>("hello")
}