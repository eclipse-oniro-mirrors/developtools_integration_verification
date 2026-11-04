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
 * @id SEM_15_09_01_100_FAIL_OVERRIDE_SIGNATURE
 * @expect compile-fail
 * @section 15.9.1
 * @design 验证覆写返回类型不匹配拒绝
 * @note 反向用例：覆写方法返回类型与父类不兼容
 */
class Base { process(x: int): int { return x; } }
class Derived extends Base { override process(x: int): string { return ''; } }
function main(): void {}
