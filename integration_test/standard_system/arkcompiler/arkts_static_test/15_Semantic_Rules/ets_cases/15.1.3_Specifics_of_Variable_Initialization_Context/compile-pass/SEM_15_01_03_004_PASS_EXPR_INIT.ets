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
 * @id SEM_15_01_03_004_PASS_EXPR_INIT
 * @expect compile-pass
 * @section 15.1.3
 * @design 验证初始化器中表达式推断：复杂表达式作为初始化器
 * @note 正向用例：函数调用的返回值作为初始化器
 */
function makeInt(): int { return 42; }
function main(): void {
    let x = makeInt();
    let y: int = x;
    console.log(`${y}`);
}
