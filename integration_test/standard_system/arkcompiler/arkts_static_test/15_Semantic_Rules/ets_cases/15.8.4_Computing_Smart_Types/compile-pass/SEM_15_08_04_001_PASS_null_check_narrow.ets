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
 * @id SEM_15_08_04_001_PASS_null_check_narrow
 * @expect compile-pass
 * @section 15.8.4
 * @design 计算智能类型：null 检查后类型收窄
 * @note 正向用例：undefined 检查后 string|undefined 收窄为 string
 */
function main(): void {
    let x: string|undefined = 'hello';
    if (x != undefined) {
        let s: string = x;
        console.log(s);
    }
}
