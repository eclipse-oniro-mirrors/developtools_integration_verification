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
 * @id EXP_07_13_03_006_PASS_CASE2_STRING_KEY
 * @expect compile-pass
 * @section 7.13.3
 * @design Case 2: Key 为 string 类型，索引无限制，结果类型为 Value | undefined
 * @note 正向用例：Record<string, int> 使用 string 变量索引，编译通过
 */
function main(): void {
  let x: Record<string, int> = {
    'a': 10,
    'b': 20
  };
  let k: string = 'a';
  let v: int | undefined = x[k];
}
