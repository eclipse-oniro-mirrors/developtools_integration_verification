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
 * @id EXP_07_34_013_RUNTIME_INTERPOLATION_IMPLICIT
 * @expect runtime
 * @section 7.34
 * @design 闅愬紡杞?string 鐨勫祵鍏ヨ〃杈惧紡

 * @note 杩愯鏃剁敤渚嬶細瀹為檯鎵ц楠岃瘉闅愬紡杞崲宓屽叆
 */
function main(): void {
  let num: int = 42; let msg: string = `Value is ${num}`
  if (msg != 'Value is 42') {
    throw new Error('assertion: interpolation with int')
  }
console.log('verified')
}
