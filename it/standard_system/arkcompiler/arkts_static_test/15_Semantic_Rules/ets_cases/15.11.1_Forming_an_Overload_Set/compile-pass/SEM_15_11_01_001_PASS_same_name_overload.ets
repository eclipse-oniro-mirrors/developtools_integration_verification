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
 * @id SEM_15_11_01_001_PASS_same_name_overload
 * @expect compile-pass
 * @section 15.11.1
 * @design 形成重载集：同名函数构成重载集
 * @note 正向用例：同名函数不同参数类型构成重载集
 */
function proc(x: int): string { return 'int'; }
function proc(x: string): string { return 'str'; }
function main(): void {
    let r: string = proc(42);
    console.log(r);
}
