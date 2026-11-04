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
 * @id STMT_08_02_001_PASS_assignment_expression
 * @expect compile-pass
 * @section 8.2
 * @design 测试赋值表达式作为语句，包括简单赋值、链式赋值、条件赋值和解构赋值
 * @note 表达式语句中赋值表达式应编译通过，结果被丢弃
 */
function testSimpleAssignment(): void {
    let x: int = 0;
    x = 10;
    x = -20;
    x = x + 5;
}

function testChainedAssignment(): void {
    let a: int = 0;
    let b: int = 0;
    let c: int = 0;
    a = b = c = 42;
}

function testConditionalAssignment(): void {
    let x: int = 0;
    let flag: boolean = true;
    x = flag ? 100 : 200;
}

function testAssignmentWithExpression(): void {
    let x: int = 5;
    let y: int = 10;
    x = x * y + 3;
}
