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
 * @id CLS_09_09_008_RUNTIME_CONSTRUCTOR_INIT_FIELDS
 * @expect runtime
 * @section 9.9
 * @design 构造器初始化字段运行时验证
 * @note 运行时用例
 */
class Person008 {
  private _name: string
  private _age: int
  constructor(name: string, age: int) {
    this._name = name
    this._age = age
  }
  greet(): string {
    return this._name
  }
}
function main(): void {
  let p: Person008 = new Person008("Alice", 30)
  console.log("verified")
}
