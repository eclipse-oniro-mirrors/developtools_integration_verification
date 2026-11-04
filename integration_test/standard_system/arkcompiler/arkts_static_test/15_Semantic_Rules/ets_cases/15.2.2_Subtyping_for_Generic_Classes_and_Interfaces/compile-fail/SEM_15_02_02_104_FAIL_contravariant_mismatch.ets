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
 * @id SEM_15_02_02_104_FAIL_contravariant_mismatch
 * @expect compile-fail
 * @section 15.2.2
 * @design 逆变类型参数错误：E<in T> 时 E<U0> 不是 E<U1> 的超类型
 * @note 来自规范 15.2.2 例：let e0: E<U0> = new E<U1> 编译错误
 */
class U0 {}
class U1 extends U0 {}
class E<in T> {}
function main(): void {
let e0: E<U0> = new E<U1>()
}
