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
 * @id TYP_03_03_025_RUNTIME_INPLACE_TUPLE_ACCESS
 * @expect runtime
 * @section 3.3
 * @design 就地元组类型变量的索引访问与赋值
 * @note 运行时用例：验证就地元组运行时行为
 */
function main(): void {
  let t: [int, string, boolean] = [42, "hello", true]
  if (t[0] != 42) {
    throw new Error("t[0] should be 42")
  }
  if (t[1] != "hello") {
    throw new Error("t[1] should be 'hello'")
  }
  if (!t[2]) {
    throw new Error("t[2] should be true")
  }

  // 修改元组元素
  t[0] = 100
  t[1] = "world"
  t[2] = false
  if (t[0] != 100 || t[1] != "world" || t[2] != false) {
    throw new Error("tuple modify failed")
  }

  console.log("Inplace tuple access verified")
}