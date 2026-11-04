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
 * @id EXP2_17_13_1_003_PASS_GENERIC_RECEIVER_FUNCTION
 * @expect compile-pass
 * @section 17.13.1
 * @design 泛型接收者函数：接收者类型为泛型类，函数也是泛型
 * @note 正向用例：验证该特性编译通过的正确用法
 */
class ContainerBox<T> { public item: T | undefined }
function getItem<T>(this: ContainerBox<T>): T | undefined { return this.item }
function setItem<T>(this: ContainerBox<T>, val: T): void { this.item = val }
function testGenericReceiver(): void {
  let c: ContainerBox<string> = new ContainerBox<string>()
  c.setItem('hello')
  let result: string | undefined = c.getItem()
  console.log('compiled successfully')
}
