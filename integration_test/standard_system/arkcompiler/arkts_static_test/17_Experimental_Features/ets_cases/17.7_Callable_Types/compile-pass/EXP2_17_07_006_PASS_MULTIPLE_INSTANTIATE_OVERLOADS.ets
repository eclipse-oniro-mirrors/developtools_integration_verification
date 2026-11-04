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
 * @id EXP2_17_07_006_PASS_MULTIPLE_INSTANTIATE_OVERLOADS
 * @expect compile-pass
 * @section 17.7
 * @design 类可拥有多个不同签名的 $_instantiate 重载实现，每个需带工厂参数
 * @note 正向用例：验证多个 $_instantiate 重载（不同业务参数类型）编译通过
 */
class OverloadedFactory {
  public tag: string = ''
  public count: int = 0
  static $_instantiate(f: () => OverloadedFactory): OverloadedFactory {
    return f()
  }
  static $_instantiate(f: () => OverloadedFactory, tag: string): OverloadedFactory {
    let obj: OverloadedFactory = f()
    obj.tag = tag
    return obj
  }
  static $_instantiate(f: () => OverloadedFactory, count: int): OverloadedFactory {
    let obj: OverloadedFactory = f()
    obj.count = count
    return obj
  }
}

function testOverloadedInstantiate(): void {
  let obj0: OverloadedFactory = OverloadedFactory()
  let obj1: OverloadedFactory = OverloadedFactory('test')
  let obj2: OverloadedFactory = OverloadedFactory(42)
}
