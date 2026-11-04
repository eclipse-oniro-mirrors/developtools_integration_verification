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
 * @id TYP_03_01_019_FAIL_BOOLEAN_NUMERIC_MIX
 * @expect compile-fail
 * @section 3.1
 * @design boolean 与数值类型的非法互操作应编译失败: boolean 赋值给 int、boolean 与数值算术运算、boolean 直接作为数值条件
 * @note 反向用例：验证该场景应产生编译时错误
 */
function testBooleanNumericFail(): void {
  let b: boolean = true
  let n: int = b
  let sum: int = b + 1
  let prod: double = b * 3.14
  let diff: int = b - 5

  if (b + 1) {
  }
}