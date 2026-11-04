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
 * @id STMT_08_04_016_FAIL_duplicate_const_same_scope
 * @expect compile-fail
 * @section 8.4
 * @design 测试同一作用域重复const声明同名常量编译错误
 * @note 同一块作用域中不能重复声明同名const常量，与let规则一致
 */
function testDuplicateConstSameScope(): void {
    const name: string = "first";
    const name: string = "second";
}
