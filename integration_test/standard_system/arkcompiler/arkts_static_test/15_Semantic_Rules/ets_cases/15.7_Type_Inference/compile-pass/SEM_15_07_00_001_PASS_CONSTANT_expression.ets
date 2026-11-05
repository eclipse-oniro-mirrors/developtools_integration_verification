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
 * @id SEM_15_07_00_001_PASS_CONSTANT_expression
 * @expect compile-pass
 * @section 15.7
 * @design 规范 15.7.1：常量表达式的类型推断
 * @note 测试常量表达式的类型推断
 */

// 测试常量表达式的类型推断
function testConstantExpressionInference(): void {
  // 数字字面量类型推断
  let x1: number = 1.0
  let x2: float = 123.0
  let x3: double = 11
  
  console.log('Constant expression inference test passed')
}

// 测试目标类型是数字类型时的类型推断
function testNumericTargetTypeInference(): void {
  let b: byte = 127  // OK: 127 适合 byte 类型
  let s: short = -32767  // OK: -32767 适合 short 类型
  let l: long = 1  // OK: 目标类型是 long，字面量默认类型是 int
    
  console.log('Numeric target type inference test passed')
}

// 测试目标类型是联合类型时的类型推断
function testUnionTargetTypeInference(): void {
  let b: byte | Object = 127  // 推断类型：byte
  let c: byte | string = 127  // 推断类型：byte
  // let c2: byte | string = 128  // Error: 128 的推断类型是 int，不是 byte 或 string 的子类型
    
  console.log('Union target type inference test passed')
}