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
 * @id EXP_07_01_01_022_FAIL_DOUBLE_POSTFIX_INCREMENT
 * @expect compile-fail
 * @section 7.1.1
 * @design 后置 `++` 不能重复应用，`a++` 返回右值不能再次递增
 * @note 反向用例：验证后置递增的结果不可再递增
 */
function testDoublePostfixIncrement(): void {
  let a: int = 1
  a++++
}
