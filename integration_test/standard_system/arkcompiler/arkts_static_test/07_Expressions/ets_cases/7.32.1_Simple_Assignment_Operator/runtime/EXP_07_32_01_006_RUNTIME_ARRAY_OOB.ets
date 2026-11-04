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
 * @id EXP_07_32_01_006_RUNTIME_ARRAY_OOB
 * @expect runtime
 * @section 7.32.1
 * @design 数组越界赋值运行时行为
 * @runtime-throws=RangeError
 * @note 运行时用例：实际执行验证数组越界抛 RangeError
 */
function main(): void {
  let arr: int[] = [1, 2, 3]
  arr[5] = 99
  console.log(arr[0].toString())
}
