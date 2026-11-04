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
 * @id TYP_03_19_02_004_PASS_NON_OVERLOAD_COMMON
 * @expect compile-pass
 * @section 3.19.2
 * @design 如果同名成员不是 overload，且签名相同，则可访问
 * @note 正向用例：foo2 在两个类中均是普通方法且签名相同
 */
class C4 {
  foo1(a: number): void {}
  foo2(a: string): string { return a }
}
class D4 {
  foo(a: number): void {}
  foo2(a: string): string { return a }
}

function testCommonFoo2(x: C4 | D4): void {
  let r: string = x.foo2("aa")
}