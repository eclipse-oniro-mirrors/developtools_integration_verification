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
 * @id TYP_03_06_01_004_PASS_WIDENING_SHORT_TO_LARGER
 * @expect compile-pass
 * @section 3.6.1
 * @design short 隐式 widening 到 int/long/float/double
 * @note 正向用例：short 可隐式转换为所有更大数值类型
 */
function testWideningShort(): void {
  let s: short = 1000

  let i: int = s
  let l: long = s
  let f: float = s
  let d: double = s
}