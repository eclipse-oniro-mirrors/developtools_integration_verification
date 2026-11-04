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
 * @id LEX_02_06_040_PASS_NL_LETTER_NUMBER_START
 * @expect compile-pass
 * @section 2.6
 * @design 补充测试因子：Unicode Nl(Letter Number) 如罗马数字 U+2160 可作为 IdentifierStart（实现实测支持）
 * @note 正向用例：补齐 checklist 对 Unicode 类别边界的覆盖
 */
function testNlStart(): void {
  let Ⅰvar: int = 1
  let Ⅱvar: int = 2
}
