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
 * @id EXP2_17_05_002_PASS_GET_ONLY
 * @expect compile-pass
 * @section 17.5
 * @design 类仅声明 $_get（无 $_set），启用只读索引。验证读操作可用
 * @note 正向用例：验证仅 $_get 的类支持 v = obj[i] 语法
 */
class ReadOnlyIndexable {
  private data: string[] = ['x', 'y', 'z']

  $_get(index: int): string {
    return this.data[index]
  }
}

function testGetOnly(): void {
  let obj: ReadOnlyIndexable = new ReadOnlyIndexable()
  let v: string = obj[0]
  let w: string = obj[2]
}
