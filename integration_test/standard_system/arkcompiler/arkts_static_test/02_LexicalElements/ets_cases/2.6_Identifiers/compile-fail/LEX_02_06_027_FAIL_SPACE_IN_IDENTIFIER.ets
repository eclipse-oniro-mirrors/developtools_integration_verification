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
 * @id LEX_02_06_027_FAIL_SPACE_IN_IDENTIFIER
 * @expect compile-fail
 * @section 2.6
 * @design 标识符内含空格不合法
 * @note 反向用例：my var 被解析为两个 Token
 */
function testSpaceInIdentifier(): void {
  let my var: int = 1
}
