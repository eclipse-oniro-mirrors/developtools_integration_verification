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
 * @id EXP2_17_13_2_006_PASS_GENERIC_INTERFACE_RECEIVER
 * @expect compile-pass
 * @section 17.13.2
 * @design 泛型接口作为接收者类型：合法接收者类型
 * @note 正向用例：验证该特性编译通过的正确用法
 */
interface IContainer<T> { element: T | undefined }
class StringContainer implements IContainer<string> { public element: string | undefined }
function hasElement<T>(this: IContainer<T>): boolean { return this.element != undefined }
function testGenericInterfaceReceiver(): void {
  let sc: StringContainer = new StringContainer()
  sc.element = 'present'
  let result: boolean = sc.hasElement()
  console.log('compiled successfully')
}
