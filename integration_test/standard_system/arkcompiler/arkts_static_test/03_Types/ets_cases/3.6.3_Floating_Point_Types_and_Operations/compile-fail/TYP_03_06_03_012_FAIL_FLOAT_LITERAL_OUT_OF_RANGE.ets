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
 * @id TYP_03_06_03_012_FAIL_FLOAT_LITERAL_OUT_OF_RANGE
 * @expect compile-fail
 * @section 3.6.3
 * @design 浮点字面量超出类型范围
 * @note 反向用例：double 超过 IEEE 754 binary64 最大值
 */
function testFloatLiteralOutOfRangeFail(): void {
  // 超过 double 范围
  let d: double = 1.7e309
  // 超过 float 范围
  let f: float = 3.5e38f
}