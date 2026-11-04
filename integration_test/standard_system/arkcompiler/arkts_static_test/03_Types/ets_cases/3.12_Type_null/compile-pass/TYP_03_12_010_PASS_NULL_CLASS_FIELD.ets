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
 * @id TYP_03_12_010_PASS_NULL_CLASS_FIELD
 * @expect compile-pass
 * @section 3.12
 * @design 类字段类型为 T | null，初始化为 null
 * @note 正向用例：验证 null 在类字段中的使用
 */
class NullableField10 {
  name: string | null = null
  value: int | null = null
}

function testNullClassField(): void {
  let obj: NullableField10 = new NullableField10()
  obj.name = "test"
  obj.name = null
  obj.value = 10
  obj.value = null
}