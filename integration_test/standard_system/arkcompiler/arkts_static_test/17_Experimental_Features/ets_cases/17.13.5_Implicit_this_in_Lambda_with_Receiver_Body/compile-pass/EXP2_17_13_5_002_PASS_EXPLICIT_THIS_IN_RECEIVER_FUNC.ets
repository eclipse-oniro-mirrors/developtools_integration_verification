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
 * @id EXP2_17_13_5_002_PASS_EXPLICIT_THIS_IN_RECEIVER_FUNC
 * @expect compile-pass
 * @section 17.13.5
 * @design 接收者函数中使用显式 this. 访问成员
 * @note 正向用例：验证该特性编译通过的正确用法
 */
class Context { public mode: string = 'default'; public enabled: boolean = true }
function getStatus(this: Context): string { return 'mode=' + this.mode + ' enabled=' + this.enabled }
function testExplicitThisInReceiverFunc(): void {
  let ctx: Context = new Context(); ctx.mode = 'production'; ctx.enabled = false
  let status: string = ctx.getStatus()
  console.log('compiled successfully')
}
