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
 * @id LEX_02_04_028_RT_CONSECUTIVE_EMPTY_LINES
 * @expect runtime
 * @section 2.4
 * @design 多个连续 LF 视为单一分隔符，不影响语句执行顺序
 * @note 运行时用例：验证连续空行后语句仍按顺序执行
 */
function main(): void {
  let x: int = 1







  x = x + 5




  x = x * 2
  if (x !== 12) { throw new Error("expected 12, got " + x.toString()) }
}
