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
 * @id LEX_02_05_026_PASS_TOKEN_STREAM_MIXED
 * @expect compile-pass
 * @section 2.5
 * @design 4 类 Token 在同一表达式中混合使用
 * @note 正向用例：Identifier + Keyword + Operator + Literal 混合
 */
class Item026 {
  value: int = 10
}

function testTokenStreamMixed(): void {
  let item: Item026 = new Item026()
  if (item.value === 10 && true) {
    item.value = item.value + 5
  }
}
