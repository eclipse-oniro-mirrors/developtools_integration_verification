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
 * @id EXP_07_36_01_003_PASS_CONST_BIGINT_INTERNAL
 * @expect compile-pass
 * @section 7.36.1
 * @design 常量表达式大整数内部类型（任意精度）
 * @note 正向用例：验证该特性编译通过的正确用法。
 */
const BIG: int = 2147483647 * 2
const NEG_BIG: int = -2147483648 * 2
function testConstBigintInternal(): void {
  console.log(BIG.toString(), NEG_BIG.toString())
}
