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
 * @id CON_06_02_008_PASS_REFERENCE_STRING_CONCAT
 * @expect compile-pass
 * @section 6.2
 * @design String context: 寮曠敤绫诲瀷(class) + string锛岄€氳繃 toString() 鏂规硶璋冪敤杞崲
 * @note 姝ｅ悜鐢ㄤ緥锛氶獙璇佽鐗规€х紪璇戦€氳繃鐨勬纭敤娉?
 */
class Item {
  public name: string
  constructor(n: string) {
    this.name = n
  }
}

function testReferenceStringConcat(): void {
  let item: Item = new Item('widget')
  let s1: string = 'item: ' + item
  let s2: string = item + ' created'
}