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
 * @id EXP_07_26_022_RUNTIME_UNSIGNED_RIGHT_FORMULA
 * @expect runtime
 * @section 7.26
 * @design 楠岃瘉 >>> 鐨勫叕寮忓畾涔夊璐熷€兼垚绔嬶細n >>> s = (n >> s) + (2 << ~s)锛坕nt锛?
 *       鍜?n >>> s = (n >> s) + ((2 as long) << ~s)锛坙ong锛?
 * @note 杩愯鏃剁敤渚嬶細楠岃瘉 spec 涓?>>> 鍏紡
 *       int锛氬璐?n 楠岃瘉 (n >> s) + (2 << ~s) == n >>> s
 *       long锛氬璐?n 楠岃瘉 (n >> s) + (2L << ~s) == n >>> s
 *       ArkTS 涓嶆敮鎸?L 鍚庣紑锛屼娇鐢?long 鍙橀噺瀹炵幇
 */
function main(): void {
    // int 楠岃瘉锛?1 >>> 31 = 1
    let n: int = -1;
    let s: int = 31;
    let expected: int = n >>> s;
    // 鍏紡锛?n >> s) + (2 << ~s)
    let formula: int = (n >> s) + (2 << ~s);
    if (formula != expected) {
    throw new Error('assert1 failed: int formula != >>>, ' + formula + ' != ' + expected);
  }
  }
  }
  }
    }

    // int 楠岃瘉锛?5 >>> 2
    n = -5;
    s = 2;
    expected = n >>> s;
    formula = (n >> s) + (2 << ~s);
    if (formula != expected) {
    throw new Error('assert2 failed: int formula2 != >>>, ' + formula + ' != ' + expected);
  }
  }
  }
  }
    }

    // int 楠岃瘉锛?2147483648 >>> 1
    n = -2147483647 - 1;
    s = 1;
    expected = n >>> s;
    formula = (n >> s) + (2 << ~s);
    if (formula != expected) {
    throw new Error('assert3 failed: int formula3 != >>>, ' + formula + ' != ' + expected);
  }
  }
  }
  }
    }

    // long 楠岃瘉锛?1 >>> 63 = 1
    let ln: long = -1;
    let ls: long = 63;
    let lexpected: long = ln >>> ls;
    // 鍏紡锛?n >> s) + ((2 as long) << ~s)
    let two: long = 2;
    let lformula: long = (ln >> ls) + (two << ~ls);
    if (lformula != lexpected) {
    throw new Error('assert4 failed: long formula != >>>, ' + lformula + ' != ' + lexpected);
  }
  }
  }
  }
    }

    // long 楠岃瘉锛?10 >>> 2
    ln = -10;
    ls = 2;
    lexpected = ln >>> ls;
    lformula = (ln >> ls) + (two << ~ls);
    if (lformula != lexpected) {
    throw new Error('assert5 failed: long formula2 != >>>, ' + lformula + ' != ' + lexpected);
  }
  }
  }
  }
    }
console.log('verified');
}
