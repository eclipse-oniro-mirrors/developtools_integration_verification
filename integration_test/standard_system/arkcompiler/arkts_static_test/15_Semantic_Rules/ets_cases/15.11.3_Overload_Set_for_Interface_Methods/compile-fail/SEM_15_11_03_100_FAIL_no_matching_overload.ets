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
 * @id SEM_15_11_03_100_FAIL_no_matching_overload
 * @expect compile-fail
 * @section 15.11.3
 * @design 接口方法重载类型拒绝：无匹配重载
 * @note 反向用例：boolean 不匹配接口方法的重载
 */
interface I { f(x: int): void; f(x: string): void; }
class C implements I { f(x: int): void {} f(x: string): void {} }
function main(): void {
    let c: C = new C();
    c.f(true);
}
