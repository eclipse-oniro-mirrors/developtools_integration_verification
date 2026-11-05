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
 * @id EXP_07_20_004_PASS_NULLABLE_VARIABLE
 * @expect compile-pass
 * @section 7.20
 * @design 验证 T | undefined 和 T | null 类型变量 ?? default 编译通过。
 *         验证类型推导为 normalized union（非 nullish 变体 | RHS 类型）。
 * @note 正向用例：可空变量 ?? default
 */
function testNullableUndefined(): void {
    let a: string | undefined = undefined;
    let x: string = a ?? 'fallback';
}

function testNullableNull(): void {
    let b: string | null = null;
    let y: string = b ?? 'fallback';
}
