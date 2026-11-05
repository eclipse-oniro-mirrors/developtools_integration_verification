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
 * @id EXP2_17_07_017_RUNTIME_INSTANTIATE_WITH_PARAMS
 * @expect runtime
 * @section 17.7
 * @design $_instantiate 带参工厂根据参数配置返回实例
 * @note 运行时用例：验证带参 $_instantiate 创建正确配置的实例
 */
class ConfiguredFactory {
  public name: string = 'default'
  public value: int = 0
  static $_instantiate(f: () => ConfiguredFactory): ConfiguredFactory {
    return f()
  }
  static $_instantiate(f: () => ConfiguredFactory, name: string): ConfiguredFactory {
    let obj: ConfiguredFactory = f()
    obj.name = name
    return obj
  }
  static $_instantiate(f: () => ConfiguredFactory, value: int): ConfiguredFactory {
    let obj: ConfiguredFactory = f()
    obj.value = value
    return obj
  }
}

function main(): void {
  let obj0: ConfiguredFactory = ConfiguredFactory()
  if (obj0.name != 'default') {
    throw new Error('assertion failed: default name, got ' + obj0.name)
  }
  if (obj0.value != 0) {
    throw new Error('assertion failed: default value, got ' + obj0.value)
  }

  let obj1: ConfiguredFactory = ConfiguredFactory('test')
  if (obj1.name != 'test') {
    throw new Error('assertion failed: name should be test, got ' + obj1.name)
  }

  let obj2: ConfiguredFactory = ConfiguredFactory(99)
  if (obj2.value != 99) {
    throw new Error('assertion failed: value should be 99, got ' + obj2.value)
  }

  console.log('PASS: instantiate with params correct')
}
