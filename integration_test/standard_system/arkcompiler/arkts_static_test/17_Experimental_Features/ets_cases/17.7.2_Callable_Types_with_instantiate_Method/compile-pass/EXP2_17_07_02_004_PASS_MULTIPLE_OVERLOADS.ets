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
 * @id EXP2_17_07_02_004_PASS_MULTIPLE_OVERLOADS
 * @expect compile-pass
 * @section 17.7.2
 * @design 多个 $_instantiate 声明（重载）：不同参数列表是合法的重载
 * @note 正向用例：验证同一类中多个 $_instantiate 使用不同参数列表编译通过
 */
class MyFactory4 {
  public tag: string = ''

  constructor(t: string = '') {
    this.tag = t
  }

  static $_instantiate(factory: () => MyFactory4): MyFactory4 {
    return factory()
  }

  static $_instantiate(factory: () => MyFactory4, tag: string): MyFactory4 {
    let result: MyFactory4 = factory()
    result.tag = tag
    return result
  }

  static $_instantiate(factory: () => MyFactory4, tag: string, num: int): MyFactory4 {
    let result: MyFactory4 = factory()
    result.tag = tag + num.toString()
    return result
  }
}

function testMultipleOverloads(): void {
  let a: MyFactory4 = MyFactory4()
  let b: MyFactory4 = MyFactory4('test')
  let c: MyFactory4 = MyFactory4('test', 42)
  let d: MyFactory4 = MyFactory4.$_instantiate(() => new MyFactory4(), 'explicit')
}
