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
 * @id EXP_07_28_02_003_PASS_METHOD_REF_EQ
 * @expect compile-pass
 * @section 7.28.2
 * @design 方法引用相等（含绑定实例）
 * @note 正向用例：验证该特性编译通过的正确用法。
 */
class A { method(): void {} }
function testMethodRefEq(): void {
  let a1: A = new A(); let a2: A = new A()
  let e1: boolean = a1.method == a1.method
  let e2: boolean = a1.method == a2.method
  console.log(e1.toString(), e2.toString())
}
