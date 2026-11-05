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
 * @id EXP_07_13_01_004_PASS_REF_TYPE_FIELD_MODIFY
 * @expect compile-pass
 * @section 7.13.1
 * @design 验证引用类型数组元素的字段可通过结果变量修改
 * @note 正向用例：RefType 数组通过索引取值后修改字段，编译通过
 */
class RefType {
  public field: int = 42;
}

function main(): void {
  let objects: RefType[] = [new RefType(), new RefType()];
  let obj: RefType = objects[1];
  obj.field = 777;
}
