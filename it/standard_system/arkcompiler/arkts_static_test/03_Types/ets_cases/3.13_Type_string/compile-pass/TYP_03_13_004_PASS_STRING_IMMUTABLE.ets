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
 * @id TYP_03_13_004_PASS_STRING_IMMUTABLE
 * @expect compile-pass
 * @section 3.13
 * @design 验证 string 不可变性——重新赋值创建新对象
 * @note 正向用例：string 变量可重新赋值（创建新 string 对象）
 */
let s: string = "hello"
s = "world"

function main(): void {
  if (s !== "world") throw new Error("string reassign failed")
  console.log("verified")
}