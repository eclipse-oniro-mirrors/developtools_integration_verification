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
 * @id EXP_07_04_02_003_PASS_METHOD_REF_BINDING
 * @expect compile-pass
 * @section 7.4.2
 * @design 方法引用实例绑定：验证不同实例的方法引用各自绑定互不影响
 * @note 正向用例：验证 m1 绑定到 c1，m2 绑定到 c2，两者独立编译通过
 */
class C {
  public field: number = 123
  method(): number {
    return this.field
  }
}

let c1 = new C()
let c2 = new C()
let m1 = c1.method  // c1 被绑定
let m2 = c2.method  // c2 被绑定
