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
 * @id EXP_07_31_006_RUNTIME_COND_OR_SEMANTICS
 * @expect runtime
 * @section 7.31
 * @design 验证 boolean || 运算符的运行时语义：真值表正确性、短路行为（LHS 为 true 时 RHS 不执行）、链式运算、结合律、变量运算、与 | 一致性
 * @note 运行时用例：验证 || 的运行时值语义和短路特性，共 24 个断言
 */
let effectFlag: boolean = false;

function setEffect(): boolean {
  effectFlag = true;
  return true;
}

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

  // === || (Conditional OR) 真值表 ===
  assert((T || T) == true, 'true || true should be true');
  assert((T || F) == true, 'true || false should be true');
  assert((F || T) == true, 'false || true should be true');
  assert((F || F) == false, 'false || false should be false');

  // === 短路行为验证 ===
  effectFlag = false;
  let short1: boolean = T || setEffect();
  assert(short1 == true, "true || true should be true (short-circuit)");
  assert(effectFlag == false, 'short-circuit: RHS should NOT be evaluated when LHS is true');

  effectFlag = false;
  let short2: boolean = F || setEffect();
  assert(short2 == true, "false || true should be true (no short-circuit)");
  assert(effectFlag == true, 'no short-circuit: RHS SHOULD be evaluated when LHS is false');

  // === 链式运算 ===
  assert((T || T || T) == true, 'true || true || true should be true');
  assert((T || T || F) == true, 'true || true || false should be true');
  assert((T || F || T) == true, 'true || false || true should be true');
  assert((F || F || F) == false, 'false || false || false should be false');

  // === 结合律验证：((a) || (b)) || (c) 等价于 (a) || ((b) || (c)) ===
  let a: boolean = false;
  let b: boolean = false;
  let c: boolean = true;
  let left: boolean = (a || b) || c;
  let right: boolean = a || (b || c);
  assert(left == right, "(a||b)||c should equal a||(b||c) for a=false,b=false,c=true");
  assert(left == true, "(false||false)||true should be true");

  let left2: boolean = (F || F) || T;
  let right2: boolean = F || (F || T);
  assert(left2 == right2, "(F||F)||T should equal F||(F||T)");
  assert(left2 == true, "(false||false)||true should be true");

  // === 变量运算 ===
  let x: boolean = true;
  let y: boolean = false;
  assert((x || x) == true, 'x || x where x=true should be true');
  assert((x || y) == true, 'x || y where x=true, y=false should be true');
  assert((y || x) == true, 'y || x where y=false, x=true should be true');
  assert((y || y) == false, 'y || y where y=false should be false');

  // === 与 | 的一致性验证 (结果相同) ===
  assert((T || T) == (T | T), 'true || true should equal true | true');
  assert((T || F) == (T | F), 'true || false should equal true | false');
  assert((F || T) == (F | T), 'false || true should equal false | true');
  assert((F || F) == (F | F), 'false || false should equal false | false');

  console.log('verified');
}
