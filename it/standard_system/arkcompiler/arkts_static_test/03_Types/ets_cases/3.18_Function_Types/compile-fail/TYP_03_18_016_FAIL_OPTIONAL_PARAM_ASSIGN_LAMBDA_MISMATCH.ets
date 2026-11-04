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
 * @id TYP_03_18_016_FAIL_OPTIONAL_PARAM_ASSIGN_LAMBDA_MISMATCH
 * @expect compile-fail
 * @section 3.18
 * @design 函数类型可选参数与 lambda 赋值签名不匹配
 * @note 反向用例：验证全可选函数类型不能赋值为需要必选参数的 lambda
 */
type AllOptional = (x?: number, y?: string) => void

function testOptionalParamAssignMismatch(): void {
  // 全可选类型赋值为需要必选参数的 lambda 应失败
  // 因为调用时可传0个参数，但 lambda 需要1个参数
  let f: AllOptional = (p: number): void => {} // Compile-time error
}