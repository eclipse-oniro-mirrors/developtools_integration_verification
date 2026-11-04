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
 * @id TYP_03_19_010_FAIL_UNION_STATIC_METHOD
 * @expect compile-fail
 * @section 3.19
 * @design 通过联合类型访问静态方法应产生编译时错误
 * @note 反向用例：验证静态方法不能通过联合类型调用
 */
class A10 {
  static foo(): void {}
}

class B10 {
  static foo(): void {}
}

type AB10 = A10 | B10

function main(): void {
  AB10.foo()
}