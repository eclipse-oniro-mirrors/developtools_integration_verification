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
 * @id LEX_02_02_020_RT_COMMENT_NO_EFFECT
 * @expect runtime
 * @section 2.2
 * @design 单行注释和多行注释不影响变量值 * @note 运行时用例：实际执行验证语义正确性

 */
function main(): void {
  let x: int = 42 // this is a comment
  /* another comment */
  let y: int = 100
  if (x !== 42) { throw new Error("x !== 42") }
  if (y !== 100) { throw new Error("y !== 100") }
}
