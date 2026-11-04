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
 * @id SEM_15_07_02_100_FAIL_RETURN_MISMATCH
 * @expect compile-fail
 * @section 15.7.2
 * @design 验证返回类型不匹配拒绝：声明的 int 返回 string 应报错
 * @note 反向用例：实际返回类型与声明不匹配时编译拒绝
 */
function getValue(): int { return 'hello'; }
function main(): void {
    let v: int = getValue();
}
