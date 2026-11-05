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
 * @id EXP2_17_13_4_009_FAIL_RECEIVER_LAMBDA_NON_RECEIVER_CONTEXT
 * @expect compile-fail
 * @section 17.13.4
 * @design 带接收者lambda赋值给无接收者的函数类型变量应编译失败 ESE0318
 * @note 反向用例：验证该场景应产生编译时错误
 */
type PlainLambda = (x: number) => number
function testReceiverLambdaNonReceiverContext(): void {
  let pl: PlainLambda = (this: number, x: number): number => { return this + x }
}
