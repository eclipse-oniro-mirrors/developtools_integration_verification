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
 * @id EXP_07_20_007_PASS_EMPTY_STRING_FALSE
 * @expect compile-pass
 * @section 7.20
 * @design 验证空串变量 ?? "fall" 和 false 变量 ?? true 编译通过。
 *         空串和 false 不是 nullish 值，不会触发取 RHS。
 * @note 正向用例：falsy 但非 nullish 值编译通过
 */
function testEmptyString(): void {
    let s: string = '';
    let x: string = s ?? 'fallback';
}

function testFalse(): void {
    let f: boolean = false;
    let y: boolean = f ?? true;
}
