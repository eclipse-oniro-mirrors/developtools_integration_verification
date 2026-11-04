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
 * @id EXP2_17_15_003_PASS_GETTER_SETTER_PAIR
 * @expect compile-pass
 * @section 17.15
 * @design 顶层 getter 和 setter 配对声明，共享 backing 变量
 * @note 正向用例：验证 getter+setter 配对编译通过
 */
let g_pairValue: int = 0

get pairValue(): int {
  return g_pairValue
}

set pairValue(v: int) {
  g_pairValue = v
}
