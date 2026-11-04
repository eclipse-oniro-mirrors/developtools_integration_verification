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
 * @id SEM_15_03_00_007_PASS_UNION_type_identity
 * @expect compile-pass
 * @section 15.3
 * @design 规范 15.3：联合类型 U(T1|...|Tn) 和 V(U1|...|Um) 相同，如果 n == m 且 U 经过排列后每个 Ti 和 Ui 相同
 * @note 测试联合类型身份
 */

// 测试联合类型身份
function testUnionTypeIdentity(): void {
  let u1: number | string = 42
  let u2: string | number = 'hello'
  
  // number | string 和 string | number 是相同类型（排列后相同）
  u1 = u2  // OK: 相同类型
  u2 = u1  // OK: 相同类型
  
  console.log('Union type identity test passed')
}

// 测试不同联合类型
function testDiferentUnionTypeIdentity(): void {
  let u1: number | string = 42
  let u2: number | boolean = true
    
  // number | string 和 number | boolean 不是相同类型
  // u1 = u2  // Error: 不同类型
    
  console.log('Different union type identity test passed')
}

// 测试联合类型简化
function testUnionTypeSimplification(): void {
  let u: 'abc' | 'cde' | string
  
  // "abc" | "cde" | string 简化为 string
  u = 'test'  // OK: string
  u = 'abc'  // OK: 'abc' <: string
  u = 'cde'  // OK: 'cde' <: string
    
  console.log('Union type simplification test passed')
}
