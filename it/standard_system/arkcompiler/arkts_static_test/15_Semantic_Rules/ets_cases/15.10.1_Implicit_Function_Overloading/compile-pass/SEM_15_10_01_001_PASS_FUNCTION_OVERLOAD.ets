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
 * @id SEM_15_10_01_001_PASS_FUNCTION_OVERLOAD
 * @expect compile-pass
 * @section 15.10.1
 * @design 验证函数重载：同名函数不同参数类型可共存
 * @note 正向用例：foo(int) 和 foo(string) 构成重载集并按参数类型解析
 */
function foo(x: int): string { return 'int'; }
function foo(x: string): string { return 'string'; }
function main(): void {
    let r1: string = foo(42);
    let r2: string = foo('hi');
    console.log(`${r1} ${r2}`);
}
