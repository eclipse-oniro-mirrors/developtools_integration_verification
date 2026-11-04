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
 * @id TYP_03_17_02_021_RUNTIME_UNSAFE_GET
 * @expect runtime
 * @section 3.17.2
 * @design 验证 unsafeGet 方法正常访问（spec/types.md:1264-1276）
 * @note 运行时用例：unsafeGet 返回正确值，返回类型为 Any
 */
function main(): void {
  let a: [string, string] = ["aa", "bb"]
  let t: Tuple = a
  let elem: Any = t.unsafeGet(1)
  if (elem !== "bb") throw new Error("elem should be 'bb'")

  let elem0: Any = t.unsafeGet(0)
  if (elem0 !== "aa") throw new Error("elem0 should be 'aa'")

  console.log("verified")
}