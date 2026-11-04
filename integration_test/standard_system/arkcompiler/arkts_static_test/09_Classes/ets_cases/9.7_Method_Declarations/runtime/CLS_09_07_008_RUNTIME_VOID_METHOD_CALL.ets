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
 * @id CLS_09_07_008_RUNTIME_VOID_METHOD_CALL
 * @expect runtime
 * @section 9.7
 * @design void方法调用运行时验证
 * @note 运行时用例
 */
let gCounter: int = 0
class Counter008 {
  increment(): void { gCounter = gCounter + 1 }
  reset(): void { gCounter = 0 }
}
function main(): void {
  let c: Counter008 = new Counter008()
  c.reset()
  c.increment()
  c.increment()
  if (gCounter != 2) { throw new Error("counter fail") }
  console.log("verified")
}
