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
 * @id EXP2_17_07_02_001_PASS_BASIC_INSTANTIATE
 * @expect compile-pass
 * @section 17.7.2
 * @design 基本 $_instantiate 声明：静态方法，第一参数为工厂函数 () => ClassType，类有无参数构造函数以支持隐式工厂
 * @note 正向用例：验证 $_instantiate 基本声明和短格式 C() 调用的编译通过
 */
class MyFactory1 {
  constructor() {}

  static $_instantiate(factory: () => MyFactory1): MyFactory1 {
    return factory()
  }
}

function testBasicInstantiate(): void {
  let obj: MyFactory1 = MyFactory1()
  let obj2: MyFactory1 = MyFactory1.$_instantiate(() => new MyFactory1())
}
