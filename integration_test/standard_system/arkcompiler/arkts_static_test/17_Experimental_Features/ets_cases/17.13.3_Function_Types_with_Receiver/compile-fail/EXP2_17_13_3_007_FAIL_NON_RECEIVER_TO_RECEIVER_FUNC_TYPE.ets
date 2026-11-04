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
 * @id EXP2_17_13_3_007_FAIL_NON_RECEIVER_TO_RECEIVER_FUNC_TYPE
 * @expect compile-fail
 * @section 17.13.3
 * @design 非接收者函数赋值给带接收者的函数类型应编译失败 ESE0318
 * @note 反向用例：验证该场景应产生编译时错误
 */
class Host { public value: number = 0 }
type ReceiverFunc = (this: Host) => number
function testNonReceiverAssign(): void {
  let plainFunc: (x: number) => number = (x: number): number => { return x * 2 }
  let rf: ReceiverFunc = plainFunc
}
