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
 * @id EXP2_17_14_011_FAIL_NON_RECEIVER_PARAM
 * @expect compile-fail
 * @section 17.14
 * @design NON_RECEIVER_PARAM
 * @note spec: missing CTE check
 */
function foo(cb: () => void, x: int): void {}
function test(): void { foo(1) {} }

