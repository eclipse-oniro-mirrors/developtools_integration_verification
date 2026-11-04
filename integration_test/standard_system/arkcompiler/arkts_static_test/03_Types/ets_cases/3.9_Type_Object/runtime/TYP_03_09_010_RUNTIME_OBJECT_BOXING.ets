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
 * @id TYP_03_09_010_RUNTIME_OBJECT_BOXING
 * @expect runtime
 * @section 3.9
 * @design Object 装箱数值后值正确保留
 * @note 运行时用例
 */
function main(): void {
  let i: int = 42
  let o: Object = i
  if (!(o instanceof Object)) {
    throw new Error("boxed int should be Object")
  }

  // cast 回原类型
  let back: int = o as int
  if (back != 42) {
    throw new Error("unbox failed")
  }

  // double 装箱
  let d: double = 3.14
  let od: Object = d
  let dBack: double = od as double
  if (dBack != 3.14) {
    throw new Error("double unbox failed")
  }

  console.log("Object boxing verified")
}