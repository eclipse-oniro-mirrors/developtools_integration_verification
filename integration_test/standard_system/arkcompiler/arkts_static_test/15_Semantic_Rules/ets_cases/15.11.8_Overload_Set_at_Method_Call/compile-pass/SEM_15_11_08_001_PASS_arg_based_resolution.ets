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
 * @id SEM_15_11_08_001_PASS_arg_based_resolution
 * @expect compile-pass
 * @section 15.11.8
 * @design 调用时重载集：按实参解析
 * @note 正向用例：根据实参类型选择正确重载
 */
function show(x: int): string { return 'i'; }
function show(x: string): string { return 's'; }
function main(): void {
    let r: string = show(1) + show('a');
    console.log(r);
}
