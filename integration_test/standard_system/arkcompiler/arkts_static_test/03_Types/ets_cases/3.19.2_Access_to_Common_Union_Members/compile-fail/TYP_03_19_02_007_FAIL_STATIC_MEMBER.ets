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
 * @id TYP_03_19_02_007_FAIL_STATIC_MEMBER
 * @expect compile-fail
 * @section 3.19.2
 * @design 静态成员不是 non-static common member，不可通过 union type alias 访问
 * @note 反向用例：AB.foo() 是静态方法访问，应报错
 */
class A7 { static foo(): void {} }
class B7 { static foo(): void {} }

type AB7 = A7 | B7

function testStaticFail(): void {
  AB7.foo()
}