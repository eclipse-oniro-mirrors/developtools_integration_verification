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
 * @id LEX_02_02_021_RT_MULTI_LINE_EXPR_RESULT
 * @expect runtime
 * @section 2.2
 * @design 括号内换行的多行表达式计算结果正确 * @note 运行时用例：实际执行验证语义正确性

 */
function main(): void {
  let result: int = (
    10 +
    20 +
    30
  )
  if (result !== 60) { throw new Error("result !== 60") }
}
