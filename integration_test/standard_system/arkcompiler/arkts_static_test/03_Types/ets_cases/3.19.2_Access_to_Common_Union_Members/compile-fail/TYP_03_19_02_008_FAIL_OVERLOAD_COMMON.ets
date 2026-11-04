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
 * @id TYP_03_19_02_008_FAIL_OVERLOAD_COMMON
 * @expect compile-fail
 * @section 3.19.2
 * @design 任一 Ti 中成员 m 是 overload 声明时，访问 u.m 应编译失败
 * @note 反向用例：C8 中 foo 是 explicit overload，D8 中 foo 是普通方法
 */
class C8 {
  foo1(a: number): void {}
  foo2(a: string): void {}
  overload foo { foo1, foo2 }
}
class D8 {
  foo(a: number): void {}
  foo2(a: string): void {}
}

function testOverloadFail(x: C8 | D8): void {
  x.foo(1.0)
}