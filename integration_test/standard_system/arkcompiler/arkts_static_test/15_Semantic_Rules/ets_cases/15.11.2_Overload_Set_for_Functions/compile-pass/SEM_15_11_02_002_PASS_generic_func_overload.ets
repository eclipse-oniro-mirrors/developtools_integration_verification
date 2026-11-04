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
 * @id SEM_15_11_02_002_PASS_generic_func_overload
 * @expect compile-pass
 * @section 15.11.2
 * @design 泛型函数重载
 * @note ⽐正向用例
 */
function ident<T>(x: T): T { return x; }
function ident<T>(x: T, y: T): T { return y; }
function main(): void {
    let a: int = ident(1);
    console.log(a.toString());
}
