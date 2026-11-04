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
 * @id EXP2_17_13_2_002_PASS_INTERFACE_RECEIVER_TYPE
 * @expect compile-pass
 * @section 17.13.2
 * @design 接口类型作为接收者类型：合法接收者类型
 * @note 正向用例：验证该特性编译通过的正确用法
 */
interface Printable { content: string }
class Document implements Printable { public content: string = 'empty' }
function printContent(this: Printable): string { return 'Content: ' + this.content }
function testInterfaceReceiverType(): void {
  let doc: Document = new Document(); doc.content = 'important text'
  let result: string = doc.printContent()
  console.log('compiled successfully')
}
