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
 * @id CCY_16_04_02_GAP_090_FAIL_launch_async_inferred
 * @expect compile-fail
 * @section 16.4.2
 * @design GAP：Spec §16.4.2 示例 `launch async { await g() }` 推断语法不支持
 * @note 反向用例：验证 launch async {} 推断形式编译报错
 *       Spec 示例第 16 行：`let p2 = launch async { await g() }`
 *       ⚠️ SPEC 不一致：spec 允许省略类型参数和括号，实现要求显式类型参数和括号
 *       分类：D 类（Spec 与实现不一致）
 */
async function g(): Promise<void> {}
async function f(): Promise<void> {
    let p2 = launch async { await g(); };
}
