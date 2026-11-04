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
 * @id EXP2_17_9_009_PASS_OVERLOAD_DEFAULT_PARAMS
 * @expect compile-pass
 * @section 17.9
 * @design 验证 overload 集中各候选函数可带不同默认参数值编译通过
 * @note 正向用例：overload 集中各函数签名可独立声明默认参数
 */
function addInt(x: int, y: int = 0): int { return x + y }
function addDouble(x: double, y: double = 0.0): double { return x + y }
overload add { addInt, addDouble }

function main(): void {
  let r1: int = add(1)
  let r2: double = add(2.0, 3.0)
  console.log(r1.toString() + r2.toString())
}

