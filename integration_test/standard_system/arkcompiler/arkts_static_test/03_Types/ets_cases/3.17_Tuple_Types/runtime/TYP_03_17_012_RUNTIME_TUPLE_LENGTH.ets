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
 * @id TYP_03_17_012_RUNTIME_TUPLE_LENGTH
 * @expect runtime
 * @section 3.17
 * @design 验证元组长度属性运行时行为
 * @note 运行时用例：实际执行验证元组长度
 */
function main(): void {
  let tuple: [number, string] = [1, ""]

  if (tuple.length !== 2) throw new Error("length should be 2")

  let tuple2: [number, number, string, boolean] = [1, 2, "abc", true]
  if (tuple2.length !== 4) throw new Error("length should be 4")

  console.log("verified")
}
