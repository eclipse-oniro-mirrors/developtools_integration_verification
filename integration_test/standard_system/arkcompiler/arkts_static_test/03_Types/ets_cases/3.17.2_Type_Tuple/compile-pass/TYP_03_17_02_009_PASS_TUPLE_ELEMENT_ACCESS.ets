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
 * @id TYP_03_17_02_009_PASS_TUPLE_ELEMENT_ACCESS
 * @expect compile-pass
 * @section 3.17.2
 * @design 验证元组常量索引访问元素（spec/types.md:1177-1190）
 * @note 正向用例：tuple[0], tuple[1] 等常量索引访问
 */
function main(): void {
  let tuple: [number, number, string, boolean, Object] = [6, 7, "abc", true, 42]
  let first: number = tuple[0]
  let second: number = tuple[1]
  let third: string = tuple[2]
  console.log("verified")
}