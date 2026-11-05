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
 * @id EXP_07_21_06_008_PASS_NEGATE_INT_MIN
 * @expect compile-pass
 * @section 7.21.6
 * @design 验证 -int.MIN_VALUE 编译通过。
 *         spec 规定 int.MIN_VALUE 求反溢出但不报错（包装行为）。
 * @note 正向用例：-int.MIN 静默包装
 */
function testNegateIntMin(): void {
    let x: int = -2147483648;
    let y: int = -x;  // 溢出包装不报错
}
