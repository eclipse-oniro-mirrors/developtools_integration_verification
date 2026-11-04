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
 * @id LEX_02_09_04_011_RT_BIGINT_COMPARISON
 * @expect runtime
 * @section 2.9.4
 * @design bigint 比较验证
 * @note runtime 用例：验证 bigint 比较正确性
 */

function main(): void {
  // 验证 bigint 比较
  let a: bigint = 153n
  let b: bigint = 153n
  let c: bigint = 200n

  if (a !== b) { throw new Error("bigint equality failed") }
  if (a === c) { throw new Error("bigint inequality failed") }
  if (!(a < c)) { throw new Error("bigint less than failed") }
  if (!(c > a)) { throw new Error("bigint greater than failed") }
}
