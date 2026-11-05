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
 * @id EXP2_17_12_001_PASS_DEFAULT_METHOD_BASIC
 * @expect compile-pass
 * @section 17.12
 * @design 接口中声明带方法体的默认方法，类实现该接口但不重写该方法，验证类实例可调用该默认方法
 * @note 正向用例：验证默认接口方法的基本声明和继承
 */
interface IGreeter {
  greet(): void {
    console.log('Hello from default method')
  }
}

class Person implements IGreeter {
  public name: string = 'Alice'
}

function main(): void {
  let p: Person = new Person()
  p.greet() // 调用继承的默认方法
}
