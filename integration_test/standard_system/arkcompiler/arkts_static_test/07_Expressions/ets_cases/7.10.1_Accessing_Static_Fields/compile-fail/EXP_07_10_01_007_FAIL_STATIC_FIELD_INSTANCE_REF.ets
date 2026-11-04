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
 * @id EXP_07_10_01_007_FAIL_STATIC_FIELD_INSTANCE_REF
 * @expect compile-fail
 * @section 7.10.1
 * @design 通过实例引用访问静态字段：静态字段必须通过类名（typeReference）访问，而非实例
 * @note 反向用例：验证访问静态字段时 objectReference 必须为 typeReference，实例引用应报编译错误
 */
class Service {
    public static instanceCount: int = 0
}
let s: Service = new Service()
let c: int = s.instanceCount
