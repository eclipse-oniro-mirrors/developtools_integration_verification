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
 * @id EXP_07_20_005_PASS_CHAINED
 * @expect compile-pass
 * @section 7.20
 * @design 验证多重链式 ?? 表达式 a ?? b ?? c 编译通过。
 *         左结合：先计算 a ?? b，结果再 ?? c。
 * @note 正向用例：链式 ?? 编译通过
 */
function testChained(): void {
    let a: string | undefined = undefined;
    let b: string | undefined = undefined;
    let x: string = a ?? b ?? 'last';
}
