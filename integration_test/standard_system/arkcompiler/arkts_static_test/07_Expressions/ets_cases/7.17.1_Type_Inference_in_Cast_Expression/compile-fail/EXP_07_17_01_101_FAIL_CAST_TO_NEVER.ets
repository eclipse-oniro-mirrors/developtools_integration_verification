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
 * @id EXP_07_17_01_101_FAIL_CAST_TO_NEVER
 * @expect compile-fail
 * @section 7.17.1
 * @design Cast表达式中目标类型为never应产生编译时类型错误
 * @note 反向用例：验证Cast表达式目标类型为never时编译器应拒绝
 */
function test(): void {
    let x: int = 1 as never
}
