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
 * @id EXP_07_25_01_006_PASS_STRING_NULLISH
 * @expect compile-pass
 * @section 7.25.1
 * @design 验证 string + null/undefined 字符串拼接编译通过
 * @note 正向用例：null→"null"，undefined→"undefined"
 */
function main(): void {
    let s1: string = 'a' + null;
    let s2: string = 'b' + undefined;
    let x: string | null | undefined = null;
    let s3: string = 'val=' + x;
}
