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
 * @id EXP2_17_07_02_012_RUNTIME_ADDITIONAL_PARAMS
 * @expect runtime
 * @section 17.7.2
 * @design 运行时验证：$_instantiate 额外参数流正确，短格式 C("arg1", "arg2") 传递参数
 * @note 运行时用例：验证带额外参数的短格式调用参数正确传递和处理
 */
class RuntimeFactory2 {
  public name: string = ''
  public count: int = 0

  constructor() {}

  static $_instantiate(factory: () => RuntimeFactory2, n: string, c: int): RuntimeFactory2 {
    let result: RuntimeFactory2 = factory()
    result.name = n
    result.count = c
    return result
  }
}

function main(): void {
  let obj1: RuntimeFactory2 = RuntimeFactory2('hello', 42)
  if (obj1.name != 'hello') {
    throw new Error("assertion failed: name should be 'hello', got: " + obj1.name)
  }
  if (obj1.count != 42) {
    throw new Error('assertion failed: count should be 42, got: ' + obj1.count.toString())
  }

  let factory: () => RuntimeFactory2 = (): RuntimeFactory2 => new RuntimeFactory2()
  let obj2: RuntimeFactory2 = RuntimeFactory2.$_instantiate(factory, 'world', 100)
  if (obj2.name != 'world') {
    throw new Error("assertion failed: explicit name should be 'world', got: " + obj2.name)
  }
  if (obj2.count != 100) {
    throw new Error('assertion failed: explicit count should be 100, got: ' + obj2.count.toString())
  }

  console.log('EXP2_17_07_02_012: verified')
}
