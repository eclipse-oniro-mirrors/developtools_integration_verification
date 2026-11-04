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
 * @id TYP_03_06_02_026_FAIL_INT_MOD_LITERAL_ZERO
 * @expect compile-fail
 * @section 3.6.2
 * @design 整数字面量取模 0 应编译失败
 * @note 反向用例：取模与除法同样规则
 */
function main(): void {
  let c: int = 10 % 0
  console.log(c)
}