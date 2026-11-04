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
 * @id SEM_15_08_00_021_PASS_INTERSECTION_type_computation
 * @expect compile-pass
 * @section 15.8
 * @design 规范 15.8.2：智能类型转换中交集类型的计算
 * @note 测试智能类型转换中的交集类型计算
 */

// 测试智能类型转换中的交集类型计算
interface Printable {
  print(): void
}

class Document implements Printable {
  public content: string = 'document'
  
  print(): void {
    console.log(this.content)
}
}

function testIntersectionTypeComputation(doc: Document | Printable): void {
  // instanceof 检查后的智能类型
  if (doc instanceof Document) {
    // 在这个分支中，doc 的智能类型是 Document & Printable
    doc.print()  // OK: Document 实现了 Printable
    console.log(doc.content)  // OK: Document 有 content 属性
  }
}

// 测试更复杂的交集类型计算
interface Writable {
  write(content: string): void
}

class File implements Printable, Writable {
  public content: string = 'file'
  
  print(): void {
    console.log(this.content)
}
  
  write(content: string): void {
    this.content = content
    console.log('Written: ' + content)
}
}

function testComplexIntersectionType(file: File | Printable | Writable): void {
  if (file instanceof File) {
    // 在这个分支中，file 的智能类型是 File & (Printable | Writable)
    file.print()  // OK: File 实现了 Printable
    file.write('new content')  // OK: File 实现了 Writable
  }
}
