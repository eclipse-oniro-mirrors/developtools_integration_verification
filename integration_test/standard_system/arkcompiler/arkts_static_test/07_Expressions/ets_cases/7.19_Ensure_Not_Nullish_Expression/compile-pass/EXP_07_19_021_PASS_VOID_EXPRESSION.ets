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
 * @id EXP_07_19_021_PASS_VOID_EXPRESSION
 * @expect compile-pass
 * @section 7.19
 * @design 验证 ! 运算符应用于 void 类型表达式产生编译时错误
 * @note 反向用例：void 函数调用不产生值，应用 ! 预期编译时错误
 *       ⚠️ SPEC 不一致：spec 未明确规定 void! 行为，实际编译器允许通过
 *       分类：D 类（Spec 与实现不一致）
 */
function noop(): void {
}

function testVoidExpression(): void {
    let x = noop()!
}

