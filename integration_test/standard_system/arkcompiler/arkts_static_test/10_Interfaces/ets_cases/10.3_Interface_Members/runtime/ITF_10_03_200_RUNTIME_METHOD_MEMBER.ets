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
 * @id ITF_10_03_200_RUNTIME_METHOD_MEMBER
 * @expect runtime
 * @section 10.3
 * @design 接口方法成员运行时调用
 * @note 运行时用例：验证接口中声明的方法在实现类中正确执行
 */
interface Greeter {
    greet(): string;
}
class Hello implements Greeter {
    greet(): string { return "hello"; }
}
function main(): void {
    let g: Greeter = new Hello();
    let msg: string = g.greet();
    if (msg != "hello") { throw new Error("assertion failed: " + msg); }
    console.log("verified");
}
