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
 * @id SEM_15_08_01_003_PASS_object_literal_type_expr
 * @expect compile-pass
 * @section 15.8.1
 * @design 规范 15.8.1：Object|C类型表达式上下文中的对象字面量
 * @note 正向用例：foo({num:42})推断对象字面量为C类型
 */
class C {
    public num: int = 1;
}
function foo(x: Object | C): void {}
function main(): void {
    foo({num: 42});
}
