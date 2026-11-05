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
 * @id SEM_15_10_01_002_PASS_PARAM_COUNT_OVERLOAD
 * @expect compile-pass
 * @section 15.10.1
 * @design 验证多参数重载：不同参数数量的函数重载
 * @note 正向用例：sum(int) 和 sum(int, int) 按参数数量解析
 */
function sum(a: int): int { return a; }
function sum(a: int, b: int): int { return a + b; }
function main(): void {
    let r1: int = sum(1);
    let r2: int = sum(1, 2);
    console.log(`${r1} ${r2}`);
}
