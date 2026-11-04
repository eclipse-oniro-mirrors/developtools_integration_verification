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
 * @id CON_06_04_01_002_PASS_SHORT_WIDENING
 * @expect compile-pass
 * @section 6.4.1
 * @design short→int/long/float/double 全部 widening
 * @note 正向用例：验证 short 的 4 种 widening 转换
 */
function testShortWidening(): void {
  let s: short = 2
  let i: int = s
  let l: long = s
  let f: float = s
  let d: double = s
}
