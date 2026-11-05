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
 * @id SEM_15_11_06_002_PASS_constructor_multi_params
 * @expect compile-pass
 * @section 15.11.6
 * @design 构造函数多参数
 * @note 正向用例
 */
class MultiCtor {
    public val: string;
    constructor() { this.val = 'zero'; }
    constructor(v: int) { this.val = v.toString(); }
}
function main(): void {
    let b: MultiCtor = new MultiCtor(42);
    console.log(b.val);
}
