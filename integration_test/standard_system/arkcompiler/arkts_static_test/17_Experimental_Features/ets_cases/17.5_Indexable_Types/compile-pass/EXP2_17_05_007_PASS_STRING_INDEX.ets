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
 * @id EXP2_17_05_007_PASS_STRING_INDEX
 * @expect compile-pass
 * @section 17.5
 * @design 使用 string 类型作为索引参数。验证 x["key"] 语法编译通过
 * @note 正向用例：验证字符串键索引的正确用法
 */
class StringKeyIndexable {
  private map: Object = {}

  $_get(key: string): string {
    return 'value_for_' + key
  }

  $_set(key: string, value: string): void {
    // store logic
  }
}

function testStringIndex(): void {
  let obj: StringKeyIndexable = new StringKeyIndexable()
  let v: string = obj['name']
  obj['age'] = '30'
}
