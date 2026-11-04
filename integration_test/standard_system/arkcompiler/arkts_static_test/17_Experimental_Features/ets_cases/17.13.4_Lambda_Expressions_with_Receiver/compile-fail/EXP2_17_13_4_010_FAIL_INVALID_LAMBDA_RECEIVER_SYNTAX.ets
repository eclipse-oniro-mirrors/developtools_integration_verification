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
 * @id EXP2_17_13_4_010_FAIL_INVALID_LAMBDA_RECEIVER_SYNTAX
 * @expect compile-fail
 * @section 17.13.4
 * @design 无效lambda接收者语法：this参数未放在lambda参数列表第一个位置 — ESY0158
 * @note 反向用例：验证该场景应产生编译时错误
 */
class Host { public value: number = 0 }
function testInvalidLambdaReceiverSyntax(): void {
  let badLambda = (x: number, this: Host): number => { return this.value + x }
  let h: Host = new Host(); h.value = 5
  let r: number = badLambda(h, 10)
}
