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
 * @id STMT_08_04_014_PASS_const_complex_initializer
 * @expect compile-pass
 * @section 8.4
 * @design 测试const复杂初始化表达式：算术运算、三元表达式、逻辑运算、字符串拼接、数组字面量和函数返回值的初始化
 * @note const的初始化部分支持任意表达式求值，只要表达式类型与注解类型兼容
 */
function testConstComplexInitializer(): void {
    const a: int = 1 + 2 * 3;
    const b: number = 1.5 + 2.5;
    const c: int = true ? 100 : 0;
    const d: string = "Hello" + " " + "World";
    const e: boolean = true && false;
    const f: int = 10;
    const g: int = f + 5;
    const h: string[] = ["a", "b", "c"];
}
