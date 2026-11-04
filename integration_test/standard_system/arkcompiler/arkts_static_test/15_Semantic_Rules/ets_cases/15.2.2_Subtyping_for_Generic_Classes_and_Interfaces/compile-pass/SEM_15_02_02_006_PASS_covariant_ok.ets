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
 * @id SEM_15_02_02_006_PASS_covariant_ok
 * @expect compile-pass
 * @section 15.2.2
 * @design 协变类型参数正确：F<out T> 时 F<U0> >: F<U1>
 * @note 来自规范 15.2.2 例：let f0: F<U0> = new F<U1> OK
 */
class U0 {}
class U1 extends U0 {}
class F<out T> {}
function main(): void {
let f0: F<U0> = new F<U1>()
}
