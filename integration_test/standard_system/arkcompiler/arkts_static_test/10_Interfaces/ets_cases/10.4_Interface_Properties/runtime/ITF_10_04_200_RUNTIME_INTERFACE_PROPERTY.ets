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
 * @id ITF_10_04_200_RUNTIME_INTERFACE_PROPERTY
 * @expect runtime
 * @section 10.4
 * @design 接口属性运行时访问
 * @note 运行时用例：验证实现接口的类属性在运行时正确
 */
interface Named {
    name: string;
}
class Person implements Named {
    name: string = "Alice";
}
function main(): void {
    let p: Person = new Person();
    if (p.name != "Alice") throw new Error("assertion failed: " + p.name);

    console.log("verified");
}