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
 * @id ENM_11_04_009_PASS_ENUM_INSTANCE_METHOD_TYPES
 * @expect compile-pass
 * @section 11.4
 * @design 枚举实例方法 toString/valueOf/getName 类型检查
 * @note 正向用例：验证枚举实例方法返回类型
 */
enum MethodLevel { Low, High = 10 }
function testEnumInstanceMethodTypes(): void {
  let level: MethodLevel = MethodLevel.High
  let text: string = level.toString()
  let name: string = level.getName()
  let value: int = level.valueOf()
}
