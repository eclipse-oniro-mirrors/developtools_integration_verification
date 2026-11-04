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
 * @id EXP_07_14_001_PASS_NULLISH_FIELD_ACCESS
 * @expect compile-pass
 * @section 7.14
 * @design 验证可空类型的字段访问链式操作符：expr 为 nullish 类型时，结果类型为 undefined|T
 * @note 正向用例：bob.spouse?.name 其中 spouse 为 undefined 时结果为 undefined，编译通过
 */
class Person {
  public name: string;
  public spouse?: Person = undefined;
  constructor(name: string) {
    this.name = name;
  }
}

function main(): void {
  let bob: Person = new Person('Bob');
  let s: string | undefined = bob.spouse?.name;
}
