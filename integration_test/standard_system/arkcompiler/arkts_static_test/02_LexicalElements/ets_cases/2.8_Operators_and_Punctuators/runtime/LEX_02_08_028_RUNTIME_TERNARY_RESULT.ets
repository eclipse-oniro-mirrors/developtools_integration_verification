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
 * @id LEX_02_08_028_RUNTIME_TERNARY_RESULT
 * @expect runtime
 * @section 2.8
 * @design 三元运算符 ? : 根据条件选择分支
 * @note 运行时用例：实际执行验证语义正确性
 */
function main(): void {
  let r1: number = (5 > 3) ? 100 : 200
  if (r1 !== 100) { throw new Error("ternary true branch failed") }
  let r2: string = (1 === 2) ? "yes" : "no"
  if (r2 !== "no") { throw new Error("ternary false branch failed") }
  let n: number = 7
  let parity: string = (n % 2 === 0) ? "even" : "odd"
  if (parity !== "odd") { throw new Error("ternary nested expr failed") }
}
