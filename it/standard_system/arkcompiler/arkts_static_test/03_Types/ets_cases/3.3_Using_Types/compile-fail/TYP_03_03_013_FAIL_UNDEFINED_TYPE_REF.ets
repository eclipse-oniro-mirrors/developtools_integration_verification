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
 * @id TYP_03_03_013_FAIL_UNDEFINED_TYPE_REF
 * @expect compile-fail
 * @section 3.3
 * @design 引用未定义的类型名应编译失败
 * @note 反向用例：使用不存在的类型名作类型引用
 */
function testUndefinedTypeRefFail(): void {
  let x: NonExistentType = 1
  let y: AlsoMissing = "hi"
}