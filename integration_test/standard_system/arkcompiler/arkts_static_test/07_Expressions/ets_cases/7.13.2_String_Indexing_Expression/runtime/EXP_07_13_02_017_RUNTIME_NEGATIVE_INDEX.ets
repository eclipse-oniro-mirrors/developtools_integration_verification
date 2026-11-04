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
 * @id EXP_07_13_02_017_RUNTIME_NEGATIVE_INDEX
 * @expect runtime
 * @runtime-throws=RangeError
 * @section 7.13.2
 * @design 验证字符串负索引时抛出 RangeError：索引 < 0
 * @note 运行时用例：负索引字符串时抛出 RangeError
 */
function main(): void {
  let s: string = 'abc';
  let c: string = s[-1];
  console.log('' + c);
}
