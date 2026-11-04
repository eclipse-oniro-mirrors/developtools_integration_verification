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
 * @id EXP_07_16_009_FAIL_GENERIC_TYPE_ARG
 * @expect compile-fail
 * @section 7.16
 * @design 验证泛型类型参数 B<T> 不作为实例保留到 undefined，编译时错误
 * @note 反向用例：泛型类型参数在 instanceof 中不被保留到 undefined
 */
class A<T> {}
class B<T> extends A<T> {}

function foo<T>(a: A<T>): void {
  let x = new B<string>()
  console.log(x instanceof B<T>)
}
