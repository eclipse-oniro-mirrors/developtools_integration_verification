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
/*
 * @id SEM_15_02_00_004_PASS_CLASS_implements_interface
 * @expect compile-pass
 * @section 15.2
 * @design 规范 15.2.1：类 S 实现接口 T，则 S <: T（S 是 T 的子类型）
 * @note 测试类实现接口的子类型关系
 */

// 测试类实现接口的子类型关系
interface Printable {
  print(): void
}

class Document implements Printable {
  public content: string = 'document'
  
  print(): void {
    console.log(this.content)
  }
}

function testClassImplementsInterface(): void {
  let printable: Printable
  let doc: Document = new Document()
  
  // Document 是 Printable 的子类型，可以赋值给 Printable 类型变量
  printable = doc  // OK: Document <: Printable
  
  printable.print()
}
