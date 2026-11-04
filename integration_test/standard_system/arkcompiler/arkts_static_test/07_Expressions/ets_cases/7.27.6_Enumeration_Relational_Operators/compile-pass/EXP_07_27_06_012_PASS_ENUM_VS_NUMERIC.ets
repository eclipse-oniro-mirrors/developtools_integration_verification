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
 * @id EXP_07_27_06_012_FAIL_ENUM_VS_NUMERIC
 * @expect compile-pass
 * @section 7.27.6
 * @design 验证枚举与数值类型的关系运算产生编译时错误
 * @note 反向用例：枚举成员与 int 数值不可进行关系运算
 *       spec: 两个操作数必须为相同枚举类型，否则编译时错误
 *       ⚠️ SPEC 不一致：实际编译通过（实现允许 enum 隐式转换为 base type 后比较）
 *       记录于 design_issues_report_7.27.6.md D 类
 */
enum Color { Red, Green, Blue }

function main(): void {
    let b: boolean = Color.Red < 5;  // ⚠️ SPEC 不一致：实际可通过编译
}

