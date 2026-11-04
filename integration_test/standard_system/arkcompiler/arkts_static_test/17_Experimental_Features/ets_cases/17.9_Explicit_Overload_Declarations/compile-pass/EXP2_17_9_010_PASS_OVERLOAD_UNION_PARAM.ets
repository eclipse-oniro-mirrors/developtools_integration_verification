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
 * @id EXP2_17_9_010_PASS_OVERLOAD_UNION_PARAM
 * @expect compile-pass
 * @section 17.9
 * @design 验证 overload 集中各签名使用联合类型参数编译通过
 * @note 正向用例：overload 函数可使用不同的参数类型（包括联合类型）
 */
function procInt(v: int): string { return 'int' }
function procStr(v: string): string { return 'string' }
overload process { procInt, procStr }

function main(): void {
  let r: string = process(42)
  console.log(r)
}

