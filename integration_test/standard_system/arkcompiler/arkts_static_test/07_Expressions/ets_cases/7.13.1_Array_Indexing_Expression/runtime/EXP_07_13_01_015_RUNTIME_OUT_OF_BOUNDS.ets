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
 * @id EXP_07_13_01_015_RUNTIME_OUT_OF_BOUNDS
 * @expect runtime
 * @runtime-throws=RangeError
 * @section 7.13.1
 * @design 验证数组越界索引运行时抛出 RangeError
 * @note 运行时用例：索引小于 0 或大于等于数组长度时抛出 RangeError
 */
function main(): void {
  let arr: int[] = [10, 20, 30];
  let val: int = arr[5];
  console.log('verified');
}
