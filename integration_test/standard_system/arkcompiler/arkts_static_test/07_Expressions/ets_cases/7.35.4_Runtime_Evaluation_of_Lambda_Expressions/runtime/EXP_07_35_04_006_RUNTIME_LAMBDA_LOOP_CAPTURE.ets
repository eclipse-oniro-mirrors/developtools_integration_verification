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
 * @id EXP_07_35_04_006_RUNTIME_LAMBDA_LOOP_CAPTURE
 * @expect runtime
 * @section 7.35.4
 * @design Lambda 鎹曡幏鍙橀噺涓哄紩鐢紙闈炴嫹璐濓級鈥斺€斾慨鏀瑰閮ㄥ彉閲忓奖鍝?Lambda 鍐呴儴鍊?
 * @note 杩愯鏃剁敤渚嬶細瀹為檯鎵ц楠岃瘉 Lambda 鎹曡幏寮曠敤璇箟銆侫rkTS Lambda 鎹曡幏鍙橀噺涓哄紩鐢紝淇敼澶栭儴鍙橀噺浼氬弽鏄犲湪 Lambda 涓€?
 */
function main(): void {
  let count: int = 0
  let getCount: () => int = () => count
  let r0: int = getCount()
  if (r0 != 0) { throw new Error('assertion: initial count should be 0, got ' + r0) }
  count = 42
  let r1: int = getCount()
  if (r1 != 42) { throw new Error('assertion: count changed to 42, got ' + r1) }
console.log('verified')
}
