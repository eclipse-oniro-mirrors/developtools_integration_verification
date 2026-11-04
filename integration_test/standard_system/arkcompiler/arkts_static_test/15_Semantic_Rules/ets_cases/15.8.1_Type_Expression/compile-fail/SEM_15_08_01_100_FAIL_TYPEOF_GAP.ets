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
 * @id SEM_15_08_01_100_FAIL_TYPEOF_GAP
 * @expect compile-fail
 * @section 15.8.1
 * @design 验证 typeof smart cast — Spec 要求 typeof 收窄，编译器未实现
 * @note ⚠️ SPEC 不一致：typeof x === "boolean" 后 x 应收窄为 boolean，编译错误 ESE0318
 *       分类：D 类（Spec 与实现不一致）
 */
function main(): void {
    let x: int|boolean = 42;
    if (typeof x === 'boolean') {
        let b: boolean = x;
    }
}
