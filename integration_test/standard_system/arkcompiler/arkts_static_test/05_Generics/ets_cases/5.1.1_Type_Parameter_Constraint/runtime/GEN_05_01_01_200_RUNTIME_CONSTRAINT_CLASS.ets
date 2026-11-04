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
 * @id GEN_05_01_01_200_RUNTIME_CONSTRAINT_CLASS
 * @expect runtime
 * @section 5.1.1
 * @design 带约束的泛型函数运行时验证
 * @note 运行时用例：验证约束泛型运行时行为正确
 */
function getValue<T extends Object>(x: T): T { return x; }
function main(): void {
    let r: number = getValue<number>(42);
    if (r != 42) {
    throw new Error('assertion failed: ' + r);
    console.log('verified');
}
