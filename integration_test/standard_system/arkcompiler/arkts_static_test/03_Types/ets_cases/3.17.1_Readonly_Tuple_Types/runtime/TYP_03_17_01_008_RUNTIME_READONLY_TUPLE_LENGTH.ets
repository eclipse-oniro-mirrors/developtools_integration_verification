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
 * @id TYP_03_17_01_008_RUNTIME_READONLY_TUPLE_LENGTH
 * @expect runtime
 * @section 3.17.1
 * @design 验证只读元组长度属性运行时行为
 * @note 运行时用例：实际执行验证只读元组长度
 */
function main(): void {
  let tuple: readonly [number, string, boolean] = [1, "hello", true]

  if (tuple.length !== 3) throw new Error("length should be 3")

  console.log("verified")
}
