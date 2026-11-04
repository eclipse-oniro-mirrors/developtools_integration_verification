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
 * @id EXP_07_14_016_RUNTIME_NON_NULLISH_VALUE
 * @expect runtime
 * @section 7.14
 * @design 验证非 nullish 对象链式操作返回实际值：bob.spouse?.name 返回 "Alice"
 * @note 运行时用例：spouse 赋值后 ?. 返回实际值
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
  bob.spouse = new Person('Alice');
  let s: string | undefined = bob.spouse?.name;
  if (s != 'Alice') {
    throw new Error('assertion failed: expected Alice, got ' + s);
  }
  }
  }
  }
  }
console.log('verified');
}
