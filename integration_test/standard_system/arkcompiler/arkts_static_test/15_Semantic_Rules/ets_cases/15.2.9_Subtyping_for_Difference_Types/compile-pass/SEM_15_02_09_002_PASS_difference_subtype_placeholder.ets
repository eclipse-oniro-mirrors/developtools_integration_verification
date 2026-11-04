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
 * @id SEM_15_02_09_002_PASS_difference_subtype_placeholder
 * @expect compile-pass
 * @section 15.2.9
 * @design 差分类型子类型—null 检查排除 undefined 后的类型收窄
 * @note 替代测试：null/undefined 检查模拟差分语义
 */
function main(): void {
    let x: string | undefined | null = 'hello';
    if (x != undefined && x != null) {
        let s: string = x;
        console.log(s.length);
    }
}
