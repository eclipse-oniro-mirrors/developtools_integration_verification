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
 * @id EXP_07_13_02_002_PASS_INT_VARIABLE_INDEX
 * @expect compile-pass
 * @section 7.13.2
 * @design 验证 int 变量作为字符串索引合法
 * @note 正向用例：int 类型变量作为字符串索引，编译通过
 */
function main(): void {
  let s: string = 'hello';
  let idx: int = 1;
  let c: string = s[idx];
}
