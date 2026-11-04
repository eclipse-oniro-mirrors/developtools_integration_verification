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
 * @id SEM_15_03_00_009_PASS_TYPE_ALIAS_identity
 * @expect compile-pass
 * @section 15.3
 * @design 规范 15.3：类型别名不创建新类型，只是现有类型的别名
 * @note 测试类型别名身份
 */

// 测试类型别名身份
type MyNumber = number
type MyString = string

function testTypeAliasIdentity(): void {
  let n1: number = 42
  let n2: MyNumber = 100
  
  // number 和 MyNumber 是相同类型
  n1 = n2  // OK: 相同类型
  n2 = n1  // OK: 相同类型
    
  let s1: string = 'hello'
  let s2: MyString = 'world'
    
  // string 和 MyString 是相同类型
  s1 = s2  // OK: 相同类型
  s2 = s1  // OK: 相同类型
    
  console.log('Type alias identity test passed')
}

// 测试泛型类型别名
type MyT[] = T[]

function testGenericTypeAlias(): void {
  let a1: number[] = [1, 2, 3]
  let a2: Mynumber[] = [4, 5, 6]
    
  // number[] 和 Mynumber[] 是相同类型
  a1 = a2  // OK: 相同类型
  a2 = a1  // OK: 相同类型
    
  console.log('Generic type alias test passed')
}
