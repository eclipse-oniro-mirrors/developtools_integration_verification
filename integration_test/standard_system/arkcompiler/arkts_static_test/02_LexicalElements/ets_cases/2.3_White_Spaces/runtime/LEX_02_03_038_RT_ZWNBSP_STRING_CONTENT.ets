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
 * @id LEX_02_03_038_RT_ZWNBSP_STRING_CONTENT
 * @expect runtime
 * @section 2.3
 * @design 字符串字面量内的 ZWNBSP 是字符串内容的一部分（不是分隔符） * @note 运行时用例：实际执行验证语义正确性

 */
function main(): void {
  let s: string = "ab﻿cd"
  // ZWNBSP 在字符串字面量内是字符串内容，length = 5
  if (s.length !== 5) { throw new Error("string content length should include ZWNBSP") }
}
