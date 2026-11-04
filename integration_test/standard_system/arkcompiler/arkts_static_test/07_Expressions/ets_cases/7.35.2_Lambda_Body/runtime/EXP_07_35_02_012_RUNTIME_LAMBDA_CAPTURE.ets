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
 * @id EXP_07_35_02_012_RUNTIME_LAMBDA_CAPTURE
 * @expect runtime
 * @section 7.35.2
 * @design Lambda 鎹曡幏鍙橀噺涓哄紩鐢ㄩ潪鎷疯礉

 * @note 杩愯鏃剁敤渚嬶細瀹為檯鎵ц楠岃瘉Lambda 鍙橀噺鎹曡幏寮曠敤
 */
function main(): void {
  let count: int = 0
  let increment: () => void = () => { count++ }
  increment()
  if (count != 1) {
    throw new Error('assertion: captured var should be 1')
  }
  increment()
  if (count != 2) {
    throw new Error('assertion: captured var should be 2')
  }
console.log('verified')
}
