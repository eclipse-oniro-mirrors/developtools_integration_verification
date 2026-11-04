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
 * @id LEX_02_05_014_PASS_PUNCTUATORS
 * @expect compile-pass
 * @section 2.5
 * @design Punctuators Token: ( ) [ ] { } , ; : .
 * @note 正向用例：标点符号作为 Token
 */
class Holder {
  v: int = 0
}

function testPunctuators(): void {
  let a: int = (1 + 2);
  let arr: int[] = [1, 2, 3];
  let block: int = 0;
  {
    block = 5;
  }
  let h: Holder = new Holder();
  h.v = a + arr[0] + block;
}
