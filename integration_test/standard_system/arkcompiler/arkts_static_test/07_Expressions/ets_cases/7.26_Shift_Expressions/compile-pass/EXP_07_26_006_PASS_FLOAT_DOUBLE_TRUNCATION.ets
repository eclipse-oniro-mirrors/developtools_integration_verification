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
 * @id EXP_07_26_006_PASS_FLOAT_DOUBLE_TRUNCATION
 * @expect compile-pass
 * @section 7.26
 * @design double/float 操作数在移位运算中先截断为 long/int 后再移位
 * @note 正向用例：验证 double 截断为 long、float 截断为 int 后执行移位
 *       double 左操作数 → long 结果类型
 *       float 左操作数 → int 结果类型
 */
function main(): void {
    let d: double = 16.7;
    let f: float = Double.toFloat(8.3);
    let shift: int = 2;

    // double 左操作数截断为 long（结果类型为 long）
    let r1: long = d << shift;
    let r2: long = d >> shift;
    let r3: long = d >>> shift;

    // float 左操作数截断为 int（结果类型为 int）
    let r4: int = f << shift;
    let r5: int = f >> shift;
    let r6: int = f >>> shift;

    // double 作为右操作数（截断为 long，取低 6 位）
    let dShift: double = 2.3;
    let r7: int = 16 << dShift;

    console.log('results: ' + r1 + ' ' + r2 + ' ' + r3 + ' ' + r4 + ' ' + r5 + ' ' + r6 + ' ' + r7);
}
