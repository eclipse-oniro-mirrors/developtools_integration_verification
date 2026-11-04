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
 * @id EXP2_17_13_3_010_FAIL_NO_RECEIVER_METHOD_CALL
 * @expect compile-fail
 * @section 17.13.3
 * @design 无接收者的函数类型不能通过方法调用语法调用 — ESE0087
 * @note 反向用例：验证该场景应产生编译时错误
 */
type PlainFunc = (x: number) => number
function testNoReceiverMethodCall(): void {
  let pf: PlainFunc = (x: number): number => { return x + 1 }
  let v: number = 5
  let result: number = v.pf()
}
