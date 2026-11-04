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
 * @id ITF_10_06_102_FAIL_MULTI_INHERIT_SETTER_ONLY_READ
 * @expect compile-fail
 * @section 10.6
 * @design 多继承中的 setter-only 属性读取应编译失败
 * @note 反向用例：验证多继承接口中 setter-only 属性读取产生编译错误
 *       规范 §10.6 line 413 — ESE0211
 */
interface I1 {
    set prop2(p: number);
}

interface I2 {
    set prop2(p: number);
}

interface I3 extends I1, I2 {}

function foo(i3: I3): void {
    let x = i3.prop2;  // Compile-time error: no getter for prop2
}
