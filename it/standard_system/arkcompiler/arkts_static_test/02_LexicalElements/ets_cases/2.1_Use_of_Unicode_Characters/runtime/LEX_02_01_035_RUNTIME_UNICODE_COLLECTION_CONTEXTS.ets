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
 * @id LEX_02_01_035_RUNTIME_UNICODE_COLLECTION_CONTEXTS
 * @expect runtime
 * @section 2.1
 * @design 测试因子checklist: 数组元素上下文 - Unicode在数组中的存取和遍历验证
 * @note 运行时用例：实际执行验证Unicode在数组中的正确存取
 */
function main(): void {
  let 中文数组: string[] = ["苹果", "香蕉", "橘子"]
  if (中文数组[0] !== "苹果") { throw new Error("Unicode array: first element mismatch") }
  if (中文数组.length !== 3) { throw new Error("Unicode array: length mismatch, got " + 中文数组.length.toString()) }

  let 计数: number = 0
  for (const 项 of 中文数组) {
    计数 = 计数 + 1
  }
  if (计数 !== 3) { throw new Error("Unicode array: for-of count mismatch, got " + 计数.toString()) }
}