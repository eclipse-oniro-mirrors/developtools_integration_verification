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
 * @id SEM_15_01_02_200_RUNTIME_ASSIGN_SEMANTICS
 * @expect runtime
 * @section 15.1.2
 * @design 验证赋值上下文运行时行为：赋值后变量值正确
 * @note 运行时用例：验证赋值语义在运行时正确
 */
function main(): void {
    let x: int;
    x = 42;
    let y: int = x;
    if (y != 42) {
        throw new Error('assertion failed: expected 42 got ' + y.toString());
    }
console.log('verified');
}
