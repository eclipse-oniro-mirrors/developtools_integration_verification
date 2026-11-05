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
 * @id EXP_07_27_03_025_RUNTIME_EQUAL_STRINGS
 * @expect runtime
 * @section 7.27.3
 * @design 验证相同字符串的关系运算符运行时行为
 *  * @note 运行时用例：验证该场景的运行时行为
 */
function main(): void {
    let s: string = 'abc';

    // 相同字符串：< 和 > 为 false，<= 和 >= 为 true
    if (s < s != false) {
    throw new Error("assertion failed: \"abc\" < \"abc\'');
  }
  }
  }
  }
    }
    if (s > s != false) {
    throw new Error("assertion failed: \"abc\" > \"abc\'');
  }
  }
  }
  }
    }
    if (s <= s != true) {
    throw new Error("assertion failed: \"abc\" <= \"abc\'');
  }
  }
  }
  }
    }
    if (s >= s != true) {
    throw new Error("assertion failed: \"abc\" >= \"abc\'');
  }
  }
  }
  }
    }

    // 空字符串自身相等
    let empty: string = '';
    if (empty < empty != false) {
    throw new Error("assertion failed: \"\" < \"\'');
  }
  }
  }
  }
    }
    if (empty > empty != false) {
    throw new Error("assertion failed: \"\" > \"\'');
  }
  }
  }
  }
    }
    if (empty <= empty != true) {
    throw new Error("assertion failed: \"\" <= \"\'');
  }
  }
  }
  }
    }
    if (empty >= empty != true) {
    throw new Error("assertion failed: \"\" >= \"\'');
  }
  }
  }
  }
    }

    // 不同变量相同内容
    let x: string = 'xyz';
    let y: string = 'xyz';
    if (x < y != false) {
    throw new Error("assertion failed: x < y (both \"xyz\")");
  }
  }
  }
  }
    }
    if (x <= y != true) {
    throw new Error("assertion failed: x <= y (both \"xyz\")");
  }
  }
  }
  }
    }
    if (x > y != false) {
    throw new Error("assertion failed: x > y (both \"xyz\")");
  }
  }
  }
  }
    }
    if (x >= y != true) {
    throw new Error("assertion failed: x >= y (both \"xyz\")");
  }
  }
  }
  }
    }
console.log('verified');
}
