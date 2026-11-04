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
 * @id EXP_07_32_03_007_PASS_NESTED_LHS
 * @expect compile-pass
 * @section 7.32.3
 * @design 验证嵌套左值表达式的编译通过：嵌套字段访问、字段中的数组索引、数组中的字段访问等组合形式
 * @note 正向用例：嵌套的左值表达式（如 obj.inner.field = x, obj.arr[0] = x）也应编译通过，验证复杂左值路径
 */

class Inner {
  public value: int = 0;
}

class Container {
  public inner: Inner = new Inner();
  public items: int[] = [0, 0, 0];
  public records: Inner[] = [new Inner(), new Inner()];
}

function main(): void {
  let c: Container = new Container();

  // 嵌套字段：obj.inner.field = value
  c.inner.value = 99;

  // 字段中的数组索引：obj.arr[idx] = value
  c.items[0] = 10;
  c.items[1] = 20;

  // 数组中的字段访问：obj.records[i].field = value
  c.records[0].value = 55;
  c.records[1].value = 66;

  // 多层嵌套
  let arrOfContainers: Container[] = [new Container(), new Container()];
  arrOfContainers[0].inner.value = 77;
  arrOfContainers[1].items[2] = 88;

  console.log('verified');
}
