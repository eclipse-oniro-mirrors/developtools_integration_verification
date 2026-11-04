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
 * @id LEX_02_04_026_RT_MULTILINE_COMMENT_NO_EFFECT
 * @expect runtime
 * @section 2.4
 * @design 多行注释跨行不影响后续语句执行
 * @note 运行时用例：多行注释含真实行终止符
 */
function main(): void {
  /*
   * this comment
   * spans multiple
   * lines
   */
  let x: int = 42
  if (x !== 42) { throw new Error("x !== 42") }
}
