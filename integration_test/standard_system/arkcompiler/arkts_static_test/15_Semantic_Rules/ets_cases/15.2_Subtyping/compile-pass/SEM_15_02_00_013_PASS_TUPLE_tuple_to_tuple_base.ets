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
 * @id SEM_15_02_00_013_PASS_TUPLE_tuple_to_tuple_base
 * @expect compile-pass
 * @section 15.2
 * @design 规范 15.2.4：元组类型 T(P1,...,Pn) 是元组类型 S(P1,...,Pm) 的子类型，其中 n >= m
 * @note 测试元组类型的子类型关系：更长的元组是更短元组的子类型
 */

function testTupleSubtype(): void {
  let shortTuple: [number] = [1]
  let longTuple: [number, string] = [1, 'hello']
  let longerTuple: [number, string, boolean] = [1, 'hello', true]
  
  // [number, string] 是 [number] 的子类型（n >= m）
  shortTuple = longTuple  // OK: [number, string] <: [number]
  
  // [number, string, boolean] 是 [number, string] 的子类型
  longTuple = longerTuple  // OK: [number, string, boolean] <: [number, string]
  
  console.log(shortTuple[0])
  console.log(longTuple[0], longTuple[1])
}
