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
 * @id EXP2_17_05_003_PASS_SET_ONLY
 * @expect compile-pass
 * @section 17.5
 * @design 类仅声明 $_set（无 $_get），启用只写索引。验证写操作可用
 * @note 正向用例：验证仅 $_set 的类支持 obj[i] = v 语法
 */
class WriteOnlyIndexable {
  private data: string[] = ['', '', '']

  $_set(index: int, value: string): void {
    this.data[index] = value
  }
}

function testSetOnly(): void {
  let obj: WriteOnlyIndexable = new WriteOnlyIndexable()
  obj[0] = 'hello'
  obj[1] = 'world'
}
