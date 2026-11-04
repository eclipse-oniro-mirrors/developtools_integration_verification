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
 * @id SEM_15_10_04_100_FAIL_EQUIVALENT_SIG
 * @expect compile-fail
 * @section 15.10.4
 * @design 验证等价签名拒绝：仅返回值不同的重载应报错
 * @note 反向用例：foo(x: int): string 和 foo(x: int): int 不可区分
 */
function foo(x: int): string { return 'int'; }
function foo(x: int): int { return 42; }
function main(): void {}
