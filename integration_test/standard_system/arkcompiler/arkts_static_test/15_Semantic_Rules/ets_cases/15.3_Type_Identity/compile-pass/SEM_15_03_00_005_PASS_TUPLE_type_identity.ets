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
 * @id SEM_15_03_00_005_PASS_TUPLE_type_identity
 * @expect compile-pass
 * @section 15.3
 * @design 规范 15.3：元组类型 T(P1,...,Pn) 和 S(P1,...,Pm) 相同，如果 n == m 且每个 Ti 和 Si 相同
 * @note 测试元组类型身份
 */

// 测试元组类型身份
function testTupleTypeIdentity(): void {
  let t1: [number] = [1]
  let t2: [number] = [2]
  
  // 相同元组类型
  t1 = t2  // OK: 相同类型
  
  let t3: [number, string] = [1, 'hello']
  let t4: [number, string] = [2, 'world']
  
  // 相同元组类型
  t3 = t4  // OK: 相同类型
  
  console.log('Tuple type identity test passed')
}

// 测试不同元组类型
function testDiferentTupleTypeIdentity(): void {
  let t1: [number] = [1]
  let t2: [number, string] = [1, 'hello']
  
  // 不同元组类型
  // t1 = t2  // Error: 不同类型
  
  console.log('Different tuple type identity test passed')
}
