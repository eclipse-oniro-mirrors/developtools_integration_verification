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
 * @id LEX_02_01_024_RUNTIME_BMP_STRING_OPS
 * @expect runtime
 * @section 2.1
 * @design BMP Unicode字符串运行时操作: length、indexOf、substring、拼接 * @note 运行时用例：实际执行验证语义正确性

 */
function main(): void {
  let s1: string = "Hello世界"
  if (s1.length !== 7) { throw new Error("BMP string length mismatch") }

  let s2: string = "\u0041\u0042\u0043"
  if (s2 !== "ABC") { throw new Error("Unicode escape string mismatch") }

  let s3: string = "你好" + "世界"
  if (s3 !== "你好世界") { throw new Error("Unicode concat mismatch") }
  if (s3.length !== 4) { throw new Error("Unicode concat length mismatch") }

  let s4: string = "你好世界ABC"
  if (s4.substring(0, 2) !== "你好") { throw new Error("Unicode substring mismatch") }

  let s5: string = "Hello世界"
  if (s5.indexOf("世界") !== 5) { throw new Error("Unicode indexOf mismatch") }
}
