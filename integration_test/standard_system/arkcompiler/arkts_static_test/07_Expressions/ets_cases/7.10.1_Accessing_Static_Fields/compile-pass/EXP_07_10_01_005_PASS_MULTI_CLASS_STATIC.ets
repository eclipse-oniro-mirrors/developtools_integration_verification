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
 * @id EXP_07_10_01_005_PASS_MULTI_CLASS_STATIC
 * @expect compile-pass
 * @section 7.10.1
 * @design 多类静态字段独立访问：不同类的静态字段通过各自类名访问
 * @note 正向用例：验证不同类的静态字段相互独立，通过类名区分
 */
class Logger {
    public static level: int = 2
    public static tag: string = 'APP'
}
class Database {
    public static poolSize: int = 10
    public static timeout: int = 5000
}
let logLevel: int = Logger.level
let dbTimeout: int = Database.timeout
let dbPool: int = Database.poolSize
