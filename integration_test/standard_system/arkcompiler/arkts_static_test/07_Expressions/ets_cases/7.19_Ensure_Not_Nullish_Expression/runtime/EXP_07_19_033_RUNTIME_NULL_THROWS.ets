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
 * @id EXP_07_19_033_RUNTIME_NULL_THROWS
 * @expect runtime
 * @section 7.19
 * @design 验证 null 值应用 ! 运行时抛出 NullPointerError
 * @runtime-throws=NullPointerError
 * @note 运行时用例：null! 运行时抛出 NullPointerError
 */
function main(): void {
    let x: int | null = null
    let y: int = x!
    // should not reach here
    console.log('verified')
}
