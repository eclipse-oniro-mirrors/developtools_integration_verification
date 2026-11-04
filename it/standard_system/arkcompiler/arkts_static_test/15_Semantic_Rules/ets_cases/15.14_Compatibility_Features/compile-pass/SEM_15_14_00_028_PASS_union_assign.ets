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
 * @id SEM_15_14_00_028_PASS_union_assign
 * @expect compile-pass
 * @section 15.14
 * @design 兼容特性：联合类型之间的赋值
 * @note 测试联合类型变量间的互相赋值
 */

// 测试联合类型赋值
function testUnionAssign(): void {
  let x: int | string = 42
  let y: string | int = x  // 联合类型赋值

  console.log(`${y}`)
}
