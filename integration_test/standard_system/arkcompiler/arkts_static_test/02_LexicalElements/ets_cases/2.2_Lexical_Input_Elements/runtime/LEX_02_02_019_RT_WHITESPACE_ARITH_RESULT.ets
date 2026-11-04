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
 * @id LEX_02_02_019_RT_WHITESPACE_ARITH_RESULT
 * @expect runtime
 * @section 2.2
 * @design 不同空白风格(无空白/单空白/多空白)的算术表达式结果一致 * @note 运行时用例：实际执行验证语义正确性

 */
function main(): void {
  let a: int = 10
  let b: int = 3
  let r1: int = a + b
  let r2: int = a+b
  let r3: int = a  +   b
  if (r1 !== 13) { throw new Error("r1 !== 13") }
  if (r2 !== 13) { throw new Error("r2 !== 13") }
  if (r3 !== 13) { throw new Error("r3 !== 13") }
}
