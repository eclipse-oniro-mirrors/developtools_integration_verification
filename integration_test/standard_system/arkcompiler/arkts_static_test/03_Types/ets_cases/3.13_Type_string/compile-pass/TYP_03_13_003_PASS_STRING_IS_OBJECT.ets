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
 * @id TYP_03_13_003_PASS_STRING_IS_OBJECT
 * @expect compile-pass
 * @section 3.13
 * @design 验证 string 是 Object 子类型
 * @note 正向用例：string 可以赋值给 Object 变量
 */
let s: string = "hello"
let o: Object = s

function main(): void {
  if (!(s instanceof Object)) throw new Error("string not instanceof Object")
  console.log("verified")
}