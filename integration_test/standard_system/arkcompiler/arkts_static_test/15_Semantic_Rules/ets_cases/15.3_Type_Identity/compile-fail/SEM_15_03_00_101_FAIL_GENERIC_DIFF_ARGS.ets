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
 * @id SEM_15_03_00_101_FAIL_GENERIC_DIFF_ARGS
 * @expect compile-fail
 * @section 15.3
 * @design 验证泛型类型不同参数不具同一性：Container<int> 和 Container<string> 不是同一类型
 * @note 反向用例：不同类型参数的泛型实例不可互相赋值
 */
class Container<T> { public val: T | undefined; }
function main(): void {
    let a: Container<int> = new Container<int>();
    let b: Container<string> = a;
}
