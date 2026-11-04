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
/*
 * @id SEM_15_07_00_003_PASS_RETURN_type_inference
 * @expect compile-pass
 * @section 15.7
 * @design 规范 15.7.2：返回类型可以从函数体中的返回语句推断
 * @note 测试返回类型推断
 */

// 测试返回类型推断
function testReturnTypeInference(): void {
  // 没有返回语句，推断为 void
  function foo1(): void {
    console.log('foo1')
}
  
  // 所有返回语句有相同的表达式类型 R，推断为 R
  function foo2() {
    return 'hello'
  }
  let result2: string = foo2()  // OK: 推断返回类型是 string
  
  // 有多个返回语句，推断为联合类型
  function foo3(condition: boolean) {
    if (condition) {
    return 1
  } else {
    return 'hello'
  }
  let result3: number | string = foo3(true)  // OK: 推断返回类型是 number | string
  
  // 有 throw 语句，推断为 never
  function foo4(): never {
    throw new Error('error')
  
}
console.log('Return type inference test passed')
}

// 测试异步函数的返回类型推断
async function testAsyncReturnTypeInference(): Promise<void> {
  // 异步函数，推断返回类型是 Promise<T>
  async function foo() {
    return 42
  }
    
  let result: Promise<number> = foo()  // OK: 推断返回类型是 Promise<number>
    
  console.log('Async return type inference test passed')
}