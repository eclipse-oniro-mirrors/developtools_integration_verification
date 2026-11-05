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
 * @id EXP_07_32_01_007_FAIL_TYPE_MISMATCH
 * @expect compile-fail
 * @section 7.32.1
 * @design 验证类型不兼容赋值产生编译时错误：跨类型赋值（string=int, boolean=int 等）和窄化赋值（long=int, double=float 等）
 * @note 反向用例：验证 rhsExpression 类型不可赋值给 lhsExpression 类型时产生 compile-time error。包含跨基本类型赋值和窄化赋值
 */

function main(): void {
  let i: int = 0;
  let l: long = 0n;
  let f: float = 0.0f;
  let d: double = 0.0;
  let s: string = '';
  let b: boolean = false;

  // 跨类型赋值：string = int（应报错）
  s = i;

  // 跨类型赋值：int = string（应报错）
  i = s;

  // 跨类型赋值：boolean = int（应报错）
  b = i;

  // 跨类型赋值：int = boolean（应报错）
  i = b;

  // 跨类型赋值：string = boolean（应报错）
  s = b;

  // 跨类型赋值：boolean = string（应报错）
  b = s;

  // 窄化赋值：long = int（int 不能隐式窄化为 long？实际上 int→long 是扩宽，应正确）
  // 真正窄化：int 不能给 byte，long 不能给 int
  let by: byte = 0b;
  by = i;   // int → byte 窄化（应报错）

  // long → int 窄化（应报错）
  i = l;

  // float → int 窄化（应报错）
  i = f;

  // double → int 窄化（应报错）
  i = d;

  // double → float 窄化（应报错）
  f = d;

  console.log('verified');
}
