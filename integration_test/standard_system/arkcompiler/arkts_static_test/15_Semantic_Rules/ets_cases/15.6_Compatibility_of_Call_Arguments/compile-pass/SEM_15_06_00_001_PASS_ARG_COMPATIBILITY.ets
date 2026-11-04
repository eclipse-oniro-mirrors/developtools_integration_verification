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
 * @id SEM_15_06_00_001_PASS_ARG_COMPATIBILITY
 * @expect compile-pass
 * @section 15.6
 * @design 验证调用参数类型兼容：参数类型与声明类型匹配时通过
 * @note 正向用例：int 参数传 int 声明，string 参数传 string 声明
 */
function greet(name: string, times: int): string {
    let result: string = '';
    for (let i: int = 0; i < times; i++) { result = result + name; }
    return result;
}
function main(): void {
    let r: string = greet('hi', 3);
    console.log(`r=${r}`);
}
