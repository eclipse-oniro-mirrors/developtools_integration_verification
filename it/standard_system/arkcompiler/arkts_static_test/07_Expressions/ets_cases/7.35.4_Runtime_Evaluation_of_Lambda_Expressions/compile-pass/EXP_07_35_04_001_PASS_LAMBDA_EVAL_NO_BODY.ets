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
 * @id EXP_07_35_04_001_PASS_LAMBDA_EVAL_NO_BODY
 * @expect compile-pass
 * @section 7.35.4
 * @design 验证 lambda 表达式求值本身不会执行 lambda 体：定义 lambda 并赋值给变量编译通过
 * @note 正向用例：lambda 表达式求值产生函数类型实例，不执行体
 */
function sideEffect(): void {
  let x: int = 1
}

let sideEffectFlag: boolean = false

// Lambda 定义赋值 — 此时体不应执行
const f1: () => int = () => { return 42 }
const f2: () => int = (): int => {
  sideEffectFlag = true
  return 99
}
const f3: () => string = () => { return 'hello' }
let outer: int = 10
const f4: () => int = (): int => {
  outer = outer + 1
  return outer
}
