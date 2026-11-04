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
 * @id TYP_03_07_009_RUNTIME_REFERENCE_SHARED_STATE
 * @expect runtime
 * @section 3.7
 * @design 多引用共享对象状态：一个修改另一个可见（spec §3.7 核心语义）
 * @note 运行时用例：spec §3.7 引用共享语义
 */
class Counter9 {
  count: int = 0
}

function main(): void {
  let c1: Counter9 = new Counter9()
  let c2: Counter9 = c1   // 同一对象

  c1.count = 100
  if (c2.count != 100) {
    throw new Error("c2 should see c1's modification")
  }

  c2.count = 200
  if (c1.count != 200) {
    throw new Error("c1 should see c2's modification")
  }

  console.log("Reference shared state verified")
}