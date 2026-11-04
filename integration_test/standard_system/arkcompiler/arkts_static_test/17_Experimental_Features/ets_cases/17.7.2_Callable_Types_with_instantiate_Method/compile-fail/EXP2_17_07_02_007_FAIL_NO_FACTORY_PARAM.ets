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
 * @id EXP2_17_07_02_007_FAIL_NO_FACTORY_PARAM
 * @expect compile-fail
 * @section 17.7.2
 * @design $_instantiate 第一参数必须为工厂函数 () => ClassType，第一参数不是工厂类型时短格式 C() 调用应产生编译时错误
 * @note 反向用例：验证 $_instantiate 第一参数不是工厂函数类型时短格式调用编译失败
 *       ⚠️ SPEC 不一致：spec 要求第一参数必须为工厂函数类型，但 ArkTS 编译器允许声明非工厂类型的 $_instantiate
 *       分类：D 类（Spec 与实现不一致）
 */
class MyFailFactory1 {
  constructor() {}

  static $_instantiate(x: int): MyFailFactory1 {
    return new MyFailFactory1()
  }
}

function testNoFactoryParam(): void {
  let obj: MyFailFactory1 = MyFailFactory1()
}
