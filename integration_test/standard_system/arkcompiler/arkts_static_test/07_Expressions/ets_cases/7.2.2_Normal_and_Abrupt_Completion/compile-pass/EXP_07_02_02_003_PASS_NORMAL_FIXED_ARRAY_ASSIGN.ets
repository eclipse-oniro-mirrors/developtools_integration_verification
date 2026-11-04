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
 * @id EXP_07_02_02_003_PASS_NORMAL_FIXED_ARRAY_ASSIGN
 * @expect compile-pass
 * @section 7.2.2
 * @design 验证定长数组正确类型赋值：元素类型匹配的赋值正常完成，无 ArrayStoreError
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function main(): void {
  let arr: Fixedint[] = [1, 2, 3];
  arr[0] = 100;
  arr[1] = 200;
  arr[2] = 300;
  let total: int = arr[0] + arr[1] + arr[2];
  console.log('' + total);
}
