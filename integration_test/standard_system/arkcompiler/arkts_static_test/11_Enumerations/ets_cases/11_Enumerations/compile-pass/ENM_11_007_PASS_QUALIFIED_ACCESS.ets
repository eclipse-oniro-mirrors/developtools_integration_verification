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
 * @id ENM_11_007_PASS_QUALIFIED_ACCESS
 * @expect compile-pass
 * @section 11
 * @design 枚举成员必须加类型名限定
 * @note 正向用例：Color.Red
 */
enum Color7 { Red, Green, Blue, Default = Red }

function testQualifiedAccess(): void {
  let c: Color7 = Color7.Red
}