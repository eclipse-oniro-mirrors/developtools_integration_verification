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
 * @id SEM_15_12_00_002_PASS_TYPE_ERASURE
 * @expect compile-pass
 * @section 15.12
 * @design 验证泛型类型擦除：泛型函数调用正确
 * @note 正向用例：id<int>(42) 泛型实例化后类型正确
 */
class Container<T> { public val: T | undefined; }
function id<T>(x: T): T { return x; }
function main(): void {
    let r: int = id<int>(42);
    console.log(`${r}`);
}
