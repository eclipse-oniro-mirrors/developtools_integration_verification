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
 * @id LEX_02_03_046_FAIL_DECORATOR_SPACE
 * @expect compile-fail
 * @section 2.3
 * @design 装饰器中空格
 * @note compile-fail 用例：验证编译器拒绝 @ 和名称之间有空格
 */

// @ 和名称之间有空格，编译失败
@ Entry
function main(): void {
}
