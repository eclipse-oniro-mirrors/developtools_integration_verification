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
 * @id EXP_07_29_02_006_RUNTIME_BOOLEAN_LOGICAL
 * @expect runtime
 * @section 7.29.2
 * @design 验证 boolean 类型 &、^、| 运算符的运行时真值表正确性，覆盖全部 12 种真值表组合 + 变量运算 + 自身运算
 * @note 运行时用例：验证 boolean 逻辑运算符的运行时值语义，共 24 个断言
 */
function assert(cond: boolean, msg: string): void {
  if (!cond) {
    throw new Error('FAIL: ' + msg);
  }
  }
  }
  }
  }
}

function main(): void {
  let T: boolean = true;
  let F: boolean = false;

  // === & (AND) 真值表 ===
  // true & true == true
  assert((T & T) == true, 'true & true should be true');

  // true & false == false
  assert((T & F) == false, 'true & false should be false');

  // false & true == false
  assert((F & T) == false, 'false & true should be false');

  // false & false == false
  assert((F & F) == false, 'false & false should be false');

  // === ^ (XOR) 真值表 ===
  // true ^ true == false
  assert((T ^ T) == false, 'true ^ true should be false');

  // true ^ false == true
  assert((T ^ F) == true, 'true ^ false should be true');

  // false ^ true == true
  assert((F ^ T) == true, 'false ^ true should be true');

  // false ^ false == false
  assert((F ^ F) == false, 'false ^ false should be false');

  // === | (OR) 真值表 ===
  // true | true == true
  assert((T | T) == true, 'true | true should be true');

  // true | false == true
  assert((T | F) == true, 'true | false should be true');

  // false | true == true
  assert((F | T) == true, 'false | true should be true');

  // false | false == false
  assert((F | F) == false, 'false | false should be false');

  // === 变量与常量组合 ===
  let a: boolean = true;
  let b: boolean = false;

  // 变量 & 常量
  assert((a & true) == true, 'true-var & true should be true');
  assert((b & true) == false, 'false-var & true should be false');

  // 变量 ^ 常量
  assert((a ^ false) == true, 'true-var ^ false should be true');
  assert((b ^ false) == false, 'false-var ^ false should be false');

  // 变量 | 常量
  assert((a | false) == true, 'true-var | false should be true');
  assert((b | false) == false, 'false-var | false should be false');

  // === 自身运算 ===
  assert((a & a) == true, 'a & a where a=true should be true');
  assert((a ^ a) == false, 'a ^ a where a=true should be false');
  assert((a | a) == true, 'a | a where a=true should be true');
  assert((b & b) == false, 'b & b where b=false should be false');
  assert((b ^ b) == false, 'b ^ b where b=false should be false');
  assert((b | b) == false, 'b | b where b=false should be false');

  console.log('verified');
}
