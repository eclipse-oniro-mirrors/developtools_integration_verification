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
 * @id EXP_07_14_015_RUNTIME_NULLISH_UNDEFINED
 * @expect runtime
 * @section 7.14
 * @design 验证 nullish 对象链式操作返回 undefined：bob.spouse?.name 返回 undefined
 * @note 运行时用例：spouse 为 undefined 时 ?. 返回 undefined
 */
class Person {
  public name: string;
  spouse?: Person = undefined;
  constructor(name: string) {
    this.name = name;
  }
}

function main(): void {
  let bob: Person = new Person('Bob');
  let s: string | undefined = bob.spouse?.name;
  if (s != undefined) {
    throw new Error('assertion failed: expected undefined, got ' + s);
  }
  }
  }
  }
  }
console.log('verified');
}
