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
 * @id EXP_07_17_02_004_PASS_INSTANCEOF_GUARD_AS
 * @expect compile-pass
 * @section 7.17.2
 * @design 验证 instanceof 守卫后 as cast 编译通过
 * @note 正向用例：if (x instanceof Person) { x as Person } 安全 cast
 */
class Person {
    public name: string = ''
}

function printName(x: Object): void {
    if (x instanceof Person) {
        let p = x as Person
    }
}
