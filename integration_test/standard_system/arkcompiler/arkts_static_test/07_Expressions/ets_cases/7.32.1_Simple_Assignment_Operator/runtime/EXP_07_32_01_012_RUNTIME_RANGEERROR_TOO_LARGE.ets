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
 * @id EXP_07_32_01_012_RUNTIME_RANGEERROR_TOO_LARGE
 * @expect runtime
 * @runtime-throws=RangeError
 * @section 7.32.1
 * @design 验证数组索引大于等于数组长度时抛出 RangeError：arr[5] = value（len=3）应抛 RangeError，不执行赋值
 * @note 运行时异常用例：当索引 >= length 时，应抛出 RangeError。根据规范第 7.32.1 节，索引 < 0 或 >= length 时抛出 RangeError
 */

function main(): void {
  let arr: int[] = [1, 2, 3];
  arr[5] = 99;  // 应抛出 RangeError（数组长度 3，索引 5 >= 3）
  console.log('verified');
}
