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
 * @id TYP_03_07_011_RUNTIME_VALUE_VS_REFERENCE
 * @expect runtime
 * @section 3.7
 * @design 值类型不共享 vs 引用类型共享对比
 * @note 运行时用例：值 vs 引用语义对比
 */
class Wrap11 {
  n: int = 0
}

function main(): void {
  // 值类型：复制独立
  let v1: int = 5
  let v2: int = v1
  v2 = 100
  if (v1 != 5) {
    throw new Error("int is value type, v1 should remain 5")
  }

  // 引用类型：共享对象
  let r1: Wrap11 = new Wrap11()
  r1.n = 5
  let r2: Wrap11 = r1
  r2.n = 100
  if (r1.n != 100) {
    throw new Error("Wrap is reference type, r1.n should be 100")
  }

  console.log("Value vs reference verified")
}