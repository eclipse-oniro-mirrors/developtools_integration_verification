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
 * @id EXP_07_20_006_PASS_WITH_PARENS
 * @expect compile-pass
 * @section 7.20
 * @design 验证 n ?? (a || b) 带括号的 ?? 与 || 混合编译通过。
 *         括号隔离了 || 操作，避免 ?? 与 || 混用错误。
 * @note 正向用例：括号隔离 || 后编译通过
 */
function testWithParens(): void {
    let n: boolean | undefined = true;
    let a: boolean = false;
    let b: boolean = true;
    let x: boolean = n ?? (a || b);
}
