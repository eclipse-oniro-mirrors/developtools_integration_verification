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
 * @id TYP_03_08_009_RUNTIME_ANY_INSTANCEOF
 * @expect runtime
 * @section 3.8
 * @design Any 持有不同类型时 instanceof 可识别
 * @note 运行时用例：类型识别
 */
function main(): void {
  let a: Any = 42
  if (!(a instanceof Object)) {
    throw new Error("Any holding int should be Object")
  }

  a = "hello"
  if (!(a instanceof string)) {
    throw new Error("Any holding string instanceof failed")
  }

  a = null
  if (a !== null) {
    throw new Error("Any null check failed")
  }

  a = undefined
  if (a !== undefined) {
    throw new Error("Any undefined check failed")
  }

  console.log("Any instanceof verified")
}