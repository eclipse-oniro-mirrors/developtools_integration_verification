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
 * @id LEX_02_10_012_RT_MULTILINE_COMMENT
 * @expect runtime
 * @section 2.10
 * @design 多行注释不影响代码执行
 * @note runtime 用例：验证多行注释不影响代码执行
 */

function main(): void {
  /* This is a multiline comment */
  let x1: int = 1
  if (x1 !== 1) { throw new Error("multiline comment failed") }

  /*
   * This is a multiline comment
   * that spans multiple lines
   */
  let x2: int = 2
  if (x2 !== 2) { throw new Error("multiline comment failed") }

  let x3: int = x1 + x2 /* Comment */ + 3
  if (x3 !== 6) { throw new Error("inline multiline comment failed") }
}
