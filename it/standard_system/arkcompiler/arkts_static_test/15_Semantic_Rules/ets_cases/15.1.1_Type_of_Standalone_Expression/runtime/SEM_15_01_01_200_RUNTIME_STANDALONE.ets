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
 * @id SEM_15_01_01_200_RUNTIME_STANDALONE
 * @expect runtime
 * @section 15.1.1
 * @design 验证独立表达式运行时类型行为：整数字面量作为独立表达式推断正确
 * @note 运行时用例：独立推断的 int 类型变量在运行时值正确
 */
function main(): void {
    let x = 42;
    let y = 3.14;
    let z = x + 1;
    if (z != 43) { throw new Error('assertion failed: ' + z.toString()); }
console.log('verified');
}
