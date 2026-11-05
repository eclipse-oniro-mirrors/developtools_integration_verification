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
 * @id EXP_07_21_06_007_PASS_BIGINT
 * @expect compile-pass
 * @section 7.21.6
 * @design 验证 bigint 类型一元负号编译通过。bigint 结果保持为 bigint。
 * @note 正向用例：-bigint 编译通过
 */
function testBigintUnaryMinus(): void {
    let x: bigint = 1n;
    let y: bigint = -x;
}
