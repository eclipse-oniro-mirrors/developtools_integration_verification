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
 * @id EXP_07_31_007_RUNTIME_COND_OR_VS_BITWISE
 * @expect runtime
 * @section 7.31
 * @design || 涓?| 鍦?boolean 涓婄粨鏋滅浉鍚屼絾姹傚€兼柟寮忎笉鍚?

 * @note 杩愯鏃剁敤渚嬶細瀹為檯鎵ц楠岃瘉|| vs | 瀵规瘮
 */
let bitwiseEval: boolean = false
function checkEval(): boolean { bitwiseEval = true; return true }
function main(): void {
  let r1: boolean = true | checkEval()
  if (!bitwiseEval) {
    throw new Error('assertion: | should evaluate both sides')
  }
  bitwiseEval = false
  let r2: boolean = true || checkEval()
  if (bitwiseEval) {
    throw new Error('assertion: || should short-circuit')
  }
  if (r1 != r2) {
    throw new Error('assertion: | and || should produce same result on booleans')
  }
console.log('verified')
}
