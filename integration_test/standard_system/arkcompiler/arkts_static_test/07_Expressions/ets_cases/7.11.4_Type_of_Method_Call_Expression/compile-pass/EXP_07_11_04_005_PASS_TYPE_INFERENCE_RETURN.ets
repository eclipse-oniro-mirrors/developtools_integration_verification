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
 * @id EXP_07_11_04_005_PASS_TYPE_INFERENCE_RETURN
 * @expect compile-pass
 * @section 7.11.4
 * @design 验证方法返回值通过类型推导（let x = obj.method()），编译通过
 * @note 正向用例：方法返回类型通过 let 推导，不需要显式类型注解，编译通过
 */
class Factory {
  static createName(): string {
    return 'ArkTS';
  }
}

function main(): void {
  let name = Factory.createName();
}
