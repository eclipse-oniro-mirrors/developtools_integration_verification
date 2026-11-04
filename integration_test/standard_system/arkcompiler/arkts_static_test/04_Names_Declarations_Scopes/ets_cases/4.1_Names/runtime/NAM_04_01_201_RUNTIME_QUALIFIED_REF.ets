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
 * @id NAM_04_01_201_RUNTIME_QUALIFIED_REF
 * @expect runtime
 * @section 4.1
 * @design 运行时限定名引用
 * @note 运行时用例：验证限定名在运行时正确访问
 */
class Data {
    static value: number = 42;
    instanceVal: number = 99;
}
function main(): void {
    let d: Data = new Data();
    if (Data.value != 42) {
        throw new Error("assertion failed: " + Data.value);
    }
    if (d.instanceVal != 99) {
        throw new Error("assertion failed: " + d.instanceVal);
    }
    console.log("verified");
}
