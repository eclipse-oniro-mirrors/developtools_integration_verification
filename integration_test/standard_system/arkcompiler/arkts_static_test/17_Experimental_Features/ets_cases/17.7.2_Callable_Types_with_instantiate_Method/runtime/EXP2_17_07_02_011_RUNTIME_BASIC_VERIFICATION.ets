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
 * @id EXP2_17_07_02_011_RUNTIME_BASIC_VERIFICATION
 * @expect runtime
 * @section 17.7.2
 * @design 运行时验证：$_instantiate 基本调用 C() 和 C.$_instantiate 返回正确实例
 * @note 运行时用例：验证短格式和显式调用均返回正确的类实例，两种方式结果等价
 */
class RuntimeFactory1 {
  public tag: string = ''

  constructor(t: string = '') {
    this.tag = t
  }

  static $_instantiate(factory: () => RuntimeFactory1): RuntimeFactory1 {
    let result: RuntimeFactory1 = factory()
    result.tag = 'instantiated'
    return result
  }
}

function main(): void {
  let obj1: RuntimeFactory1 = RuntimeFactory1()
  if (obj1.tag != 'instantiated') {
    throw new Error("assertion failed: short form tag should be 'instantiated', got: " + obj1.tag)
  }

  let obj2: RuntimeFactory1 = RuntimeFactory1.$_instantiate(() => new RuntimeFactory1())
  if (obj2.tag != 'instantiated') {
    throw new Error("assertion failed: explicit call tag should be 'instantiated', got: " + obj2.tag)
  }

  let obj3: RuntimeFactory1 = RuntimeFactory1.$_instantiate(() => new RuntimeFactory1('pre'))
  if (obj3.tag != 'instantiated') {
    throw new Error("assertion failed: explicit with custom factory should have 'instantiated', got: " + obj3.tag)
  }

  console.log('EXP2_17_07_02_011: verified')
}
