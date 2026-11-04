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
 * @id EXP_07_24_027_FAIL_BIGINT_NEGATIVE_EXPONENT
 * @expect compile-fail
 * @section 7.24
 * @design 验证 bigint 负指数编译时检测：spec 要求 "if the second operand of type bigint is negative,
 *         then either a compile-time error occurs if detected at compile time"
 * @note 反向用例：bigint 负指数语义错误
 */
function main(): void {
  let a: bigint = 2n
  let b = a ** -1n  // compile-time error: exponent must be non-negative
}
