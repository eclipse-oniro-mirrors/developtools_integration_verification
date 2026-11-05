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
 * @id ENM_11_03_007_FAIL_NON_CONST_INIT_SUBSEQUENT
 * @expect compile-fail
 * @section 11.3
 * @design 非 const 初始化器后必须有显式初始化（spec Wrong 原例）
 * @note 反向用例：B = foo(), C 缺显式初始化器
 */
function foo(): int { return 1 }

enum Wrong {
  A,
  B = foo(),
  C
}