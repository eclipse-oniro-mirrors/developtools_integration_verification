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
 * @id EXP_07_13_01_005_PASS_CHAINING_OPERATOR
 * @expect compile-pass
 * @section 7.13.1
 * @design 验证链式操作符 ?. 后的数组索引合法
 * @note 正向用例：obj?.arr[0] 中 ?. 之后数组类型 T，索引表达式合法
 */
class Holder {
  public items: string[] = ['x', 'y', 'z'];
}

function main(): void {
  let h: Holder | undefined = new Holder();
  let s: string | undefined = h?.items[1];
}
