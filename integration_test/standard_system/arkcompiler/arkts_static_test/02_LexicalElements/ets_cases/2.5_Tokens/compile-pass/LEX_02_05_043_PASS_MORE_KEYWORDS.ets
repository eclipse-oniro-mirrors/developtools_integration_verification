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
 * @id LEX_02_05_043_PASS_MORE_KEYWORDS
 * @expect compile-pass
 * @section 2.5
 * @design 更多关键字
 * @note compile-pass 用例：验证更多关键字
 */

// 类相关关键字
class Animal {
  name: string
  constructor(name: string) {
    this.name = name
  }
}

// 继承关键字
class Dog extends Animal {
  breed: string
  constructor(name: string, breed: string) {
    super(name)
    this.breed = breed
  }
}

// 接口关键字
interface Printable {
  print(): void
}

// 实现关键字
class Document implements Printable {
  content: string
  constructor(content: string) {
    this.content = content
  }
  print(): void {
    // print content
  }
}
