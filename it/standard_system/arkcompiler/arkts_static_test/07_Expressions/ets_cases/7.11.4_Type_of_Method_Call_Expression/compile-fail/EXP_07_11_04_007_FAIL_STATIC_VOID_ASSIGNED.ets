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
 * @id EXP_07_11_04_007_FAIL_STATIC_VOID_ASSIGNED
 * @expect compile-fail
 * @section 7.11.4
 * @design 验证 static void 方法返回值不能赋值给变量（void 不能作类型注解）
 * @note 反向用例：A.method() 返回 void，赋值给变量，spec 要求编译时错误
 *       ⚠️ SPEC 不一致：spec 要求 "Compile-time error as void cannot be used as type annotation"，
 *       但 ArkTS 编译器实际允许编译通过（推断为 undefined 类型）
 *       分类：D 类（Spec 与实现不一致）
 */
class A {
  static method(): void {
    let msg: string = 'test';
  }
}

function main(): void {
  let x = A.method();
}
