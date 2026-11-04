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
 * @id GEN_05_01_03_001_PASS_RETURN
 * @expect compile-pass
 * @section 5.1.3
 * @design out 返回值位置
 * @note 正向用例：验证 out 类型参数在返回值位置通过编译
 */
class X<out T> {
    private readonly value: T;
    constructor(v: T) { this.value = v; }
    get(): T { return this.value; }
}
