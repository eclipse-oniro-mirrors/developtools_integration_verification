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
 * @id SEM_15_02_03_001_PASS_STRING_LITERAL_SUBTYPE
 * @expect compile-pass
 * @section 15.2.3
 * @design 验证字符串字面量类型是其基础类型 string 的子类型
 * @note 正向用例："hello" 字面量类型 <: string，可赋值给 string
 */
function acceptString(s: string): string { return s.toUpperCase(); }
function main(): void {
    let literal: 'hello' = 'hello';
    let str: string = literal;
    let result: string = acceptString(literal);
    console.log(`Result: ${result}`);
}
