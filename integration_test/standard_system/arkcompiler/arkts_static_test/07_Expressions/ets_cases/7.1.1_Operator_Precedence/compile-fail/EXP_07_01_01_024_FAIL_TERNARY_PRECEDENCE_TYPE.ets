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
 * @id EXP_07_01_01_024_FAIL_TERNARY_PRECEDENCE_TYPE
 * @expect compile-fail
 * @section 7.1.1
 * @design 三元 `?:` 优先级低于空合并 `??`，`a ?? b ? c : d` 解析为 `(a ?? b) ? c : d`，若 `(a ?? b)` 非 boolean 则类型错误
 * @note 反向用例：spec 要求三元条件需要 boolean 类型，但 ArkTS 实际编译通过
 *       ⚠️ SPEC 不一致：spec 要求三元条件必须是 boolean 类型，实现允许 int 自动作为条件
 *       分类：D 类（Spec 与实现不一致）
 */
function testTernaryPrecedenceType(): void {
  let x: int = 5
  let y: string = x ?? 0 ? 'ok' : 'no'
}

