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
 * @id GEN_05_01_201_RUNTIME_GENERIC_FUNCTION
 * @expect runtime
 * @section 5.1
 * @design 泛型函数运行时
 * @note 运行时用例：验证泛型函数调用运行时正确
 */
function identity<T>(arg: T): T {
    return arg;
}
function main(): void {
    let r = identity<number>(42);
    if (r != 42) {
    throw new Error('assertion failed: ' + r);
    }
    console.log('verified');
}
