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
 * @id SEM_15_01_01_100_FAIL_OBJECT_LITERAL_STANDALONE
 * @expect compile-fail
 * @section 15.1.1
 * @design 验证对象字面量作为独立表达式应产生编译错误 ESE0127
 * @note 反向用例：对象字面量不能作为独立表达式
 */
function main(): void {
let obj = { name: 'test', value: 42
};
}
