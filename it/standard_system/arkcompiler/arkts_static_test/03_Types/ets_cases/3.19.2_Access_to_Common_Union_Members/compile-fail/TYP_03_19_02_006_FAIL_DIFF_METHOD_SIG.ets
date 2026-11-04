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
 * @id TYP_03_19_02_006_FAIL_DIFF_METHOD_SIG
 * @expect compile-fail
 * @section 3.19.2
 * @design 联合类型同名方法签名不同不可调用
 * @note 反向用例：goo(number) 与 goo() 签名不同
 */
class A6 { goo(n: number): void {} }
class B6 { goo(): void {} }

function testDiffMethodSigFail(): void {
  let u: A6 | B6 = new A6()
  u.goo()
}