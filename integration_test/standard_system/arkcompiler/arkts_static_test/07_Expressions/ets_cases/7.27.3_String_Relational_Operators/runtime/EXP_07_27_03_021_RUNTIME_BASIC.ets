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
 * @id EXP_07_27_03_021_RUNTIME_BASIC
 * @expect runtime
 * @section 7.27.3
 * @design 验证字符串四个关系运算符的基本运行时行为
 *  * @note 运行时用例：验证该场景的运行时行为
 */
function main(): void {
    let a: string = 'abc';
    let b: string = 'def';

    // a < b: "abc" < "def", 'a'(97) < 'd'(100)
    if (a < b != true) {
    throw new Error('assertion failed: abc < def');
  }
  }
  }
  }
    }

    // a <= b
    if (a <= b != true) {
    throw new Error('assertion failed: abc <= def');
  }
  }
  }
  }
    }

    // a > b: false
    if (a > b != false) {
    throw new Error('assertion failed: abc > def');
  }
  }
  }
  }
    }

    // a >= b: false
    if (a >= b != false) {
    throw new Error('assertion failed: abc >= def');
  }
  }
  }
  }
    }

    // b > a
    if (b > a != true) {
    throw new Error('assertion failed: def > abc');
  }
  }
  }
  }
    }

    // b >= a
    if (b >= a != true) {
    throw new Error('assertion failed: def >= abc');
  }
  }
  }
  }
    }

    // b < a: false
    if (b < a != false) {
    throw new Error('assertion failed: def < abc');
  }
  }
  }
  }
    }

    // b <= a: false
    if (b <= a != false) {
    throw new Error('assertion failed: def <= abc');
  }
  }
  }
  }
    }
console.log('verified');
}
