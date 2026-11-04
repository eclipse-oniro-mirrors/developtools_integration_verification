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
 * @id STMT_08_02_002_PASS_increment_decrement
 * @expect compile-pass
 * @section 8.2
 * @design 测试自增自减表达式作为语句，包括前缀和后缀形式
 * @note 自增自减表达式作为语句应编译通过，结果被丢弃
 */
function testPrefixIncrement(): void {
    let x: int = 0;
    ++x;
    ++x;
}

function testPostfixIncrement(): void {
    let x: int = 0;
    x++;
    x++;
}

function testPrefixDecrement(): void {
    let x: int = 10;
    --x;
    --x;
}

function testPostfixDecrement(): void {
    let x: int = 10;
    x--;
    x--;
}

function testMixedIncrementDecrement(): void {
    let x: int = 5;
    ++x;
    x++;
    --x;
    x--;
}
