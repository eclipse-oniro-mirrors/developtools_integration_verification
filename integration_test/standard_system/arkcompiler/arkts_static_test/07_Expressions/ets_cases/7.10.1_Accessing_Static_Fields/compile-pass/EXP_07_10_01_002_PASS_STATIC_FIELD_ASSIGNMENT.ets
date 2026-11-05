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
 * @id EXP_07_10_01_002_PASS_STATIC_FIELD_ASSIGNMENT
 * @expect compile-pass
 * @section 7.10.1
 * @design 非 readonly 静态字段赋值：修改后后续读取反映新值（variable 语义）
 * @note 正向用例：验证非 readonly 静态字段结果值为 variable，可后续修改
 */
class Config {
    public static timeout: int = 1000
    public static retryCount: int = 3
}
function updateConfig(): void {
    Config.timeout = 2000
    Config.retryCount = 5
}
let t: int = Config.timeout
