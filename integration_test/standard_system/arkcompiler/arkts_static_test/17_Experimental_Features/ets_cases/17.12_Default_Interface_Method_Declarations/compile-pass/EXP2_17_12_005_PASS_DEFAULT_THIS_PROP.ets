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
 * @id EXP2_17_12_005_PASS_DEFAULT_THIS_PROP
 * @expect compile-pass
 * @section 17.12
 * @design 默认方法中使用 `this` 访问接口中声明的属性，类实现该接口并提供属性值，验证默认方法可正确引用实例属性
 * @note 正向用例：验证默认方法中 this 引用指向实现类实例
 */
interface IDescribable {
  name: string
  version: int

  describe(): string {
    return 'Name: ' + this.name + ', Version: ' + this.version
  }

  getName(): string {
    return this.name
  }
}

class Item implements IDescribable {
  public name: string = 'Widget'
  public version: int = 2
}

function main(): void {
  let item: Item = new Item()
  let desc: string = item.describe()
  let n: string = item.getName()
  console.log(desc + ' | getName=' + n)
}
