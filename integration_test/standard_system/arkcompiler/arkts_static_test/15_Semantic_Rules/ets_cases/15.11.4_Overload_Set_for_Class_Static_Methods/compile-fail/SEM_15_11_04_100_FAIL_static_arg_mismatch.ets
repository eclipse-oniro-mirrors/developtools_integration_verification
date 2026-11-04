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
 * @id SEM_15_11_04_100_FAIL_static_arg_mismatch
 * @expect compile-fail
 * @section 15.11.4
 * @design 静态方法重载拒绝：参数不匹配
 * @note 反向用例：boolean 不匹配静态方法 int 参数
 */
class C { static f(x: int): void {} }
function main(): void {
    C.f(true);
}
