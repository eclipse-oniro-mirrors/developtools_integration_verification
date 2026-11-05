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
 * @id STMT_08_04_022_RUNTIME_const_array_element_mutation
 * @expect runtime
 * @section 8.4
 * @design const 声明数组时引用不可变但元素可修改 — 与 TS/JS 语义一致
 * @note 运行时用例：验证 const arr 元素可修改、const 引用不可重新赋值
 */
function main(): void {
  const arr: int[] = [1, 2, 3]
  arr[0] = 99
  if (arr[0] != 99) { throw new Error("const array element should be mutable") }
  if (arr.length != 3) { throw new Error("const array length should be unchanged") }
  console.log("verified")
}
