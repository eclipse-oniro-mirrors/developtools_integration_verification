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
 * @id EXP_07_30_002_PASS_COND_AND_SHORT_CIRCUIT
 * @expect compile-pass
 * @section 7.30
 * @design 验证 && 的短路行为：LHS 为 false 时 RHS 不执行（函数调用作为操作数验证副作用）
 * @note 正向用例：验证 && 短路特性的编译通过
 */
let sideEffectCount: int = 0;

function effect(): boolean {
  sideEffectCount = sideEffectCount + 1;
  return true;
}

function main(): void {
  // 重置计数
  sideEffectCount = 0;

  // LHS 为 false，短路：effect() 不应被调用
  let r1: boolean = false && effect();
  // sideEffectCount 应保持为 0

  // LHS 为 true，不短路：effect() 应被调用
  let r2: boolean = true && effect();
  // sideEffectCount 应为 1
}
