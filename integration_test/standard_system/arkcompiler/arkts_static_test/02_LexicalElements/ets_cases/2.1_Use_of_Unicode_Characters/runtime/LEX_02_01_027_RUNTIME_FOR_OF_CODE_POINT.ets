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
 * @id LEX_02_01_027_RUNTIME_FOR_OF_CODE_POINT
 * @expect runtime
 * @section 2.1
 * @design for-of按Unicode code point迭代: emoji按code point计数而非代码单元 * @note 运行时用例：实际执行验证语义正确性

 */
function main(): void {
  let s1: string = "A\u{1F600}B"
  let count1: number = 0
  for (const ch of s1) {
    count1++
  }
  if (count1 !== 3) { throw new Error("for-of should count 3 code points") }

  let s2: string = "\u{1F600}\u{1F601}\u{1F602}"
  let count2: number = 0
  for (const ch of s2) {
    count2++
  }
  if (count2 !== 3) { throw new Error("for-of emoji should count 3 code points") }

  let s3: string = "ABC"
  let chars: string[] = []
  for (const ch of s3) {
    chars.push(ch)
  }
  if (chars.length !== 3) { throw new Error("for-of BMP length mismatch") }
  if (chars[0] !== "A") { throw new Error("for-of BMP first char mismatch") }
}
