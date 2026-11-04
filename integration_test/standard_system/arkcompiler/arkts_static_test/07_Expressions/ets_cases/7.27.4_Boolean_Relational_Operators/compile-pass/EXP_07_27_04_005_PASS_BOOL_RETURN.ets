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
 * @id EXP_07_27_04_005_PASS_BOOL_RETURN
 * @expect compile-pass
 * @section 7.27.4
 * @design 验证函数返回 boolean 值作为关系操作数编译通过
 * @note 正向用例：函数返回值作为 boolean 关系操作数
 */
function getTrue(): boolean {
    return true;
}
function getFalse(): boolean {
    return false;
}
let r1: boolean = getFalse() < getTrue();
let r2: boolean = getFalse() <= getFalse();
let r3: boolean = getTrue() > getFalse();
let r4: boolean = getTrue() >= getTrue();
let r5: boolean = getFalse() > getTrue();
let r6: boolean = getTrue() < getFalse();
