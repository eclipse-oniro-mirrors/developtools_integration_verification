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
 * @id EXP_07_04_02_007_FAIL_IMPLICIT_OVERLOADED_METHOD_REF
 * @expect compile-fail
 * @section 7.4.2
 * @design 隐式重载方法名引用：验证隐式重载方法名作为引用应产生编译时错误
 * @note 反向用例：bar 是隐式重载方法名，作为引用应报编译时错误
 */
class C {
  bar(n: number): void {}
  bar(s: string): void {}
}

let c = new C()
let b = c.bar  // Compile-time error: overloaded method name cannot be used as reference
