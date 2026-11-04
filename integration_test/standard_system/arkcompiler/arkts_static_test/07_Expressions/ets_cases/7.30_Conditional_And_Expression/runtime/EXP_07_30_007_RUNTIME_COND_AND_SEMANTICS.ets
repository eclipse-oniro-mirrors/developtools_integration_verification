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
 * @id EXP_07_30_007_RUNTIME_COND_AND_SEMANTICS
 * @expect runtime
 * @section 7.30
 * @design 楠岃瘉 boolean && 杩愮畻绗︾殑杩愯鏃惰涔夛細鐪熷€艰〃姝ｇ‘鎬с€佺煭璺涓猴紙LHS 涓?false 鏃?RHS 涓嶆墽琛岋級銆侀摼寮忚繍绠椼€佺粨鍚堝緥銆佸彉閲忚繍绠椼€佷笌 & 涓€鑷存€?
 * @note 杩愯鏃剁敤渚嬶細楠岃瘉 && 鐨勮繍琛屾椂鍊艰涔夊拰鐭矾鐗规€э紝鍏?24 涓柇瑷€
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

  // === && (Conditional AND) 鐪熷€艰〃 ===
  assert((T && T) == true, 'true && true should be true');
  assert((T && F) == false, 'true && false should be false');
  assert((F && T) == false, 'false && true should be false');
  assert((F && F) == false, 'false && false should be false');

  // === 鐭矾琛屼负楠岃瘉 ===
  effectFlag = false;
  let short1: boolean = F && setEffect();
  assert(short1 == false, "false && true should be false (short-circuit)");
  assert(effectFlag == false, 'short-circuit: RHS should NOT be evaluated when LHS is false');

  effectFlag = false;
  let short2: boolean = T && setEffect();
  assert(short2 == true, "true && true should be true (no short-circuit)");
  assert(effectFlag == true, 'no short-circuit: RHS SHOULD be evaluated when LHS is true');

  // === 閾惧紡杩愮畻 ===
  assert((T && T && T) == true, 'true && true && true should be true');
  assert((T && T && F) == false, 'true && true && false should be false');
  assert((T && F && T) == false, 'true && false && true should be false');
  assert((F && T && T) == false, 'false && true && true should be false');

  // === 缁撳悎寰嬮獙璇侊細((a) && (b)) && (c) 绛変环浜?(a) && ((b) && (c)) ===
  let a: boolean = true;
  let b: boolean = false;
  let c: boolean = true;
  let left: boolean = (a && b) && c;
  let right: boolean = a && (b && c);
  assert(left == right, "(a&&b)&&c should equal a&&(b&&c) for a=true,b=false,c=true");
  assert(left == false, "(true&&false)&&true should be false");

  let left2: boolean = (T && T) && F;
  let right2: boolean = T && (T && F);
  assert(left2 == right2, "(T&&T)&&F should equal T&&(T&&F)");
  assert(left2 == false, "(true&&true)&&false should be false");

  // === 鍙橀噺杩愮畻 ===
  assert((a && a) == true, 'a && a where a=true should be true');
  assert((a && b) == false, 'a && b where a=true, b=false should be false');
  assert((b && a) == false, 'b && a where b=false, a=true should be false');
  assert((b && b) == false, 'b && b where b=false should be false');

  // === 涓?& 鐨勪竴鑷存€ч獙璇?(缁撴灉鐩稿悓) ===
  assert((T && T) == (T & T), 'true && true should equal true & true');
  assert((T && F) == (T & F), 'true && false should equal true & false');
  assert((F && T) == (F & T), 'false && true should equal false & true');
  assert((F && F) == (F & F), 'false && false should equal false & false');

  console.log('verified');
}
