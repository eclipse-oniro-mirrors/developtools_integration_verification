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
 * @id TYP_03_12_008_PASS_NULL_SWITCH_CASE
 * @expect compile-pass
 * @section 3.12
 * @design null 在 switch 语句中作为 case 匹配值
 * @note 正向用例：验证 null 可以作为 switch-case 的匹配值
 */
function testNullSwitchCase(): void {
  let x: string | null = null
  switch (x) {
    case null:
      break
    default:
      break
  }
}