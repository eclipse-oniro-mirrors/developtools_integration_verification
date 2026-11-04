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
 * @id EXP_07_02_02_009_PASS_NORMAL_STRING_INDEX
 * @expect compile-pass
 * @section 7.2.2
 * @design 验证字符串索引正常完成：有效索引范围无 RangeError
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function main(): void {
  let s: string = 'hello';
  let c1: string = s[0];
  let c2: string = s[4];
  let len: int = s.length;
  if (len > 0) {
    let last: string = s[len - 1];
    console.log('' + c1 + c2 + last);
  }
}
