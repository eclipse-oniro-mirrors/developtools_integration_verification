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
 * @id STMT_08_02_005_PASS_expression_sequence
 * @expect compile-pass
 * @section 8.2
 * @design 测试多种表达式语句组合和连续使用
 * @note 在一个函数中连续使用多种表达式语句应编译通过
 */
let globalSum: int = 0;

function accumulate(x: int): void {
    globalSum += x;
}

function testVariousExpressions(): void {
    let a: int = 0;
    let b: int = 0;
    let flag: boolean = true;

    // 简单赋值
    a = 1;
    // 自增
    a++;
    // 复合赋值
    b += a;
    // 函数调用
    accumulate(b);
    // 条件表达式
    a = flag ? 10 : 20;
    // 数组访问
    let arr: int[] = [1, 2, 3];
    arr[0] = 99;
    // 连续赋值
    a = b = 100;
}

function testTernaryExpressionStatement(): void {
    let x: int = 0;
    let cond: boolean = false;
    x = cond ? 1 : 2;
}
