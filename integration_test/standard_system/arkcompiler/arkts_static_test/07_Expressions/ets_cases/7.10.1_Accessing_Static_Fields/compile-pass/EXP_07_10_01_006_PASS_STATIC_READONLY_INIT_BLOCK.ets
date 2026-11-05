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
 * @id EXP_07_10_01_006_PASS_STATIC_READONLY_INIT_BLOCK
 * @expect compile-pass
 * @section 7.10.1
 * @design 在静态字段初始化器中设置 readonly 静态字段：readonly 字段可在声明时通过初始化器赋值
 * @note 正向用例：验证 readonly 静态字段通过声明初始化器（field initializer）赋值
 */
class AppConfig {
    public static readonly APP_NAME: string = 'MyApp'
    public static readonly VERSION: string = '1.0.0'
    public static readonly MAX_CONNECTIONS: int = 100
}
let nameCheck: string = AppConfig.APP_NAME
let versionCheck: string = AppConfig.VERSION
