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
 * @id TYP_03_02_005_PASS_TUPLE_DECLARE
 * @expect compile-pass
 * @section 3.2
 * @design 用户定义元组类型: [type1, type2] 声明、索引访问元素
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testTupleDeclare(): void {
  let t1: [int, string] = [1, "hello"]
  let num: int = t1[0]
  let str: string = t1[1]

  let t2: [string, boolean, int] = ["a", true, 42]
  let s: string = t2[0]
  let b: boolean = t2[1]
  let i: int = t2[2]

  let nested: [int, [string, int]] = [1, ["a", 2]]
}