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
 * @id EXP2_17_07_02_002_PASS_ADDITIONAL_PARAMS
 * @expect compile-pass
 * @section 17.7.2
 * @design $_instantiate 带有额外参数：短格式 C("arg") 自动传递额外参数，第一参数工厂由编译器隐式提供
 * @note 正向用例：验证带额外参数的 $_instantiate 声明和短格式调用编译通过
 */
class MyFactory2 {
  public data: string = ''

  constructor(d: string = '') {
    this.data = d
  }

  static $_instantiate(factory: () => MyFactory2, arg: string): MyFactory2 {
    let result: MyFactory2 = factory()
    result.data = arg
    return result
  }
}

function testAdditionalParams(): void {
  let obj: MyFactory2 = MyFactory2('hello')
  let obj2: MyFactory2 = MyFactory2.$_instantiate(() => new MyFactory2(), 'world')
}
