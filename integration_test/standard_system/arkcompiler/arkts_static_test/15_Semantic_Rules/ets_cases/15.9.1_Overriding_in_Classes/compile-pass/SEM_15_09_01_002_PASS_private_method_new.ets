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
 * @id SEM_15_09_01_002_PASS_private_method_new
 * @expect compile-pass
 * @section 15.9.1
 * @design Private method in superclass not accessible, so same-name method in subclass is a new method, not override
 * @note Spec lines 58-64
 */
class Base {
    private private_member(): void {}
}
class Derived extends Base {
    private_member(): void {}
}
function main(): void {
    let d: Derived = new Derived();
    d.private_member();
}
