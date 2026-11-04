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
 * @id CLS_09_07_007_RUNTIME_METHOD_DISPATCH
 * @expect runtime
 * @section 9.7
 * @design 方法调用运行时验证 — 实例方法通过对象引用调用
 * @note 运行时用例
 */
class Calc007 {
  add(a: int, b: int): int { return a + b }
  mul(a: int, b: int): int { return a * b }
}
function main(): void {
  let c: Calc007 = new Calc007()
  if (c.add(2, 3) != 5) { throw new Error("add fail") }
  if (c.mul(4, 5) != 20) { throw new Error("mul fail") }
  console.log("verified")
}
