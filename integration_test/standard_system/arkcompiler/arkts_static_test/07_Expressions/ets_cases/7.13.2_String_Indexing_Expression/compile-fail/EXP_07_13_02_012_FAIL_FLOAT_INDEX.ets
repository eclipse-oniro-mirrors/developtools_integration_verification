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
 * @id EXP_07_13_02_012_FAIL_FLOAT_INDEX
 * @expect compile-fail
 * @section 7.13.2
 * @design 验证 float 类型无转换作为字符串索引编译时错误：索引必须为 int 类型
 * @note 反向用例：float 类型直接作为字符串索引，编译时错误
 */
function main(): void {
  let s: string = 'arkts';
  let f: float = 0.0;
  let c: string = s[f];
}
