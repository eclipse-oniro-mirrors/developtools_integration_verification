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
 * @id EXP2_17_07_003_PASS_BASIC_INSTANTIATE_NOARGS
 * @expect compile-pass
 * @section 17.7
 * @design 类声明 static $_instantiate(f: () => Self): Self，类名可作为工厂函数调用 C()
 * @note 正向用例：验证静态 $_instantiate 带工厂参数使类变为可调用（工厂模式），编译通过
 */
class FactoryCallable {
  public value: int = 0
  static $_instantiate(f: () => FactoryCallable): FactoryCallable {
    return f()
  }
}

function testInstantiate(): void {
  let obj: FactoryCallable = FactoryCallable()
  let obj2: FactoryCallable = FactoryCallable.$_instantiate(() => new FactoryCallable())
}
