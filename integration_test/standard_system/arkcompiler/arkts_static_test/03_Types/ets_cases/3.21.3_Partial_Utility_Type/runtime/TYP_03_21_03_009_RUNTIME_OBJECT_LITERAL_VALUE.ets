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
 * @id TYP_03_21_03_009_RUNTIME_OBJECT_LITERAL_VALUE
 * @expect runtime
 * @section 3.21.3
 * @design Object literal 赋 Partial 后值正确
 * @note 运行时用例：Object literal 有自己的内置 getter/setter
 */
interface I9 {
  property: number
}

function main(): void {
  let p: Partial<I9> = {property: 42}
  if (p.property != 42) {
    throw new Error("Object literal partial value failed")
  }
  console.log("Object literal partial runtime verified")
}