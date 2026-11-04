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
 * @id EXP_07_02_03_013_FAIL_NULLISH_MIXED_AND
 * @expect compile-fail
 * @section 7.2.3
 * @design 验证 nullish 合并与 && 混合无括号报编译时错误
 * @note 反向用例：spec 规定 ?? 与 && 或 || 混合时必须加括号
 */
function main(): void {
  let x: int = 5;
  let y: int = x ?? 0 && 1;
}
