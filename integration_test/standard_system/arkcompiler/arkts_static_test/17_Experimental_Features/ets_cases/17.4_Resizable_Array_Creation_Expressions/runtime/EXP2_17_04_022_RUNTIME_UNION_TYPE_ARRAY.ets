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
 * @id EXP2_17_04_022_RUNTIME_UNION_TYPE_ARRAY
 * @expect runtime
 * @section 17.4
 * @design 联合类型数组运行时验证：验证 new (Object|undefined)[5](undefined) 在运行时正确创建
 * @note 运行时用例：实际执行验证联合类型数组长度和元素值
 */
function main(): void {
  let arr = new (Object | undefined)[5](undefined)
  if (arr.length != 5) {
    throw new Error('assertion failed: array length should be 5')
  }
  if (arr[0] != undefined) {
    throw new Error('assertion failed: arr[0] should be undefined')
  }
  if (arr[4] != undefined) {
    throw new Error('assertion failed: arr[4] should be undefined')
  }

  // 验证联合类型数组可以赋值 Object 类型元素
  let obj: Object = {}
  arr[1] = obj
  if (arr[1] != obj) {
    throw new Error('assertion failed: arr[1] should equal the assigned Object')
  }

  console.log('PASS: union type array runtime check passed')
}
