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
 * @id EXP_07_01_01_014_PASS_NULLISH_COALESCING_PRECEDENCE
 * @expect compile-pass
 * @section 7.1.1
 * @design null 合并 `??` 优先级低于逻辑或 `||`，高于三元 `?:`
 * @note 正向用例：验证 null 合并运算符优先级
 */
function testNullishCoalescingPrecedence(): void {
  let a: int | undefined = undefined
  let b: int | undefined = 5
  let x: int = a ?? 10 + b ?? 0
  let y: int = a ?? (b ?? 0)
}
