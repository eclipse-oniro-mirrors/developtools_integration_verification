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
 * @id EXP_07_27_03_022_RUNTIME_EMPTY_PREFIX
 * @expect runtime
 * @section 7.27.3
 * @design 验证空字符串和前缀规则的词典序运行时行为
 *  * @note 运行时用例：验证该场景的运行时行为
 */
function main(): void {
    let empty: string = '';
    let a: string = 'a';
    let ab: string = 'ab';
    let abc: string = 'abc';

    // 空字符串小于非空字符串
    if (empty < a != true) {
    throw new Error("assertion failed: \"\" < \"a\'');
  }
  }
  }
  }
    }
    if (empty > a != false) {
    throw new Error("assertion failed: \"\" > \"a\'');
  }
  }
  }
  }
    }
    if (empty <= a != true) {
    throw new Error("assertion failed: \"\" <= \"a\'');
  }
  }
  }
  }
    }
    if (empty >= a != false) {
    throw new Error("assertion failed: \"\" >= \"a\'');
  }
  }
  }
  }
    }

    // 空字符串等于自身
    if (empty < empty != false) {
    throw new Error("assertion failed: \"\" < \"\'');
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
    if (empty > empty != false) {
    throw new Error("assertion failed: \"\" > \"\'');
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

    // 前缀规则：较短字符串 < 较长（当共有前缀相同）
    if (a < ab != true) {
    throw new Error("assertion failed: \"a\" < \"ab\'');
  }
  }
  }
  }
    }
    if (ab < abc != true) {
    throw new Error("assertion failed: \"ab\" < \"abc\'');
  }
  }
  }
  }
    }
    if (abc > ab != true) {
    throw new Error("assertion failed: \"abc\" > \"ab\'');
  }
  }
  }
  }
    }
    if (ab > a != true) {
    throw new Error("assertion failed: \"ab\" > \"a\'');
  }
  }
  }
  }
    }
console.log('verified');
}
