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
 * @id SEM_15_07_02_101_FAIL_MISSING_RETURN
 * @expect compile-fail
 * @section 15.7.2
 * @design 验证缺少 return 语句：非 void 函数缺少 return 应报错
 * @note 反向用例：int 返回类型函数没有 return 语句
 */
function getAnswer(): int { }
function main(): void {
    let v: int = getAnswer();
}
