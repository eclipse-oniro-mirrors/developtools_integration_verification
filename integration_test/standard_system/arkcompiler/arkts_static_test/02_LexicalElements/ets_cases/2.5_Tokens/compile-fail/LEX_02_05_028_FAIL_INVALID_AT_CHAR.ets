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
 * @id LEX_02_05_028_FAIL_INVALID_AT_CHAR
 * @expect compile-fail
 * @section 2.5
 * @design @ 字符在表达式位置非法（@ 仅可用于装饰器/注解）
 * @note 反向用例：表达式中使用 @ 应编译失败
 */
function testInvalidAtChar(): void {
  let x: int = @
}
