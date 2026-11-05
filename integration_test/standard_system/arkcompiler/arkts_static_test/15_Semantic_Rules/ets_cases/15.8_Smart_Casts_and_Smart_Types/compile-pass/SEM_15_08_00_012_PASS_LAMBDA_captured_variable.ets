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
 * @id SEM_15_08_00_012_PASS_LAMBDA_captured_variable
 * @expect compile-pass
 * @section 15.8
 * @design 规范 15.8：智能类型转换不适用于被 lambda 捕获并修改的局部变量
 * @note 测试 lambda 中捕获的变量不进行智能类型转换
 */

// 测试 lambda 中捕获的变量
function testLambdaCapturedVariable(): void {
  let x: string | number = 'hello'
  
  // 在 lambda 外部的类型收窄
  if (typeof x === 'string') {
    // 在这个分支中，x 的智能类型是 string
    let len: number = x.length  // OK: string 有 length 属性
    console.log('Length: ' + len)
}
  
  // Lambda 捕获变量
  let lambda: () => void = () => {
    // 在 lambda 内部，x 的智能类型可能不准确（因为可能被修改）
    console.log('Lambda: ' + x)
}
  
  lambda()
  
  // 在 lambda 调用后，x 的智能类型可能被重置
  console.log('After lambda: ' + x)
}
