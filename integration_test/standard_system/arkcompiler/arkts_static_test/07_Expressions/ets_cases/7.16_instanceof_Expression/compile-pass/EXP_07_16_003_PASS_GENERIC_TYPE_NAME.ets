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
 * @id EXP_07_16_003_PASS_GENERIC_TYPE_NAME
 * @expect compile-pass
 * @section 7.16
 * @design 验证泛型类名（擦除后）作为 instanceof 的 T 操作数编译通过
 * @note 正向用例：泛型类型名称可以在 instanceof 中使用（已擦除检查）
 */
class A<T> {}
class B<T> extends A<T> {}

let x = new B<string>()
let r: boolean = x instanceof B
