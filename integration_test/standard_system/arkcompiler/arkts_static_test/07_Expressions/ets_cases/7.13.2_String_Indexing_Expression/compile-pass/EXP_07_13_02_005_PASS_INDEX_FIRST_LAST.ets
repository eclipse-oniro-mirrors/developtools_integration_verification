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
 * @id EXP_07_13_02_005_PASS_INDEX_FIRST_LAST
 * @expect compile-pass
 * @section 7.13.2
 * @design 验证字符串首尾索引正确性：索引 0 和索引 len-1
 * @note 正向用例：字符串首尾字符索引，编译通过
 */
function main(): void {
  let s: string = 'world';
  let first: string = s[0];
  let last: string = s[4];
}
