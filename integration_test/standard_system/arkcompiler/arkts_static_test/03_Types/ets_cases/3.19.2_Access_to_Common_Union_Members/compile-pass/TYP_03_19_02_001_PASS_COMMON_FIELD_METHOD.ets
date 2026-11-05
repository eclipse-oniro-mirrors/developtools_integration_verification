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
 * @id TYP_03_19_02_001_PASS_COMMON_FIELD_METHOD
 * @expect compile-pass
 * @section 3.19.2
 * @design 联合类型共同字段和方法访问：同名字段同类型、同名方法同签名可访问
 * @note 正向用例：class A|B 中 n 和 foo() 是共同成员
 */
class A1 {
  n: number = 1
  foo(): string { return "A" }
}
class B1 {
  n: number = 2
  foo(): string { return "B" }
}

function testCommonFieldMethod(): void {
  let u: A1 | B1 = new A1()
  let x: number = u.n
  let s: string = u.foo()
}