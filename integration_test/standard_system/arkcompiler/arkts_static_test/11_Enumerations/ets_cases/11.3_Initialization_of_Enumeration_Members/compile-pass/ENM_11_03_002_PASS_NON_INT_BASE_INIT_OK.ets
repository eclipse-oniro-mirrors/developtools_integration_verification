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
 * @id ENM_11_03_002_PASS_NON_INT_BASE_INIT_OK
 * @expect compile-pass
 * @section 11.3
 * @design long 基类无初始化器 → 自动递增（整数基类合法）
 * @note 正向用例：spec E2
 */
enum E2: long { K, L }

function testNonIntBaseInitOk(): void {
  let k: long = E2.K
  let l: long = E2.L
}