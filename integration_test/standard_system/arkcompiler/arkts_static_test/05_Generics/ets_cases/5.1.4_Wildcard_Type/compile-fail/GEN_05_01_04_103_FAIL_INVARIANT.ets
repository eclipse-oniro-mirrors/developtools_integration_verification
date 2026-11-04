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
 * @id GEN_05_01_04_103_FAIL_INVARIANT
 * @expect compile-fail
 * @section 5.1.4
 * @design 通配符写入 invariant-position（propread）
 * @note 反向用例：验证 invariant T 通配符属性写入编译错误（spec 5.1.4 行 489）
 */
class C {}
interface X<T extends C> {
    read(): T;
    write(p: T): void;
    prop: T;
}
function foo(o: Object): void {
    if (o instanceof X) {
        o.prop = o.read();  // Compile-time error: T in invariant position
    }
}
