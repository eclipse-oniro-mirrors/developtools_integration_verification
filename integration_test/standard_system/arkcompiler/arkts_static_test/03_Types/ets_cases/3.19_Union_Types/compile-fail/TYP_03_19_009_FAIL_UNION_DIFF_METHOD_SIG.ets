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
 * @id TYP_03_19_009_FAIL_UNION_DIFF_METHOD_SIG
 * @expect compile-fail
 * @section 3.19
 * @design 联合类型同名方法不同签名应产生编译时错误
 * @note 反向用例：验证同名方法不同签名不可调用
 */
class A9 {
  goo(n: number): void {}
}

class B9 {
  goo(): void {}
}

function main(): void {
  let u: A9 | B9 = new A9()
  u.goo()
}