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
 * @id LEX_02_09_03_014_RT_FLOAT_SUFFIX
 * @expect runtime
 * @section 2.9.3
 * @design float 后缀值验证
 * @note runtime 用例：验证 float 后缀正确性
 */

function main(): void {
  // 验证 float 后缀值
  let x1: float = 3.14f
  let x2: float = 1e10f

  if (x1 !== 3.14f) { throw new Error("3.14f mismatch") }
  if (x2 !== 10000000000.0f) { throw new Error("1e10f mismatch") }
}
