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
 * @id LEX_02_03_035_RT_NBSP_SEPARATED
 * @expect runtime
 * @section 2.3
 * @design 仅 NBSP 分隔的代码运算结果正确 * @note 运行时用例：实际执行验证语义正确性

 */
function main(): void {
  let a: int = 5
  let b: int = 7
  let r: int = a * b
  if (r !== 35) { throw new Error("r !== 35") }
}
