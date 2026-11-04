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
 * @id EXP2_17_13_5_005_PASS_RECEIVER_FUNC_THIS_ACCESS
 * @expect compile-pass
 * @section 17.13.5
 * @design 顶层接收者函数中使用显式 this 访问成员并通过方法调用语法调用
 * @note 正向用例：验证该特性编译通过的正确用法
 */
class Book { public title: string = ''; public author: string = '' }
function getInfo(this: Book): string { return this.title + ' by ' + this.author }
function testReceiverFuncThisAccess(): void {
  let b: Book = new Book(); b.title = 'ArkTS Guide'; b.author = 'OpenHarmony'
  let info: string = b.getInfo()
  console.log('compiled successfully')
}
