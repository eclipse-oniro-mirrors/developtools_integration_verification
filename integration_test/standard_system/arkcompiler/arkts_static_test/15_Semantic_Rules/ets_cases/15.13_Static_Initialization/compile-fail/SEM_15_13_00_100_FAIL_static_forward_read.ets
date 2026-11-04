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
 * @id SEM_15_13_00_100_FAIL_static_forward_read
 * @expect compile-fail
 * @section 15.13
 * @design 编译期可检测的静态字段前向读取。
 * @note Generated one-to-one from test_design.
 */

function sem1513Fail001StaticForwardRead(): void {
  let value: string = 1
}

