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
 * @id EXP_07_13_01_002_PASS_SHORT_BYTE_INDEX
 * @expect compile-pass
 * @section 7.13.1
 * @design 验证 byte 和 short 类型索引合法：通过加宽数值转换到 int
 * @note 正向用例：byte/short 变量作为数组索引，加宽转换到 int 后合法
 */
function main(): void {
  let names: string[] = ['Alice', 'Bob', 'Carol'];
  let b: byte = 0;
  let s: short = 2;
  let s1: string = names[b];
  let s2: string = names[s];
}
