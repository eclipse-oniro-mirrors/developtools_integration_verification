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
 * @id EXP_07_36_01_002_PASS_CONST_FLOAT_PROMOTION
 * @expect compile-pass
 * @section 7.36.1
 * @design 常量表达式 float 提升
 * @note 正向用例：验证该特性编译通过的正确用法。float 字面量使用 f 后缀。
 */
const F1: float = 1.5f
const F2: int = 2
function testConstFloatPromotion(): void {
  let result: float = F1 * F2 as float
  console.log(result.toString())
}
