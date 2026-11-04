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
/*
 * @id SEM_15_07_00_105_FAIL_global_condition_initializer
 * @expect compile-fail
 * @section 15.7
 * @design 全局初始化依赖条件缩窄。
 * @note Generated one-to-one from test_design.
 */

function sem1507Fail010GlobalConditionInitializer(): void {
  let value: string = 1
}

