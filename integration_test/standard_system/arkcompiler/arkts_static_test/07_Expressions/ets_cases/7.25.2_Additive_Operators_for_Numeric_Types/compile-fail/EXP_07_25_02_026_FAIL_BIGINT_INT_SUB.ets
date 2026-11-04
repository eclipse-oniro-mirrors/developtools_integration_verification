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
 * @id EXP_07_25_02_026_FAIL_BIGINT_INT_SUB
 * @expect compile-fail
 * @section 7.25.2
 * @design 验证 bigint - int 产生编译错误。
 *         spec：- 要求两个操作数都是 bigint，或都可转换为数值类型；bigint 和 int 混合不符合任一条件。
 * @note 反向用例：bigint-int 类型混合编译错误
 */
function main(): void {
  let b: bigint = 100n
  let i: int = 42
  let r = b - i  // error: bigint and int mixed
}
main()
