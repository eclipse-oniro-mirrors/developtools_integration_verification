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
 * @id EXP_07_13_01_006_PASS_LONG_TO_INT_CONVERSION
 * @expect compile-pass
 * @section 7.13.1
 * @design 验证 long 类型通过 .toInt() 显式转换为 int 后作为索引
 * @note 正向用例：arr[longVar.toInt()] 显式转换后合法
 */
function main(): void {
  let names: string[] = ['Alice', 'Bob', 'Carol'];
  let idx: long = 1;
  let s: string = names[idx.toInt()];
}
