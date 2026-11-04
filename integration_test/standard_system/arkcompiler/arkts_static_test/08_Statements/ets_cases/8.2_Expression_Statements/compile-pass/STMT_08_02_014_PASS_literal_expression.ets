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
 * @id STMT_08_02_014_PASS_literal_expression
 * @expect compile-pass
 * @section 8.2
 * @design 测试数组字面量和各类字面量作为表达式语句，值被丢弃
 * @note 字面量表达式作为语句应编译通过，无副作用的表达式语句被允许但值被丢弃
 */

function testNumericLiteralStatement(): void {
    42;
    0;
    -1;
}

function testStringLiteralStatement(): void {
    "hello";
}

function testBooleanLiteralStatement(): void {
    true;
    false;
}

function testArrayLiteralStatement(): void {
    [1, 2, 3];
    let arr: int[] = [4, 5, 6];
    arr;
}

function testVariableAsExpressionStatement(): void {
    let x: int = 100;
    let s: string = "test";
    x;
    s;
}

function testMixedLiteralAndVariable(): void {
    10;
    "arkts";
    let v: int = 99;
    v;
    [7, 8, 9];
}
