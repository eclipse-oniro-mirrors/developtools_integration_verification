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
 * @id EXP2_17_07_02_006_PASS_GENERIC_CLASS
 * @expect compile-pass
 * @section 17.7.2
 * @design 泛型类中的 $_instantiate：静态方法不能引用类泛型类型参数，必须使用具体类型
 * @note 正向用例：验证泛型类声明 $_instantiate（签名中使用具体类型，不引用类泛型参数）编译通过
 */
class MyFactory6 {
  public value: string = ''

  constructor(v: string = '') {
    this.value = v
  }

  static $_instantiate(factory: () => MyFactory6): MyFactory6 {
    return factory()
  }

  static $_instantiate(factory: () => MyFactory6, val: string): MyFactory6 {
    let result: MyFactory6 = factory()
    result.value = val
    return result
  }
}

function testGenericClass(): void {
  let obj: MyFactory6 = MyFactory6()
  let obj2: MyFactory6 = MyFactory6('typed')
}
