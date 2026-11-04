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
 * @id CLS_09_05_2_007_FAIL_PROTECTED_CTOR_INSTANTIATION
 * @expect compile-fail
 * @section 9.5.2
 * @design protected构造器外部实例化导致编译错误
 * @note 反向用例：spec规定protected构造器只能在类内部和子类中调用，
 *       外部代码尝试new含protected构造器的类应产生compile-time error
 *       Spec依据：spec §9.5.2 protected成员仅在类声明体内和子类中可访问
 */
class ProtectedCtor007 {
  protected constructor() {}
}
class SubProtectedCtor extends ProtectedCtor007 {
  constructor() {
    super()
  }
}
function useProtectedCtor(): void {
  let c = new ProtectedCtor007()
}
