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
 * @id LEX_02_04_011_PASS_ALL_LINE_SEP_MIX
 * @expect compile-pass
 * @section 2.4
 * @design 同一文件混用 4 种行终止符 LF/CR/LS/PS
 * @note 正向用例：全部 4 种行终止符混用
 */
function testAllLineSepMix(): void {
  let a: int = 1  let b: int = 2   let c: int = 3   let d: int = a + b + c
}
