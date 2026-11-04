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
 * @id TYP_03_17_013_RUNTIME_TUPLE_AS_TUPLE
 * @expect runtime
 * @section 3.17
 * @design 验证元组作为 Tuple 类型运行时行为
 * @note 运行时用例：实际执行验证元组类型
 */
function main(): void {
  let tuple: [number, string] = [1, "hello"]
  let t: Tuple = tuple

  console.log("verified")
}
