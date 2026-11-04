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
 * @id LEX_02_04_014_PASS_LINE_SEP_AFTER_COMMENT
 * @expect compile-pass
 * @section 2.4
 * @design 行终止符位于行末单行注释后
 * @note 正向用例：// comment 后跟行终止符正常分隔
 */
function testLineSepAfterComment(): void {
  let a: int = 1 // comment line 1
  let b: int = 2 // comment line 2
  let c: int = a + b
}
