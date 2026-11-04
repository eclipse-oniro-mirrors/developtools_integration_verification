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
 * @id LEX_02_09_09_018_RT_NULL_OBJ_PROPERTY
 * @expect runtime
 * @section 2.9.9
 * @design null 在对象属性访问中
 * @note runtime 用例：验证 null 在对象属性访问中的运行时行为
 */

interface Obj {
  name: string
  value: int | null
}

function main(): void {
  // null 在对象属性访问中
  let obj: Obj = { name: "test", value: null }
  let x: int | null = obj.value
  if (x !== null) {
    throw new Error("obj property failed, got " + x)
  }
}
