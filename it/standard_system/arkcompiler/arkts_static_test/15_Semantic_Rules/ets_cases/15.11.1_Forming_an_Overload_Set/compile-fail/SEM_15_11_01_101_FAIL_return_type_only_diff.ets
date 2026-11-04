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
 * @id SEM_15_11_01_101_FAIL_return_type_only_diff
 * @expect compile-fail
 * @section 15.11.1
 * @design 仅返回类型不同不构成重载
 * @note 反向用例
 */
function same(x: int): string { return 'a'; }
function same(x: int): string { return 'b'; }
function main(): void {}
