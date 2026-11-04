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
 * @id SEM_15_10_00_118_FAIL_ARCHIVE_main_overload_prohibited
 * @expect compile-fail
 * @section 15.10
 * @design 归档吸纳：main overload prohibited。来源
 *  `Overloading\compile-fail\OVERLOAD_FAIL_025_main_overload_prohibited.ets`；用于补充
 *  `Overloading\compile-fail\OVERLOAD_FAIL_025_main_overload_prohibited.ets`；
 *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source Overloading\compile-fail\OVERLOAD_FAIL_025_main_overload_prohibited.ets
 */
function main(): void {}
// @expect-error: ESE0373 Main overload is not enabled
function main(p: string[]): void {}
