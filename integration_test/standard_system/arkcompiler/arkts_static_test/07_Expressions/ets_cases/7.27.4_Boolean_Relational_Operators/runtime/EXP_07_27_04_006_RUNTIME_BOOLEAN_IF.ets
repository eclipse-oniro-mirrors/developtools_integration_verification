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
 * @id EXP_07_27_04_006_RUNTIME_BOOLEAN_IF
 * @expect runtime
 * @section 7.27.4
 * @design 布尔关系在控制流中使用

 * @note 运行时用例：实际执行验证布尔关系控制流
 */
function main(): void {
  let flag: boolean = false
  if (flag < true) {
    console.log('false < true in if')
  }
  let val: boolean = true > false
  if (val) {
    console.log('true > false is truthy')
  }
  console.log('verified')
}
