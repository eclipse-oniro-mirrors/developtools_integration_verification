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
 * @id EXP2_17_05_001_PASS_BASIC_GET_SET
 * @expect compile-pass
 * @section 17.5
 * @design 类声明 $_get 和 $_set 方法，使用 int 类型索引进行读写。验证基本的索引语法编译通过
 * @note 正向用例：验证同时声明 $_get 和 $_set 的类可以通过 [] 语法读写
 *       ⚠️ SPEC 不一致：spec 要求索引参数为 string 或 number，但当前实现要求 int
 */
class MyIndexable {
  private data: string[] = ['a', 'b', 'c']

  $_get(index: int): string {
    return this.data[index]
  }

  $_set(index: int, value: string): void {
    this.data[index] = value
  }
}

function testBasicGetSet(): void {
  let obj: MyIndexable = new MyIndexable()
  let v: string = obj[0]
  obj[1] = 'x'
}
