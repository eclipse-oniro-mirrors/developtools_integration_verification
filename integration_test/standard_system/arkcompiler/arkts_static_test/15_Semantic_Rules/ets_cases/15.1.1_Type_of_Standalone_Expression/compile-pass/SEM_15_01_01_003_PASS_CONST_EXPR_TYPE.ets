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
 * @id SEM_15_01_01_003_PASS_CONST_EXPR_TYPE
 * @expect compile-pass
 * @section 15.1.1
 * @design 验证常量表达式的类型从操作数和操作推断
 * @note 正向用例：算术常量表达式应推断为正确的数值类型
 */
function main(): void {
    let a: int = 10 + 20;   // const expr: int + int → int
    let b: double = 3.14 * 2; // const expr: double * int → double
    let c: boolean = 10 > 5; // const expr: relational → boolean
    console.log(`a=${a}, b=${b}, c=${c}`);
}
