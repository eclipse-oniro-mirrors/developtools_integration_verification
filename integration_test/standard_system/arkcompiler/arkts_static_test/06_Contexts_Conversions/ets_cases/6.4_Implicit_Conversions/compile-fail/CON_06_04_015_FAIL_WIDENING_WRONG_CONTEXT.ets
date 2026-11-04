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
 * @id CON_06_04_015_FAIL_WIDENING_WRONG_CONTEXT
 * @expect compile-fail
 * @section 6.4
 * @design 在非赋值类上下文中使用 widening 的无效方式（composite literal 中错误类型）
 * @note 反向用例：对象字面量中不兼容类型的字段值应编译失败
 */
interface Data {
  value: int
}

function testWideningWrongContextFail(): void {
  let d: Data = { value: 'not a number' }
}
