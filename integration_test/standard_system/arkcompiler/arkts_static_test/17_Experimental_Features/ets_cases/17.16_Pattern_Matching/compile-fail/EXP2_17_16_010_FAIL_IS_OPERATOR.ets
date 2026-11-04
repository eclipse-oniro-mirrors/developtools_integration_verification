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
 * @id EXP2_17_16_010_FAIL_IS_OPERATOR
 * @expect compile-fail
 * @section 17.16
 * @design spec 提到的 is 运算符——ArkTS 当前实现不支持 is 运算符
 * @note 反向用例：验证 is 运算符触发编译错误 ESY169587。
 *       ArkTS 编译器明确提示 "is operator is not supported. Use 'instanceof' instead".
 */
function testIsOperator(): void {
  let x: Object = 'hello'
  let result: boolean = x is string
  console.log(result)
}
