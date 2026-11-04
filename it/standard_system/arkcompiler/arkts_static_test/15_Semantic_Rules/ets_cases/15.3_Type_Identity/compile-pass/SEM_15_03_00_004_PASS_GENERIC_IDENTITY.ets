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
 * @id SEM_15_03_00_004_PASS_GENERIC_IDENTITY
 * @expect compile-pass
 * @section 15.3
 * @design 验证泛型类型实例化同一性：Container<int> 和 Container<int> 是同一类型
 * @note 正向用例：相同类型参数实例化的泛型类型相同
 */
class Container<T> { public val: T | undefined; }
function main(): void {
    let a: Container<int> = new Container<int>();
    let b: Container<int> = a;
    console.log(`val=${b.val}`);
}
