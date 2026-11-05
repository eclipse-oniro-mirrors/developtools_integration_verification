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
 * @id EXP2_17_07_016_RUNTIME_EXPLICIT_VS_SHORT
 * @expect runtime
 * @section 17.7
 * @design 显式调用 C.$_invoke() 与简写 C() 行为一致
 * @note 运行时用例：验证两种调用形式返回相同结果
 */
class ExplicitShortCallable {
  static $_invoke(a: int, b: int): int {
    return a * b
  }
}

function main(): void {
  let rShort: int = ExplicitShortCallable(6, 7)
  let rExplicit: int = ExplicitShortCallable.$_invoke(6, 7)

  if (rShort != 42) {
    throw new Error('assertion failed: short form expected 42, got ' + rShort)
  }
  if (rExplicit != 42) {
    throw new Error('assertion failed: explicit form expected 42, got ' + rExplicit)
  }
  if (rShort != rExplicit) {
    throw new Error('assertion failed: short and explicit should match')
  }

  console.log('PASS: explicit and short forms match')
}
