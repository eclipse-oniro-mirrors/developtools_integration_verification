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
 * @id LEX_02_01_030_RUNTIME_UNICODE_COLLECTION_OPS
 * @expect runtime
 * @section 2.1
 * @design Unicode字符串在Array和Map中的运行时操作 * @note 运行时用例：实际执行验证语义正确性

 */
function main(): void {
  let arr: string[] = ["你好", "世界", "\u{1F600}"]
  if (arr.length !== 3) { throw new Error("Unicode array length mismatch") }
  if (arr[0] !== "你好") { throw new Error("Unicode array element mismatch") }
  if (arr[2].length !== 2) { throw new Error("Emoji in array length mismatch") }

  let m: Map<string, number> = new Map<string, number>()
  m.set("苹果", 1)
  m.set("香蕉", 2)
  m.set("\u{1F600}", 3)
  if (m.get("苹果") !== 1) { throw new Error("Unicode map get mismatch") }
  if (m.get("\u{1F600}") !== 3) { throw new Error("Emoji map get mismatch") }
  if (m.size !== 3) { throw new Error("Unicode map size mismatch") }
}
