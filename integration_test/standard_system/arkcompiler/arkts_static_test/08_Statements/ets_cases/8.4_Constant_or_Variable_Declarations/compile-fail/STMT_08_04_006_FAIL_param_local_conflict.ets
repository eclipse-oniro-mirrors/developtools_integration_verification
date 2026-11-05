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
 * @id STMT_08_04_006_FAIL_param_local_conflict
 * @expect compile-fail
 * @section 8.4
 * @design 测试参数与局部变量同名编译错误
 * @note 规范明确：参数和局部变量在同一作用域同名 -> 编译时错误
 */
function testParamLocalConflict(item: boolean): void {
    let item: int[] = [];
}
