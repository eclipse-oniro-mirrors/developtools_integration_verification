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
 * @id TYP_03_06_04_015_RUNTIME_BOOLEAN_AS_OBJECT
 * @expect runtime
 * @section 3.6.4
 * @design boolean 装箱为 Object 后 instanceof 检查
 * @note 运行时用例：boolean 作 Object 子类型
 */
function main(): void {
  let b: boolean = true
  let o: Object = b
  if (!(o instanceof Object)) {
    throw new Error("boolean as Object failed instanceof")
  }

  let arr: Object[] = [true, false, true]
  if (arr.length != 3) {
    throw new Error("Object[] length failed")
  }

  console.log("Boolean as Object verified")
}