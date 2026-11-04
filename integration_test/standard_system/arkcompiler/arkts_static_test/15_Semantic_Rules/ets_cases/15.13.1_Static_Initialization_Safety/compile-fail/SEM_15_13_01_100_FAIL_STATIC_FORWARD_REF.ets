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
 * @id SEM_15_13_01_100_FAIL_STATIC_FORWARD_REF
 * @expect compile-fail
 * @section 15.13.1
 * @design 验证静态初始化前向引用拒绝
 * @note 反向用例：静态字段在声明前引用应报错
 */
class BadConfig {
    public static derived: int = BadConfig.base * 2;
    public static base: int = 10;
}
function main(): void {}
