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
 * @id ITF_10_05_201_RUNTIME_INTERFACE_PROPERTY
 * @expect runtime
 * @section 10.5
 * @design 接口属性运行时
 * @note 运行时用例：验证类实现接口属性运行时正确
 */
interface HasName {
    name: string;
}
class Person implements HasName {
    name: string = "Alice";
}
function main(): void {
    let p: HasName = new Person();
    if (p.name != "Alice") { throw new Error("assertion failed: " + p.name); }
    console.log("verified");
}
