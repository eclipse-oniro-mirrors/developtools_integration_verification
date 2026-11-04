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
 * @id SEM_15_07_01_101_FAIL_union_ambiguity
 * @expect compile-fail
 * @section 15.7.1
 * @design 规范 15.7.1 Case 2：联合类型推断歧义或无匹配类型
 * @note 反向用例：byte|string=128无匹配, byte|long=127歧义, float|double=1歧义
 */
function main(): void {
    let c: byte | string = 127;
    c = 128;
    let e: byte | long = 128;
    e = 127;
    let g: float | double = 3.4e39;
    g = 1;
}
