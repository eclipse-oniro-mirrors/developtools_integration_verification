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
 * @id EXP2_17_05_004_PASS_INTERFACE_IMPL
 * @expect compile-pass
 * @section 17.5
 * @design 接口声明抽象的 $_get 和 $_set，实现类提供具体方法体。验证接口中定义索引方法的编译通过
 * @note 正向用例：验证接口可声明 $_get/$_set，实现类可提供方法体
 */
interface IIndexable {
  $_get(index: int): string
  $_set(index: int, value: string): void
}

class IndexableImpl implements IIndexable {
  private items: string[] = ['one', 'two', 'three']

  $_get(index: int): string {
    return this.items[index]
  }

  $_set(index: int, value: string): void {
    this.items[index] = value
  }
}

function testInterfaceImpl(): void {
  let obj: IIndexable = new IndexableImpl()
  let v: string = obj[0]
  obj[1] = 'updated'
}
