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
 * @id ITF_10_01_200_RUNTIME_INTERFACE_POLYMORPHISM
 * @expect runtime
 * @section 10.1
 * @design 接口类型变量运行时多态
 * @note 运行时用例：验证接口类型变量可引用实现类实例并正确调用方法
 */
interface Shape {
    area(): number;
}
class Circle implements Shape {
    area(): number { return 314; }
}
function main(): void {
    let s: Shape = new Circle();
    let a: number = s.area();
    if (a != 314) { throw new Error("assertion failed: " + a); }
    console.log("verified");
}
