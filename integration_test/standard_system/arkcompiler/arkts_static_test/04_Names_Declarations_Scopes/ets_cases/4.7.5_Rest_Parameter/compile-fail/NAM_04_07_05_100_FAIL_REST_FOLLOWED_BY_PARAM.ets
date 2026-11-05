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
 * @id NAM_04_07_05_100_FAIL_REST_FOLLOWED_BY_PARAM
 * @expect compile-fail
 * @section 4.7.5
 * @design rest参数后还有其他参数
 * @note 反向用例：验证 rest 参数后不能有其他参数
 */
function badRest(...args: number[], extra: string): void {}
