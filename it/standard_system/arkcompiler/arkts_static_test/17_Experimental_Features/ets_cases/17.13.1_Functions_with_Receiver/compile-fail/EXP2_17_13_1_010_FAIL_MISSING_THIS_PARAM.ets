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
 * @id EXP2_17_13_1_010_FAIL_MISSING_THIS_PARAM
 * @expect compile-fail
 * @section 17.13.1
 * @design 使用 this 但函数没有定义为接收者函数时应编译失败 ESE0203
 * @note 反向用例：验证该场景应产生编译时错误
 */
class Worker { public status: string = 'idle' }
function reportStatus(): string { return this.status }
function testMissingThisParam(): void {
  let w: Worker = new Worker()
  let result: string = reportStatus()
}
