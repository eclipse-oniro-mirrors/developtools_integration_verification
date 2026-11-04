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
 * @id ITF_10_06_002_PASS_DIAMOND_INHERITANCE
 * @expect compile-pass
 * @section 10.6
 * @design 菱形继承
 * @note 正向用例：验证接口菱形继承合并相同成员
 */
interface A {
    common(): void;
}
interface B extends A {
    b(): void;
}
interface C extends A {
    c(): void;
}
interface D extends B, C {
    d(): void;
}
class ImplD implements D {
    common(): void {}
    b(): void {}
    c(): void {}
    d(): void {}
}
