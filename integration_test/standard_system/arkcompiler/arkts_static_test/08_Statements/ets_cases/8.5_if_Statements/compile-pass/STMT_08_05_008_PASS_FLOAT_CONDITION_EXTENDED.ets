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
 * @id STMT_08_05_008_PASS_FLOAT_CONDITION_EXTENDED
 * @expect compile-pass
 * @section 8.5
 * @design if 条件表达式为 number（浮点）类型时当前版本因 Extended Conditional Expressions 允许编译通过（spec标注未来版本将废弃此特性）
 * @note 正向用例（Extended Conditional Expressions）：number 类型不能用作 condition，必须为 boolean
 */
function testFloatConditionFail(): void {
  let val: number = 3.14
  if (val) {
    val = 0.0
  }
}
