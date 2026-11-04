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
 * @id EXP2_17_13_006_FAIL_ORDINARY_CALL_WRONG_RECEIVER
 * @expect compile-fail
 * @section 17.13
 * @design 普通调用语法传入错误的接收者类型应编译失败
 * @note 反向用例：验证该场景应产生编译时错误
 */
class Person { public name: string = 'person' }
function greet(this: Person): string { return 'Hello ' + this.name }
function testWrongReceiverOrdinary(): void {
  let result: string = greet('not a person')
}
