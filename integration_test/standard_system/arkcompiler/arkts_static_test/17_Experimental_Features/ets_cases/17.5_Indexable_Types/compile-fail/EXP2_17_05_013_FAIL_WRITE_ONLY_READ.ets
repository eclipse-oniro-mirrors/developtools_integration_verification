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
 * @id EXP2_17_05_013_FAIL_WRITE_ONLY_READ
 * @expect compile-fail
 * @section 17.5
 * @design 类仅声明 $_set（无 $_get），尝试通过索引读操作 v = x[i] 应产生编译错误
 * @note 反向用例：验证只写索引不支持读操作
 */
class WriteOnlyIdx {
  private data: string[] = ['', '']

  $_set(index: int, value: string): void {
    this.data[index] = value
  }
}

function testWriteOnlyRead(): void {
  let obj: WriteOnlyIdx = new WriteOnlyIdx()
  let v: string = obj[0]
}
