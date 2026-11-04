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
 * @id EXP_07_12_01_009_FAIL_TRAILING_LAMBDA_NON_FUNC
 * @expect compile-fail
 * @section 7.12.1
 * @design 验证 trailing lambda 最后参数必须为函数类型
 * @note 反向用例：最后参数不是函数类型时用 trailing lambda 应报编译时错误
 *       spec 规定："A compile-time error occurs if the last parameter of the called
 *       entity is not of a function type."（见 experimental.md Trailing Lambdas）
 */
function greet(msg: string): void {
  let s: string = msg;
}

function main(): void {
  greet() {
    let x: int = 1;
  }
}
