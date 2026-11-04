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
 * @id EXP_07_13_02_007_PASS_CHAINING_SELF_INDEX
 * @expect compile-pass
 * @section 7.13.2
 * @design 验证方法返回结果立即索引：链式调用字符串索引
 * @note 正向用例：函数返回字符串后立即索引，编译通过
 */
function getStr(): string {
  return 'hello';
}
function main(): void {
  let c: string = getStr()[0];
  let c2: string = getStr()[2];
}
