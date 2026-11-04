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
 * @id EXP_07_10_02_003_PASS_READONLY_FIELD_ACCESS
 * @expect compile-pass
 * @section 7.10.2
 * @design readonly 实例字段读取：obj.readonlyField 返回 value，不可作为左值
 * @note 正向用例：验证 readonly 实例字段访问返回 value（只读语义）
 */
class Data {
    public readonly id: int = 100
    public readonly name: string = 'fixed'
}
let d: Data = new Data()
let id: int = d.id
let name: string = d.name
