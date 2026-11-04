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
 * @id EXP_07_02_02_016_RUNTIME_ARRAY_INDEX_OOB
 * @expect runtime
 * @section 7.2.2
 * @design 验证数组索引越界时抛出 RangeError：索引 ≥ 数组长度
 * @note 运行时用例：验证该场景的运行时行为
 * @runtime-throws=RangeError
 */
function main(): void {
  let arr: Fixedint[] = [1, 2, 3];
  let oob: int = arr[5];
  console.log('' + oob);
}
