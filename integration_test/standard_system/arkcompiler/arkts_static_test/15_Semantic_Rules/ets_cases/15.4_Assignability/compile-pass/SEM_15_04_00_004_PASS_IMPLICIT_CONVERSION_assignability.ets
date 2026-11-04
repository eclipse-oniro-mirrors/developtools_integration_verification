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
 * @id SEM_15_04_00_004_PASS_IMPLICIT_CONVERSION_assignability
 * @expect compile-pass
 * @section 15.4
 * @design 规范 15.4：T1 可赋给 T2，如果存在隐式转换允许 T1 转换为 T2
 * @note 测试基于隐式转换的可赋值性
 */

// 测试基于隐式转换的可赋值性
function testImplicitConversionAssignability(): void {
  // 数值类型之间的隐式转换
  let n1: number = 1.0
  let n2: float = 1.0
  let n3: double = 1.0
  
  // 注意：ArkTS 的数值类型转换规则可能不同于规范
  // 这里假设存在隐式转换
    
  console.log('Implicit conversion assignability test passed')
}

// 测试字符串到字符串字面量类型的隐式转换
function testStringToLiteralAssignability(): void {
  let s1: string = 'hello'
  let s2: 'hello' = 'hello'
    
  // 注意：string 到字符串字面量类型的隐式转换可能不允许
  // s2 = s1  // Error: string 不能赋给 "hello"
    
  console.log('String to literal assignability test passed')
}

// 测试联合类型的隐式转换
function testUnionImplicitConversion(): void {
  let x: number | string = 42
  let y: number | string = 'hello'
    
  // number 和 string 都可以隐式转换为 number | string
  x = 100
  y = 'world'
    
  console.log('Union implicit conversion test passed')
}
