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
 * @id EXP_07_32_02_011_RUNTIME_COMPOUND_NULLISH
 * @expect runtime
 * @section 7.32.2
 * @design ??= 绌哄€煎悎骞惰祴鍊硷紙宸︿晶 null/undefined 鏃惰祴鍊硷級
 * @note 杩愯鏃剁敤渚嬶細瀹為檯鎵ц楠岃瘉 ??= 绌哄€煎悎骞惰祴鍊?
 */
function main(): void {
  let x: int | undefined = undefined
  x = x ?? 42
  if (x != 42) {
    throw new Error('assertion: should be 42')
  }
  x = x ?? 99
  if (x != 42) {
    throw new Error('assertion: should stay 42')
  }
console.log('verified')
}
