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
 * @id NAM_04_07_06_100_FAIL_LOCAL_SHADOWS_PARAM
 * @expect compile-fail
 * @section 4.7.6
 * @design 局部变量与参数同名，应产生编译错误
 * @note 反向用例：函数体内不能声明与参数同名的变量
 */
function foo(x: int): void {
    let x: int = 1;
}
