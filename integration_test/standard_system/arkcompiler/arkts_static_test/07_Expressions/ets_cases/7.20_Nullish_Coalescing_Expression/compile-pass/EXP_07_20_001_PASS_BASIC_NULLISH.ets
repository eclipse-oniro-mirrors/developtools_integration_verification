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
 * @id EXP_07_20_001_PASS_BASIC_NULLISH
 * @expect compile-pass
 * @section 7.20
 * @design 验证 undefined ?? "default" 基本空值合并语法编译通过。
 *         LHS 为 undefined，表达式取 RHS。
 * @note 正向用例：验证 ?? 基本语法编译通过
 */
function testBasicNullish(): void {
    let x: string = undefined ?? 'default';
}
