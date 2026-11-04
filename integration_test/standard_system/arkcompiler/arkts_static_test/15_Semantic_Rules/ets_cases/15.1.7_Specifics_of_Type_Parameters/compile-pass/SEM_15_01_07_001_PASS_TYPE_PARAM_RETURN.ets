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
 * @id SEM_15_01_07_001_PASS_TYPE_PARAM_RETURN
 * @expect compile-pass
 * @section 15.1.7
 * @design 验证类型参数作为返回值类型：泛型函数返回类型参数类型
 * @note 正向用例：identity<int>(42) 返回 int 类型
 */
function identity<T>(x: T): T { return x; }
function main(): void {
    let r: int = identity<int>(42);
    console.log(`${r}`);
}
