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
 * @id EXP_07_19_022_PASS_ALWAYS_NULLISH_ASSIGN
 * @expect compile-pass
 * @section 7.19
 * @design 验证编译期已知始终为 nullish 的值应用 ! 后类型不兼容导致编译时错误
 * @note 反向用例：undefined! 类型应为非空变体（never），赋值给非空类型变量预期编译时错误
 *       ⚠️ SPEC 不一致：spec 未明确规定 undefined! 的类型处理，实际编译器允许通过
 *       分类：D 类（Spec 与实现不一致）
 */
function testAlwaysNullish(): void {
    let x: int = undefined!
}

