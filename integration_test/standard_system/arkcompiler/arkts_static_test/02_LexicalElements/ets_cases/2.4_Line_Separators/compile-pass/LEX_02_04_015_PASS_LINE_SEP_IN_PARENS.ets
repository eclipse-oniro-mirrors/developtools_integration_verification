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
 * @id LEX_02_04_015_PASS_LINE_SEP_IN_PARENS
 * @expect compile-pass
 * @section 2.4
 * @design 括号 () 内允许换行
 * @note 正向用例：表达式分多行
 */
function testLineSepInParens(): void {
  let x: int = (
    1 +
    2 +
    3
  )
}
