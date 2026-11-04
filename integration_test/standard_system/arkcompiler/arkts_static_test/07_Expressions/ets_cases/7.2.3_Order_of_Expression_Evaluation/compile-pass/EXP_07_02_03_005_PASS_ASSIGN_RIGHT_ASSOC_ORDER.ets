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
 * @id EXP_07_02_03_005_PASS_ASSIGN_RIGHT_ASSOC_ORDER
 * @expect compile-pass
 * @section 7.2.3
 * @design 验证赋值右结合求值顺序编译通过：LHS/MID/RHS 从左到右求值，赋值从右到左
 * @note 正向用例：验证该特性编译通过的正确用法
 */
class TagBox {
  public val: string;
  constructor(s: string) {
    this.val = s;
  }
}

function main(): void {
  let a: TagBox = new TagBox('a');
  let b: TagBox = new TagBox('b');
  let c: TagBox = new TagBox('c');
  let result: string = a.val = b.val = c.val = 'final';
  console.log('' + a.val + b.val + c.val + result);
}
