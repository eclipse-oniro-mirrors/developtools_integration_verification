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
 * @id SEM_15_07_01_002_PASS_BOOL_CONST_EXPR
 * @expect compile-pass
 * @section 15.7.1
 * @design 验证布尔常量表达式类型推断：关系运算推断为 boolean
 * @note 正向用例：10 > 5 推断为 boolean
 */
function main(): void {
    let c: boolean = 10 > 5;
    let d: boolean = (3 + 4) == 7;
    console.log(`c=${c}, d=${d}`);
}
