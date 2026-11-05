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
 * @id EXP_07_35_03_011_RUNTIME_LAMBDA_TYPE_CHECK
 * @expect runtime
 * @section 7.35.3
 * @design Lambda 绫诲瀷涓哄嚱鏁扮被鍨嬭繍琛屾椂楠岃瘉

 * @note 杩愯鏃剁敤渚嬶細瀹為檯鎵ц楠岃瘉Lambda 绫诲瀷楠岃瘉
 */
function main(): void {
  let f: (x: int) => int = (x: int) => x * 3
  let g: (x: int) => int = f
  if (f(10) != g(10)) {
    throw new Error('assertion: f and g should produce same result')
  }
console.log('verified')
}
