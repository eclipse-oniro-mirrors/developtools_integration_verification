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
 * @id CON_06_05_008_PASS_CHAINED_CONVERSIONS
 * @expect compile-pass
 * @section 6.5
 * @design 链式转换: double.toInt().toLong().toDouble()
 * @note 正向用例
 */
function testChainedConversions(): void {
  let d: double = 3.14
  let i: int = d.toInt()
  let l: long = i.toLong()
  let d2: double = l.toDouble()
}
