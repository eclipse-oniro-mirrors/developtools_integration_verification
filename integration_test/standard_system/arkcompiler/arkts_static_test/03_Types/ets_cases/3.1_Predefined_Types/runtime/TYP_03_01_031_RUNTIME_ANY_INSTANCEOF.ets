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
 * @id TYP_03_01_031_RUNTIME_ANY_INSTANCEOF
 * @expect runtime
 * @section 3.1
 * @design Any 类型 instanceof 运行时类型检查
 * @note 运行时用例：实际执行验证 Any 变量在运行时的类型可识别
 */
function main(): void {
  let a: Any = 42
  // Any 持有 int 时，instanceof Object 应为 true（int 装箱后是 Object 子类）
  if (!(a instanceof Object)) {
    throw new Error("Any holding int should be instanceof Object")
  }

  a = "hello"
  if (!(a instanceof string)) {
    throw new Error("Any holding string should be instanceof string")
  }

  a = null
  // null 检查
  if (a !== null) {
    throw new Error("Any should hold null")
  }

  console.log("Any instanceof verified")
}