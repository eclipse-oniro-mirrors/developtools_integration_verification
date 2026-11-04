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
 * @id SEM_15_01_04_200_RUNTIME_NUMERIC_OPS
 * @expect runtime
 * @section 15.1.4
 * @design 验证数值运算符运行时行为
 * @note 运行时用例：数值运算结果正确
 */
function main(): void {
    let a: int = 10;
    let b: int = 20;
    let c: int = a + b;
    let d: int = b - a;
    if (c != 30) { throw new Error('add failed'); }
    if (d != 10) { throw new Error('sub failed'); }
console.log('verified');
}
