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
 * @id SEM_15_01_07_200_RUNTIME_TYPE_PARAM
 * @expect runtime
 * @section 15.1.7
 * @design 验证类型参数运行时行为：泛型函数运行时派发正确
 * @note 运行时用例：identity 函数在类型参数实例化后运行正确
 */
function identity<T>(x: T): T { return x; }
function main(): void {
    let r: int = identity<int>(42);
    if (r != 42) { throw new Error('assertion failed: ' + r.toString()); }
console.log('verified');
}
