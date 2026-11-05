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
 * @id LEX_02_03_032_RT_SPACE_ONLY_ARITH
 * @expect runtime
 * @section 2.3
 * @design 仅使用 Space 的运算结果正确 * @note 运行时用例：实际执行验证语义正确性

 */
function main(): void {
  let a: int = 10
  let b: int = 3
  let r: int = a + b * 2
  if (r !== 16) { throw new Error("r !== 16") }
}
