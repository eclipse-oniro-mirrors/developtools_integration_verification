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
 * @id EXP2_17_09_2_017_FAIL_INACCESSIBLE_METHOD
 * @expect compile-fail
 * @section 17.9.2
 * @design overload 声明引用了父类的 private 方法应产生编译时错误——子类 overload 列表不可引用父类不可访问的方法
 * @note 反向用例：spec 要求 overload 引用不可访问方法时报错，但 ArkTS 实际编译通过
 *       ⚠️ SPEC 不一致：spec 要求不可访问的父类方法在 overload 中引用产生编译错误，实现允许通过
 *       分类：D 类（Spec 与实现不一致）
 */
class C017 {
    private foo(x: int): void {}
}
class D017 extends C017 {
    foo(x: int): void {}
    overload foo {foo}
}
