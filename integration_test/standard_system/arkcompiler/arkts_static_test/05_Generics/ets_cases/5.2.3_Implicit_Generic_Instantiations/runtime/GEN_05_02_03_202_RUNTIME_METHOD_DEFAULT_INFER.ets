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
 * @id GEN_05_02_03_202_RUNTIME_METHOD_DEFAULT_INFER
 * @expect runtime
 * @section 5.2.3
 * @design 方法默认类型参数隐式推断
 * @note spec: a.foo(new X2) infers U=X2, a.bar() uses class type arg X1
 */
class A213<T> {
  foo<U = T>(p: U): U { return p }
}
function main(): void {
  let a213 = new A213<string>()
  let r1: string = a213.foo('hello')
  if (r1 != 'hello') {
    throw new Error('method default infer failed')
  console.log('method default inference runtime verified')
}