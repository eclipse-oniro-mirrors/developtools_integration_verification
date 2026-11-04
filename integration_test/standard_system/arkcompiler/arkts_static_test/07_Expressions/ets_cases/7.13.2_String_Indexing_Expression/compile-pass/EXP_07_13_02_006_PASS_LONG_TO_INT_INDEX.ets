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
 * @id EXP_07_13_02_006_PASS_LONG_TO_INT_INDEX
 * @expect compile-pass
 * @section 7.13.2
 * @design 验证 long→.toInt() 显式转换后可作为字符串索引
 * @note 正向用例：long 类型通过 .toInt() 转换后索引字符串，编译通过
 */
function main(): void {
  let s: string = 'arkts';
  let l: long = 2;
  let c: string = s[l.toInt()];
}
