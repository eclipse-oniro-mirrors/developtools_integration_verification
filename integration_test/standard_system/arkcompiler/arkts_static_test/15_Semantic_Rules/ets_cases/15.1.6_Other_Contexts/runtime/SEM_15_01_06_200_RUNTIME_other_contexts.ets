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
 * @id SEM_15_01_06_200_RUNTIME_other_contexts
 * @expect runtime
 * @section 15.1.6
 * @design 其他上下文运行时行为
 * @note 运行时用例
 */
function main(): void {
let x = 42;
let y: int = x;
if (y != 42) {
    throw new Error('fail');
  }
console.log('verified');
};