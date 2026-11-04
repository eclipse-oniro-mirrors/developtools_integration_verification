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
 * @id EXP_07_02_01_007_PASS_RETURN_TARGET
 * @expect compile-pass
 * @section 7.2.1
 * @design 函数返回值类型作为 target type，return 表达式匹配返回类型
 * @note 正向用例：验证返回值类型作为 target type
 */
function getInt(): int {
  return 42
}

function getString(): string {
  return 'hello'
}

function getBoolean(): boolean {
  return true
}
