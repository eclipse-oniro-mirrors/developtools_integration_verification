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
 * @id SEM_15_01_03_200_RUNTIME_INIT
 * @expect runtime
 * @section 15.1.3
 * @design 验证变量初始化运行时行为
 * @note 运行时用例：初始化后变量值正确
 */
function main(): void {
    let x: int = 42;
    let y = x + 1;
    if (y != 43) {
        throw new Error('assertion failed: expected 43 got ' + y.toString());
    }
console.log('verified');
}
