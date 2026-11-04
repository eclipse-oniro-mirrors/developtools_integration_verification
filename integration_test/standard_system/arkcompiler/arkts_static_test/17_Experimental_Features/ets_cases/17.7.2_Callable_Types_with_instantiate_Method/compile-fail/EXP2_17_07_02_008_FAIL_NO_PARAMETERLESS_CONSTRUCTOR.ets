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
 * @id EXP2_17_07_02_008_FAIL_NO_PARAMETERLESS_CONSTRUCTOR
 * @expect compile-fail
 * @section 17.7.2
 * @design 类没有无参数构造函数时，短格式 C() 调用因编译器无法生成隐式工厂而产生编译时错误
 * @note 反向用例：验证没有无参数构造函数的类使用短格式调用时编译失败
 */
class MyFailFactory2 {
  public data: int = 0

  constructor(x: int) {
    this.data = x
  }

  static $_instantiate(factory: () => MyFailFactory2): MyFailFactory2 {
    return factory()
  }
}

function testNoParamlessConstructor(): void {
  let obj: MyFailFactory2 = MyFailFactory2()
}
