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
 * @id EXP_07_06_02_018_FAIL_SETTER_ONLY_READ
 * @expect compile-fail
 * @section 7.6.2
 * @design 读取 setter-only 属性：setter-only 属性无 getter，读取应编译时错误
 * @note 反向用例：验证 setter-only 属性不可读取
 */
interface I1 {
    set attr(attr: number)
}
function test(): void {
    const i1: I1 = {attr: 42}
    let x = i1.attr
}
