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
 * @id EXP2_17_07_02_013_RUNTIME_EXPLICIT_FACTORY
 * @expect runtime
 * @section 17.7.2
 * @design 运行时验证：显式工厂函数 vs 隐式工厂函数；自定义工厂在 $_instantiate 中以同等方式处理
 * @note 运行时用例：验证显式自定义工厂函数的行为与编译器隐式工厂等价，$_instantiate 仅使用工厂创建实例
 */
class RuntimeFactory3 {
  public source: string = ''

  constructor(src: string = '') {
    this.source = src
  }

  static $_instantiate(factory: () => RuntimeFactory3): RuntimeFactory3 {
    let result: RuntimeFactory3 = factory()
    return result
  }
}

function main(): void {
  // 隐式工厂（编译器提供，使用无参构造函数）
  let obj1: RuntimeFactory3 = RuntimeFactory3()
  if (obj1.source != '') {
    throw new Error('assertion failed: implicit factory should create with default constructor')
  }

  // 自定义工厂使用有参构造函数
  let obj2: RuntimeFactory3 = RuntimeFactory3.$_instantiate(() => new RuntimeFactory3('custom'))
  if (obj2.source != 'custom') {
    throw new Error("assertion failed: custom factory should create with source='custom', got: " + obj2.source)
  }

  // $_instantiate 本身不做额外处理，仅调用工厂并返回结果
  let obj3: RuntimeFactory3 = RuntimeFactory3.$_instantiate(() => new RuntimeFactory3('direct'))
  if (obj3.source != 'direct') {
    throw new Error("assertion failed: custom factory should create with source='direct', got: " + obj3.source)
  }

  console.log('EXP2_17_07_02_013: verified')
}
