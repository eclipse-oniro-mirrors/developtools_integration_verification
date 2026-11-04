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
 * @id EXP_07_35_02_006_PASS_VOID_CALL_EXPR_BODY
 * @expect compile-pass
 * @section 7.35.2
 * @design 验证 Lambda 体为 void 调用表达式时的处理规则。若表达式是返回类型为 void 的调用表达式，体等价于 { expression; }
 * @note 正向用例：void 调用表达式作为 Lambda 体可以正确编译（不加 return，等价于 { expression; }）
 */
function logMessage(msg: string): void {
  console.log(msg)
}

function main(): void {
  // void 调用表达式作为单表达式体
  const f: (msg: string) => void = (msg: string): void => logMessage(msg)
  f('hello from void call expression body')

  // 带附加操作的 void 调用 — 块体中调用 void 函数
  const g: (msg: string, prefix: string) => void = (msg: string, prefix: string): void => {
    let full: string = prefix + ': ' + msg
    logMessage(full)
  }
  g('test', 'INFO')

  console.log('verified')
}
