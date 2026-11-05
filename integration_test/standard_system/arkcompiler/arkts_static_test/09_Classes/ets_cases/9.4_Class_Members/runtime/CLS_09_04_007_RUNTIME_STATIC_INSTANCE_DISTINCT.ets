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
 * @id CLS_09_04_007_RUNTIME_STATIC_INSTANCE_DISTINCT
 * @expect runtime
 * @section 9.4
 * @design static和instance同名成员运行时区分验�?
 * @note 运行时用例：验证static字段和instance字段独立
 */
class DualName {
  static value: int = 100
  value: string = "instance"
}

function main(): void {
  let d = new DualName()
  if (DualName.value != 100) {
    throw new Error("DualName.value should be 100")
  }
  if (d.value != "instance") {
    throw new Error("d.value should be 'instance'")
  }
  console.log("Static instance distinct verified")
}
