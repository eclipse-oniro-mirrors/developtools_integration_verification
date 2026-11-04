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
 * @id EXP2_17_07_02_014_RUNTIME_OVERLOAD_DISPATCH
 * @expect runtime
 * @section 17.7.2
 * @design 运行时验证：多个 $_instantiate 重载正确分发；不同参数调用分发到不同的 $_instantiate 版本
 * @note 运行时用例：验证重载的 $_instantiate 根据参数正确分发到对应版本
 */
class RuntimeFactory4 {
  public tag: string = ''
  public multiplier: int = 1

  constructor(t: string = '', m: int = 1) {
    this.tag = t
    this.multiplier = m
  }

  static $_instantiate(__factory: () => RuntimeFactory4): RuntimeFactory4 {
    return __factory()
  }

  static $_instantiate(__factory: () => RuntimeFactory4, tag: string): RuntimeFactory4 {
    let result: RuntimeFactory4 = __factory()
    result.tag = tag
    return result
  }

  static $_instantiate(__factory: () => RuntimeFactory4, tag: string, mul: int): RuntimeFactory4 {
    let result: RuntimeFactory4 = __factory()
    result.tag = tag
    result.multiplier = mul
    return result
  }
}

function main(): void {
  // 无参版本
  let obj1: RuntimeFactory4 = RuntimeFactory4()
  if (obj1.tag != '') {
    throw new Error('assertion failed: no-arg overload tag should be ''')
  }
  if (obj1.multiplier != 1) {
    throw new Error('assertion failed: no-arg overload multiplier should be 1')
  }

  // 单参版本
  let obj2: RuntimeFactory4 = RuntimeFactory4('alpha')
  if (obj2.tag != 'alpha') {
    throw new Error("assertion failed: single-arg overload tag should be 'alpha', got: " + obj2.tag)
  }

  // 双参版本
  let obj3: RuntimeFactory4 = RuntimeFactory4('beta', 5)
  if (obj3.tag != 'beta') {
    throw new Error("assertion failed: dual-arg overload tag should be 'beta', got: " + obj3.tag)
  }
  if (obj3.multiplier != 5) {
    throw new Error("assertion failed: dual-arg overload multiplier should be 5, got: " + obj3.multiplier.toString())
  }

  console.log('EXP2_17_07_02_014: verified')
}
