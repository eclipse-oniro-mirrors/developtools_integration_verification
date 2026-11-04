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
 * @id EXP_07_02_02_002_PASS_NORMAL_ARRAY_INDEX
 * @expect compile-pass
 * @section 7.2.2
 * @design 验证数组索引正常完成：有效索引（arr[0], arr[length-1]）无 RangeError 抛出
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function main(): void {
  let arr: Fixedint[] = [10, 20, 30];
  let first: int = arr[0];
  let last: int = arr[2];
  let mid: int = arr[1];
  console.log('' + first + last + mid);
}
