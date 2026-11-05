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
 * @id EXP_07_10_01_003_PASS_READONLY_STATIC_ACCESS
 * @expect compile-pass
 * @section 7.10.1
 * @design readonly 静态字段访问：通过 ClassName.READONLY_FIELD 读取只读静态字段（value 语义）
 * @note 正向用例：验证 readonly 静态字段访问返回 value，不可作为左值
 */
class Constants {
    public static readonly MAX_SIZE: int = 1024
    public static readonly MIN_SIZE: int = 64
    public static readonly DEFAULT_NAME: string = 'default'
}
let max: int = Constants.MAX_SIZE
let min: int = Constants.MIN_SIZE
let name: string = Constants.DEFAULT_NAME
