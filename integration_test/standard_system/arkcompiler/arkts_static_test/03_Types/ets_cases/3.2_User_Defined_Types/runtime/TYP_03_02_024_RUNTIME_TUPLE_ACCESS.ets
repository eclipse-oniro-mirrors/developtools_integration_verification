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
 * @id TYP_03_02_024_RUNTIME_TUPLE_ACCESS
 * @expect runtime
 * @section 3.2
 * @design 元组类型运行时索引访问和元素读写
 * @note 运行时用例：实际执行验证元组结构操作
 */
function main(): void {
  let t: [int, string, boolean] = [42, "hello", true]
  let num: int = t[0]
  let str: string = t[1]
  let flag: boolean = t[2]

  if (num != 42) {
    throw new Error("t[0] should be 42")
  }
  if (str != "hello") {
    throw new Error("t[1] should be 'hello'")
  }
  if (!flag) {
    throw new Error("t[2] should be true")
  }

  // 修改元组元素
  t[0] = 100
  if (t[0] != 100) {
    throw new Error("t[0] modify failed")
  }

  let pair: [string, int] = ["age", 30]
  if (pair[0] != "age" || pair[1] != 30) {
    throw new Error("pair access failed")
  }

  console.log("Tuple access verified")
}