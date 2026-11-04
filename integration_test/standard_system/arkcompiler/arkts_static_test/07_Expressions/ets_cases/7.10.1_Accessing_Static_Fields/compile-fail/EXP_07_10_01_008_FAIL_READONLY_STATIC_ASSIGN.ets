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
 * @id EXP_07_10_01_008_FAIL_READONLY_STATIC_ASSIGN
 * @expect compile-fail
 * @section 7.10.1
 * @design 对 readonly 静态字段赋值：readonly 字段初始化后不允许修改
 * @note 反向用例：验证 readonly 静态字段在声明初始化器之后不可修改（value 语义）
 */
class Config {
    public static readonly MAX_RETRY: int = 5
}
function bad(): void {
    Config.MAX_RETRY = 10
}
