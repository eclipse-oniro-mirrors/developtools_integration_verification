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
 * @id TYP_03_21_07_004_PASS_WITH_PARAMS
 * @expect compile-pass
 * @section 3.21.7
 * @design 带参函数类型提取返回类型
 * @note 正向用例
 */
type WithParams = ReturnType<(a: int, b: string) => int>

function testWithParams(): void {
  let v: WithParams = 42
}