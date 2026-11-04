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
 * @id SEM_15_03_00_001_PASS_ARRAY_type_identity
 * @expect compile-pass
 * @section 15.3
 * @design 规范 15.3：数组类型 T1[] 和 T2[] 相同，如果 T1 和 T2 相同
 * @note 测试数组类型身份
 */

// 测试数组类型身份
function testArrayTypeIdentity(): void {
  let a1: number[] = [1, 2, 3]
  let a2: number[] = [4, 5, 6]
  
  // number[] 和 number[] 是相同类型
  a1 = a2  // OK: 相同类型
  a2 = a1  // OK: 相同类型
  
  console.log('Array type identity test passed')
}

// 测试不同类型参数的数组类型
function testDiferentArrayTypeIdentity(): void {
  let a1: number[] = [1, 2, 3]
  let a2: string[] = ['a', 'b', 'c']
    
  // number[] 和 string[] 不是相同类型
  // a1 = a2  // Error: 不同类型
    
  console.log('Different array type identity test passed')
}
