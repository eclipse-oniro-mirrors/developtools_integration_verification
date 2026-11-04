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
 * @id EXP_07_27_06_011_FAIL_DIFFERENT_ENUM
 * @expect compile-fail
 * @section 7.27.6
 * @design 验证不同类型枚举的成员关系运算产生编译时错误
 * @note 反向用例：E1 和 E2 是不同的枚举类型，无法进行关系运算
 *       spec: 两个操作数必须为相同枚举类型，否则编译时错误
 */
enum E1 { A, B }
enum E2 { C, D }

function main(): void {
    let b: boolean = E1.A < E2.C;  // Compile-time error: different enum types
}
