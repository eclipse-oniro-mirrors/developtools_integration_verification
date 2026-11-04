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
 * @id EXP2_17_05_012_FAIL_READ_ONLY_WRITE
 * @expect compile-fail
 * @section 17.5
 * @design 类仅声明 $_get（无 $_set），尝试通过索引写操作 x[i] = v 应产生编译错误
 * @note 反向用例：验证只读索引不支持写操作
 */
class ReadOnlyIdx {
  private data: string[] = ['a', 'b']

  $_get(index: int): string {
    return this.data[index]
  }
}

function testReadOnlyWrite(): void {
  let obj: ReadOnlyIdx = new ReadOnlyIdx()
  obj[0] = 'new_value'
}
