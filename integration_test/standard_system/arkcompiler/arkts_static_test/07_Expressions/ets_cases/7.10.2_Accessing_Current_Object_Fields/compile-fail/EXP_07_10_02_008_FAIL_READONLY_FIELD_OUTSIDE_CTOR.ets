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
 * @id EXP_07_10_02_008_FAIL_READONLY_FIELD_OUTSIDE_CTOR
 * @expect compile-fail
 * @section 7.10.2
 * @design 构造器外对 readonly 实例字段赋值：readonly 字段初始化后不可修改
 * @note 反向用例：验证 readonly 实例字段在构造器外赋值应报编译错误
 */
class Data {
    public readonly id: int = 100
}
function bad(): void {
    let d: Data = new Data()
    d.id = 200
}
