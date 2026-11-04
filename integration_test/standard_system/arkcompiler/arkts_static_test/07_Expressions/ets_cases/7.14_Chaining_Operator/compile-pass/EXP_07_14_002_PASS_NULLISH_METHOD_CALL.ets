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
 * @id EXP_07_14_002_PASS_NULLISH_METHOD_CALL
 * @expect compile-pass
 * @section 7.14
 * @design 验证可空类型实例方法调用链式操作符：expr?.method() 结果类型为 undefined|T
 * @note 正向用例：obj?.getName() 其中 obj 为 Person|undefined，结果类型 string|undefined
 */
class Person {
  public name: string;
  constructor(name: string) {
    this.name = name;
  }
  getName(): string {
    return this.name;
  }
}

function main(): void {
  let p: Person | undefined = new Person('Alice');
  let s: string | undefined = p?.getName();
}
